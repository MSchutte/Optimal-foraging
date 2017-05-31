setwd("C:/Users/Manon Schutte/Documents/Studie - ResMas/Programming The Next Step/HillsOFPsychRev Online Data/PsychRev Online Data")
rm(list=ls())
load("onlinedata.Rdata")

cos_sim = ancos
# Search environment

africanAnimals <- c("aardvark", "ankole", "antelope", "aoudad", "blesbok", "bontebok", "buffalo", "bushbaby", "bushbuck", "bushpig", "camel", "caracal", "chameleon", "cheetah",
                    "chimpanzee", "chivet", "cliffchat", "cobra", "colobus", "cusimanse", "dassie", "dikdik", "duiker", "eland", "elephant", "fennecfox", "gazelle", "gemsbok",
                    "genet", "gerenuk", "giraffe", "gnu", "gorilla", "hartebeest", "hippopotamus", "hyena", "hyrax", "impala", "jackal", "jerboa", "klipspringer", "kob", "kongoni",
                    "koodoo", "kudu", "lewche", "lemur", "leopard", "lion", "lioness", "lourie", "lovebird", "manatee", "mandrill", "meerkat", "mongoose", "monkey", "mousebird",
                    "nyala", "okapi", "oribi", "oryx", "ostrich", "panther", "puku", "quagga", "reedbuck", "rhino", "rhinoceros", "serval", "sifaka", "springbok", "springhare", 
                    "steenbok", "steenbuck", "sunbird", "sungazer", "suricate", "tiger", "topi", "tsessebe", "warthog", "waterbuck", "wildebeest", "zebra", "zorilla")

animalsFur <- c("alpaca", "beaver", "chamois", "chinchilla", "ermine", "fox", "llama", "mink", "rabbit", "sable", "vicuna")

arcticAnimals <- c("arcticfox", "auk", "caribou", "muskox", "penguin", "polarbear", "reindeer", "seal", "sheathbill", "walrus", "woollymammoth")

australianAnimals <- c("bandicoot", "corella", "devil", "dingo", "duckbill", "dunnart", "emu", "galah", "kangaroo", "kiwi", "koala", "macropod", "malleefowl", "numbat", "pademeleon",
                       "platypus", "possum", "potroo", "quoll", "sugar glider", "tasmanian devil","wallaby", "wallaroo", "wambenger", "wombat", "woylie")

burdenBeasts <- c("ass", "burro", "camel", "colt", "donkey", "dromedary", "horse", "llama", "mare", "mule", "mustang", "ox", "pony", "trotter", "yak")

birds <- c("albatross", "avian", "avocet", "bird", "bittern", "blackbird", "bluebird", "bluefooted booby", "bluegill", "bluejay", "bobolink", "booby", "boubou", "bulbul", "bullfinch",
           "bunting", "bustard", "buzzard", "canary", "cardinal", "cassowary", "chickadee", "chicken", "cliffchat", "cock", "cockatiel", "cockatoo", "conure", "corella", "cormorant", "crake",
           "crow", "cuckoo", "curassow", "dabchick", "darter", "dikkop", "dodo", "dove", "drake", "duck", "duckling", "eagle", "eaglet", "egret", "emu", "ewe", "falcon", "finch", "flamingo", 
           "fowl", "francolin", "frogmouth", "galah", "gallinule", "gander", "goldfinch", "gonolek", "goshawk", "gosling", "grebe", "greenfinch", "grosbeak", "grouse", "guineafowl", "gull", 
           "gyrfalcon", "hammerkop", "harrier", "hawk", "heron", "honeyeater", "hornbill", "hummingbird", "ibis", "jackdaw", "jay", "kestrel", "kingfisher", "kite", "kiwi", "kookaburra",
           "lark", "laughingthrush", "loon", "lorikeet", "lory", "lourie", "lovebird", "macaw", "magpie", "mallard", "malleefowl", "marshbird", "meadowlark", "merganser", "merlin", "mockingbird",
           "moorhen", "motmot", "mouse", "mousebird", "myna", "nightingale", "openbill", "oriole", "osprey", "ostrich", "owl", "parakeet", "parrot", "partridge", "peacock", "peafowl", "pelican",
           "penguin", "peregrine", "pheasant", "pigeon", "pintail", "pitta", "plover", "puffin", "quail", "quetzal", "rail", "raven", "rhea", "roadrunner", "robin", "rook", "sandgrouse", 
           "sandpiper", "seagull", "seriema", "sheathbill", "shelduck", "shoveler", "shrike", "siskin", "skylark", "snipe", "songbird", "sparrow", "spoonbill", "spurfowl", "starling", "stilt",
           "stork", "sunbird", "sunbittern", "swallow", "swallowtail", "swan", "swift", "tanager", "teal", "thrush", "tinamou", "titmouse", "toucan", "tragopan", "trumpeter", "turaco", "turkey",
           "umbrellabird", "vulture", "warbler", "waxbill", "weaver", "wigeon", "wildfowl", "woodpecker", "wren")

bovine <- c("ankole", "antilope", "aoudad", "bison", "blesbok", "bontebok", "buffalo", "bullock", "bushbock", "calf", "cattle", "cow", "dik dik", "gemsbok", "gerenuk", "hartebeest", "heifer", "ibex",
            "klipspringer", "kob", "monitor", "muskox", "nilgai", "nyala", "oribi", "pronghorn", "puku", "reedbuck", "springbok", "steenbuck", "steer", "topi", "tsessebe", "water buffalo", "waterbuck",
            "yak", "zebu")

canine <- c("akita", "barbet", "black lab", "blood hound", "bulldog", "canine", "chihuahua", "coati", "coatimundi", "coyote", "dachshund", "dalmatian", "dog", "fox", "golden retriever", "great dane",
            "greyhound", "grison", "harrier", "husky", "hyena", "jackal", "labrador retriever", "malamute", "pembroke welsh corgi", "poodle", "pug", "puggle", "pup", "shihtzu", "siberian husky", 
            "terrier", "timber wolf", "wild dog", "wolf")

deers <- c("blacktailed deer", "brocket", "buck", "caribou", "chital", "deer", "doe", "eland", "elk", "fawn", "gazelle", "gnu", "impala", "moose", "muledeer", "muntjac", "reindeer", "roe", "sambar",
           "stag", "wapiti", "whitetailed deer", "wildebeest")

farmAnimals <- c("ass", "billygoat", "bronco", "bullock", "calf", "chick", "chicken", "cock", "colt", "cow", "donkey", "ferret", "foal", "goat", "heifer", "hen", "hog", "horse", "kid", "lamb", "mare",
                 "miniature pony", "mule", "pig", "piglet", "pony", "potbellied big", "ram", "rabbit", "rooster", "sheep", "snake", "sow", "spider", "stallion", "turkey")

feline <- c("bengal tiger", "bobcat", "bull", "cat", "caracel", "cheetah", "civet", "cougar", "crane", "jaguar", "jaguarundi", "leopard", "leopardess", "liger", "lion", "lynx", "margay", "mountainlion", 
            "ocelot", "panther", "puma", "ring tailed cat", "serval", "siamese cat", "snow leopard", "snow lion", "tiger", "tigress", "tomcat", "whitetiger", "wildcat")

fish <- c("angelfish", "arrowhead shark", "balloonfish", "barracuda", "bass", "betta", "black tip reef shark", "blowfish", "carp", "catfish", "cichlids", "clownfish", "cuttlefish", "dragonet", "filefish",
          "fish", "flounder", "freshwater fish", "goldfish", "great white shark", "grenadier", "grouper", "grunt", "guppy", "herring", "jack", "knifefish", "koi", "lamprey", "lionfish", "lookdown", 
          "mackerel", "mako shark", "minnow", "moray", "pacu", "parrotfish", "pike", "pink salmon", "piranha", "pleco", "porkfish", "pufferfish", "rainbowfish", "sailfish", "salmon", "saltwater fish",
          "scorpionfish", "seabass", "shark", "shrimp", "smelt", "stickleback", "stonefish", "sturgeon", "swordfish", "tang", "tetra", "tilapia", "triplefin", "trout", "tuna", "whale shark")

insectivores <- c("aardvark", "anteater", "armadillo", "bat", "bittern", "echidna", "hedgehog", "jumpingspider", "mole", "shrew", "spiderling", "sugar")

insects <- c("ant", "antlion", "aphid", "bee", "beetle", "blackwidow", "bug", "butterfly", "caterpillar", "centipede", "cicada", "cockroach", "cricket", "daddy long legs", "dragonfly", "earthworm", 
             "flea", "fly", "gnat", "grasshopper", "grub", "honeybee", "hornet", "insect", "june beetle", "ladybug", "larva", "leafy", "louse", "lubber", "maggot", "mealworm", "mite", "monarch butterfly",
             "mosquito", "moth", "pill bug", "praying mantis", "scorpion", "silkworm", "stick insect", "tarantula", "termite", "tick", "wasp", "worm", "yellow jacket")

northAmericanAnimals <- c("antelope", "badger", "bear", "beaver", "bighorn", "bison", "blackbear", "boar", "bobcat", "brown bear", "caribou", "chipmunk", "chuckwalla", 
                          "cornsnake", "cottonmouth", "cougar", "coyote", "cub", "deer", "drongo", "elk", "fox", "grizzly bear", "kodiak bear", "moose",  "mountain goat",
                          "mountain lion", "pronghorn", "puma", "rabbit", "raccoon", "skunk", "squirrel", "titmouse", "vaquita", "weasel", "wolf")

pets <- c("budgie", "canary", "cat", "cockatiel", "cockatoo", "dog", "gerbil", "golden retriever", "goldfish",  "guineapig", "guppy", "hamster", "kitten", "labrador retriever", 
          "malamute", "parakeet", "parrot", "poodle", "puppy", "rabbit")

primates <- c("ape", "baboon", "bonobo", "capuchin", "chimpanzee", "colobus", "gibbon", "gorilla", "howler monkey", "human", "langur", "lemur", "loris", "macaque", "mandrill", 
              "marmoset", "monkey", "orangutan", "primates", "saki monkey", "shrew", "siamang", "sifaka", "snow monkey", "spider monkey", "tamarin", "titi")

rabbits <- c("bunny", "coney", "hare", "jackrabbit", "rabbit")

reptiles <- c("adder", "alligator", "amphibian", "anaconda", "anole", "asp", "basilisk", "black mamaba", "boa constrictor", "bullfrog", "caiman", "chameleon", "chuckwalla", 
              "cobra", "constrictor", "cornsnake", "cottonmouth", "crocodile", "diamondback", "dinosaur", "dragon", "frog", "garden snake", "gecko", "godzilla", "iguana", 
              "kingsnake", "komododragon", "lizard", "milksnake", "moccasin", "newt", "pit viper", "python", "ratsnake", "rattlesnake", "reptile", "salamander", "serpent", 
              "sidewinder", "skink", "snake", "sungazer", "toad", "tomistoma", "tortoise", "tree frog", "turtle", "velociraptor", "viper", "watersnake")

rodents <- c("agouti", "beaver", "black squirrel", "capybara", "cavy", "chinchilla", "chipmunk", "degu", "dormouse", "flying squirrel", "gerbil", "golden marmot", "gopher", 
             "groundhog", "guinea pig", "hamster", "hedgehog", "lemming", "marmot", "mole", "mouse", "muskrat", "naked mole rat", "phascogale", "porcupine", "potoroo", 
             "prairy dog", "rat", "rodent", "shrew", "springhare", "squirrel", "vole", "woodchuck", "woylie")

waterAnimals <- c("alga", "alligator", "anemone", "axolotl", "baiji", "balloonfish", "beaver", "beluga", "black tip reef shark", "blue whale", "boto", "brine shrimp", "cavefish",
                  "cichlids", "clam", "conch", "coral", "cowry", "crab", "crawfish", "crayfish", "dogfish", "dolphin", "dragonet", "dugong", "eel", "elephant seal", "filefish", 
                  "fish", "frog", "goose", "hammerhead shark", "humpback whale", "jellyfish", "killer whale", "knifefish", "leech", "limpet", "lionfish", "lobster", "lookdown", 
                  "manatee", "mantaray", "moray", "murex", "muskrat", "mussel", "narwhal", "nautilis", "newt", "octopus", "orca", "otter", "oyster", "pacu", "penguin", "platypus",
                  "pleco", "porkfish", "porpoise", "prawn", "pufferfish", "ray", "sailfish", "salamander", "sand dollar", "sawfish", "scallop", "scorpionfish", "sea lion", "sea monkey",
                  "seahorse", "seal", "shark", "slug", "snail", "sponge", "squid", "starfish", "stingray", "stonefish", "tadpole", "tang", "tetra", "toad", "triplefin", "turtle", "urchin",
                  "vaquita", "whale")

weasels <- c("badger", "ferret", "groundhog", "marten", "mink", "mongoose", "otter", "polecat", "sea otter", "skunk", "stoat", "weasel", "wolverine")

categories <- c("animalsFur", "arcticAnimals", "australianAnimals", "birds", "bovine", "burdenBeasts", "canine", "deers", "farmAnimals", "feline", "fish",
                "insectivores", "insects", "northAmericanAnimals", "pets", "primates", "rabbits", "reptiles", "rodents", "waterAnimals", "weasels")

animals <- list(animalsFur, arcticAnimals, australianAnimals, birds, bovine, burdenBeasts, canine, deers, farmAnimals, feline, fish,
                insectivores, insects, northAmericanAnimals, pets, primates, rabbits, reptiles, rodents, waterAnimals, weasels)


source <- c(rep("animals", length(animals)), rep("animalsFur", length(animalsFur)), rep("arcticAnimals", length(arcticAnimals)),
            rep("australianAnimals", length(australianAnimals)), rep("birds", length(birds)), rep("bovine", length(bovine)),
            rep("burdenBeasts", length(burdenBeasts)), rep("canine", length(canine)), rep("deers", length(deers)),
            rep("farmAnimals", length(farmAnimals)), rep("feline", length(feline)), rep("fish", length(fish)),
            rep("insectivores", length(insectivores)), rep("insects", length(insects)), rep("northAmericanAnimals", length(northAmericanAnimals)),
            rep("pets", length(pets)), rep("primates", length(primates)), rep("rabbits", length(rabbits)), rep("reptiles", length(reptiles)),
            rep("rodents", length(rodents)), rep("waterAnimals", length(waterAnimals)), rep("weasels", length(weasels)))


target <- c(categories, animalsFur, arcticAnimals, australianAnimals, birds, bovine, burdenBeasts, canine, deers, farmAnimals, feline, fish,
                 insectivores, insects, northAmericanAnimals, pets, primates, rabbits, reptiles, rodents, waterAnimals, weasels)


# Plot
forceNetwork(Links = MisLinks, Nodes = MisNodes,
             Source = "source", Target = "target",
             Value = "value", NodeID = "name",
             Group = "group", opacity = 0.8)


# Simulate data
patch <- sample(animals, 1){
  start <- sample(patch[[1]], 2)
  previous <- start[1]
  item <- start[2]
  
  similarity <- cos_sim[previous, item]
}

# Network visualisation
library(networkD3)

for (i in 1:length(africanAnimals)){
  if (africanAnimals[i] %in% rownames(cos_sim) == F){
    print(africanAnimals[i])
  }
}

check <- rep(0, nrow(cos_sim))


  for (j in 1:18){
    for (i in rownames(cos_sim)){
    if (rownames(cos_sim[i]) %in% animals[[j]]){
      check[i] = 1
    }
  }
}

