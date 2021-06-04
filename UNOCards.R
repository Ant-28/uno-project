#Calls a string library
lib_use <- "stringr"
ifelse(lib_use %in% installed.packages(), require(lib_use,character.only =  TRUE), {
  install.packages(lib_use)
  library(lib_use, character.only = TRUE)
})

{colours <- c("Red", "Blue", "Green", "Yellow")
numbers <- c(0,rep(1:9,2))
numbers <- as.character(numbers)
symbols <- rep(c("Reverse", "Skip", "Draw Two"),2)
wilds <- rep(c("Wild", "Wild Draw Four"),4)
not_wilds <- c(numbers, symbols)
not_wilds_color <- expand.grid(colours, not_wilds)
not_wilds_color <- str_c(not_wilds_color[,1], not_wilds_color[,2], sep = " ")}
unocards <- c(not_wilds_color, wilds)

seedgen <- function()
{
  #why do I do this?
  maxint <- .Machine$integer.max
  torturesample <- replicate(10000, {
  sample(-maxint:maxint, size = 1)})
  sample(torturesample, size = 1)
}

cardsample <- function(numplayers,deck,numcards){
 
  cards_drawn <- numplayers*numcards
  #another layer of randomness because why not?
  set.seed(seedgen())
  ifelse(cards_drawn > 80, deckerror() ,
  deckbuilder(deck, cards_drawn, numplayers))
}


deckbuilder <- function(deck, cards_drawn, numplayers){
  
  cardsample <- sample(deck, cards_drawn, replace = FALSE)
  cards <- split(cardsample,str_c('Player',c(1:numplayers), sep = " "))
  cards
}
deckerror <- function(){
  "Discard Pile Too Small, There Should be at least 28 cards in the discard pile"
}