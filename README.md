# PizzabotApp

PizzabotApp - command-line application that simulates Pizzabot behavior on how to deliver pizzas to all the houses in a neighborhood.

## Version

1.0

## Build and runtime requirements

- Xcode 11.7 or later
- macOS 10.9 or later

## How it works

Pizzabot receives instructions string in the following format: "5x5 (1, 3) (4, 4)". Where "5x5" is the grid size (width and height) and "(1, 3) (4, 4)" - pizza destination points. Output string contains ordered actions to be done to deliver pizza in all places. For example: "ENNNDEEEND".

Possible Pizzabot actions are:
- N: Move north
- S: Move south
- E: Move east
- W: Move west
- D: Drop pizza

### Pizzabot Algorithm:
1. Check input string format
2. Check if all points in region
3. Perform actions on grid and save route
4. Output result string (route)

Pizzabot always starts at the origin point, (0, 0). As with a Cartesian plane, this point lies at the most south-westerly point of the grid.

By default Pizzabot doesn't take optimality of route into account and moves on the grid according to the following priority: east > west > north > south.

## How to use

Provide input string using the following format: grid dimensions separated by "X" or "x" character followed by any number of points in parentheses separated by comma. Number of spacers between characters doesn't matter.

### In Terminal:

- Open the project in Xcode
- Select PizzabotApp scheme
- Build the project
- Find PizzabotApp exec file in projects hierarchy "Products" folder and run it
- Input instructions string in terminal window

Example usage:

```
Input instructions string:
5x5 (1, 3) (4, 4)
Result: ENNNDEEEND
```

### In Xcode:

- You can also run pizzabot throught the "main.swift" file using Pizzabot route(for:) method

Example usage:

```
Pizzabot().route(for: "5x5 (1, 3) (4, 4)")

Pizzabot().route(for: "5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)")
```

## Unit tests

For testing, change scheme to "PizzabotAppTests" and go to the corresponding folder. Here you will find  basic tests already provided.
