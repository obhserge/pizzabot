# Slice code challenge: Pizzabot

## Description
Pizzabot it's a robot that delivers pizza. The task is to instruct Pizzabot on how to deliver pizzas to all the houses in a neighborhood.
We have a grid (where each point on the grid is one house) and a list of points representing houses in need of pizza delivery. The function should return a list of instructions for getting Pizzabot to those locations and delivering. 

## How Pizzabot works
Pizzabot has the following actions:

* `N`: Move north
* `S`: Move south 
* `E`: Move east 
* `W`: Move west 
* `D`: Drop pizza

Pizzabot always starts at the origin point, (0, 0). As with a Cartesian plane, this point lies at the most south-westerly point of the grid.

Pizzabot receives an input string as the following: `5x5 (1, 3) (4, 4)`. Where `5x5` is a grid size and `(1, 3) (4, 4)` are points to deliver pizza. Pizzabot tries to parse the input string and return a list of instructions. The result string is `ENNNDEEEND`.

## Version
1.0.0

## Requirements
* Xcode 12.5 or later
* macOS 11.4 or later

## How to use

### Launch in terminal using Xcode:

* Open Xcode
* Select `Pizzabot` scheme
* Build on your Mac (Cmd + B)
* Find builded `Pizzabot` exec file in `Products` folder
* Run it and enter the following: `5x5 (1, 3) (4, 4)`
* You will get the following result: `ENNNDEEEND`

### Launch in Xcode

* Open Xcode
* Select `Pizzabot` scheme
* Run on your Mac (Cmd + R)
* Enter the following: `5x5 (1, 3) (4, 4)`
* You will get the following result: `ENNNDEEEND`

## Challenge:

To complete the challenge, need to solve for the following exact input string:
`5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)`
