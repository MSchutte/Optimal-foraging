setwd("C:/Users/Manon Schutte/Documents/Studie - ResMas/Programming The Next Step/HillsOFPsychRev Online Data/PsychRev Online Data")
rm(list=ls())
load("onlinedata.Rdata")
freq <- read.table("datafreqlistlog.txt")
datapatches <- read.table("datagroups.txt")

# Only include animals that are in both data matrices
datapatches <- datapatches[datapatches$V1 %in% freq$V1, ]
freq <- freq[freq$V1 %in% datapatches$V1, ]

freq <- freq[order(freq$V2, decreasing = T), ]

# Combine all data in one matrix and rename columns
for (i in 1:nrow(datapatches)){
  datapatches$frequency[i] <- freq$V2[which(freq$V1 == as.character(datapatches$V1[i]), arr.ind = T)]
}
 
names(datapatches)[names(datapatches) == "V1"] = "animal" 
names(datapatches)[names(datapatches) == "V2"] = "patch" 

### Data simulation
bGlobal <- 7.22
bLocal <- 5.03
chosenLength <- animalLength
itemsGenerated <- character()
exploredPatch <- numeric()

while (length(itemsGenerated) < chosenLength){
  # Global search (starting word amongst 50 most frequent words)
  start <- sample(1:50, 1)
  currentItem <- as.character(freq$V1[start])
  while (currentItem %in% itemsGenerated){
    start <- sample(1:50, 1)
    currentItem <- as.character(freq$V1[start])
  }
  
  # Set the corresponding patch of the word. If word is in multiple patches, choose one randomly
  itemPatches <- datapatches$patch[which(datapatches$animal == currentItem, arr.ind = T)]
  if (length(itemPatches) == 1){
    currentPatch <- itemPatches
  } else {
    currentPatch <- sample(itemPatches, 1)
  }

  
  itemsGenerated <- c(itemsGenerated, currentItem)
  exploredPatch <- c(exploredPatch, currentPatch) 
  
  patchIndices <- which(datapatches$patch == currentPatch, arr.ind = T) 
  patchAnimals <- as.character(datapatches$animal[patchIndices])
  
  goPatch <- T
  
  # Local Search (within patch)
  while (goPatch == T & length(itemsGenerated) < chosenLength){
    print(currentItem)
    retrievalStrength <- vector()
    globalCue <- vector()
    localCue <- vector()
    
    for(i in 1:length(patchAnimals)){
      globalCue[i] <- datapatches$frequency[patchIndices[i]]
      localCue[i] <- ancos[currentItem, patchAnimals[i]]
    }
    retrievalStrength <- (globalCue^bGlobal)*(localCue^bLocal)/sum((globalCue^bGlobal)*(localCue^bLocal))
    retrievalStrength[which(patchAnimals == currentItem)] <- 0
    nextWord <- patchAnimals[which.max(retrievalStrength)]
    
    # Return to global search if the next item is already in there (i.e. patch is 'exploited')
    if (nextWord %in% itemsGenerated){
      goPatch <- F
    } else{
      currentItem <- nextWord
      itemsGenerated <- c(itemsGenerated, currentItem)
      exploredPatch <- c(exploredPatch, currentPatch)
    }
  }
}
  
# Network visualisation
library(networkD3)

allPatches <- unique(datapatches$V2)
animalList <- list(name = "Animals", children = list())
patchNames <- c()
for(i in 1:length(allPatches)){
  patchAnimals <- which(datapatches$V2 == allPatches[i], arr.ind = T) 
  kids <- as.character(datapatches$V1[patchAnimals])
  animalList[[2]][[i]] <- list(name = patchNames[i], children = as.list(kids))
}


radialNetwork(animalList)

