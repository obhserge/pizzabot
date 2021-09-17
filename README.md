# Slice code challenge: Pizzabot

Pizzabot it's a robot that delivers pizza. The task is to instruct Pizzabot on how to deliver pizzas to all the houses in a neighborhood.
We have a grid (where each point on the grid is one house) and a list of points representing houses in need of pizza delivery. The function should return a list of instructions for getting Pizzabot to those locations and delivering. Pizzabot has the following actions:

* `N`: Move north
* `S`: Move south 
* `E`: Move east 
* `W`: Move west 
* `D`: Drop pizza

## Example:

Given the following string:
`5x5 (1, 3) (4, 4)`
The result would be:
`ENNNDEEEND`

## Challenge:

To complete the challenge, need to solve for the following exact input string:
`5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)`
