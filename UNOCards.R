#Calls a needed library
lib_use <- c("stringr","knitr")
for(i in 1:length(lib_use)){
if(lib_use[i] %in% installed.packages()){
  require(lib_use[i],character.only =  TRUE)
}
else {
  install.packages(lib_use[i])
  library(lib_use[i], character.only = TRUE)
}}

#used to create the deck of UNO cards
{colours <- c("Red", "Blue", "Green", "Yellow")
numbers <- c(0,rep(1:9,2))
numbers <- as.character(numbers)
symbols <- rep(c("Reverse", "Skip", "Draw Two"),2)
wilds <- rep(c("Wild", "Wild Draw Four"),4)
not_wilds <- c(numbers, symbols)
not_wilds_color <- expand.grid(colours, not_wilds)
not_wilds_color <- str_c(not_wilds_color[,1], not_wilds_color[,2], sep = " ")}
unocards <- c(not_wilds_color, wilds)

#seed generation torture
seedgen <- function()
{
  #why do I do this?
  maxint <- .Machine$integer.max
  torturesample <- replicate(10000, {
  sample(-maxint:maxint, size = 1)})
  sample(torturesample, size = 1)
}

#card sampling algorithm
cardsample <- function(numplayers,deck,numcards){
 
  cards_drawn <- numplayers*numcards
  
  #Checks if more than 80 cards are drawn
  if(cards_drawn > 80){ 
    "Discard Pile Too Small, There Should be at least 28 cards in the discard pile"
  } 
  # The Actual card sampling algorithm
  else{
    #another layer of randomness because why not? 
    # Added this within else because it made more sense to read
    set.seed(seedgen())
    # this thing
    cardsample <- sample(deck, cards_drawn, replace = FALSE)
    # proof the print function in R is horrible or, I'm stupid
    cards <- split(cardsample,str_c('Player',c(1:numplayers), sep = " "))
    cards
  }
}

# Test out by tinkering arguments/output
Deck <- cardsample(8,unocards,10)
Deck$`Player 1`