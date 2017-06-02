# Server of the Shiny web application 'Simulation of Optimal Foraging'

library(shiny)
library(networkD3)

### Set up data 
setwd("C:/Users/Manon Schutte/Documents/Studie - ResMas/Programming The Next Step/HillsOFPsychRev Online Data/PsychRev Online Data")
rm(list=ls())
load("onlinedata.Rdata")
freq <- read.table("datafreqlistlog.txt")
datapatches <- read.table("datagroups.txt")
names(datapatches)[names(datapatches) == "V1"] = "animal" 
names(datapatches)[names(datapatches) == "V2"] = "patch"
datapatches <- datapatches[datapatches$patch > 7, ]
datapatches$patch <- datapatches$patch - 7

# Only include animals that are in both data matrices
datapatches <- datapatches[datapatches$animal %in% freq$V1, ]
freq <- freq[freq$V1 %in% datapatches$animal, ]

freq <- freq[order(freq$V2, decreasing = T), ]

# Combine all data in one matrix
for (i in 1:nrow(datapatches)){
  datapatches$frequency[i] <- freq$V2[which(freq$V1 == as.character(datapatches$animal[i]), arr.ind = T)]
}

### Create list structure for radial network
allPatches <- unique(datapatches$patch)
animalList <- list(name = "Animals", children = list())
patchNames <- c("Rabbits", "Insectivores", "Arctic Animals", "Bears", "Animals with Fur", "Bovine",
                "Weasels", "Australian Animals", "Beasts of burden", "Deers", "Primates", "Feline",
                "Rodents", "North American Animals", "Farm Animals", "Canine", "Reptiles", "African Animals",
                "Insects", "Fish", "Pets", "Water Animals", "Birds")
for(i in 1:length(allPatches)){
  patchAnimals <- which(datapatches$patch == allPatches[i], arr.ind = T) 
  kids <- as.character(datapatches$animal[patchAnimals])
  animalList[[2]][[i]] <- list(name = patchNames[i], children = as.list(kids))
}

##### Function for data simulation
foraging <- function(chosenLength){
  bGlobal <- 7.22
  bLocal <- 5.03
  itemsGenerated <- character()
  exploredPatch <- character()
  
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
    exploredPatch <- c(exploredPatch, patchNames[currentPatch]) 
    
    patchIndices <- which(datapatches$patch == currentPatch, arr.ind = T) 
    patchAnimals <- as.character(datapatches$animal[patchIndices])
    
    goPatch <- T
    
    # Local Search (within patch)
    while (goPatch == T & length(itemsGenerated) < chosenLength){
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
        exploredPatch <- c(exploredPatch, patchNames[currentPatch])
      }
    }
    searchResults <- data.frame(itemsGenerated, exploredPatch)
    colnames(searchResults) <- c("Animal", "Category")
  }
  return(searchResults)
}

### Define server logic
shinyServer(function(input, output) {
  
  output$generateditems <- renderTable({
    input$goButton
    isolate({
      foraging(input$animalsLength)
    })
  })
  
  output$foragingnetwork <- renderRadialNetwork({
    radialNetwork(animalList, fontSize = 13)
  })
  
})
