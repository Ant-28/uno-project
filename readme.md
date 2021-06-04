Uno Projects
================

## About

This is a small project containing scripts pertaining to the card game
UNO! (Info [here](https://en.wikipedia.org/wiki/Uno_(card_game)))
(Copyright Mattel, all rights reserved to them)

## Why are you doing this?

It’s just for kicks. I want to practice my R skills.

## Project Files

**UNOCards.R** is used to create a deck of cards. You can have an
unlimited number of players, each of whom receive a fixed number of
cards. However, the total number of cards drawn cannot exceed 80. This
is because the standard UNO game has a maximum of 8 players with 10
cards per player.

## How to run this script:

Download the R Scripts by cloning the repository and open the files in
[RStudio](https://www.rstudio.com/products/rstudio/download/) The
**UNOCards.R** script automatically installs libraries, so there are no
prerequisites. Once run, the card deal for each player is saved in a
data frame called Deck. Currently, the script will output the first
entry (that is, Player 1’s hand) but that can be easily changed.

## Roadmap

-   Creating a draw/discard pile
-   Allowing player interaction (probably using the `menu()` function?)
-   Creating an AI (If I have the time to do so)

## Wishlist

-   Adding a User Interface (again, probably using the `menu()`
    function?)