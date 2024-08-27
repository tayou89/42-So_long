# So Long

## Description

So Long is a simple 2D game project developed as part of the 42 school curriculum. In this game, a player navigates through a map, collecting items and reaching the exit while avoiding obstacles.

## Features

- 2D top-down view gameplay
- Player movement using W, A, S, D keys
- Collectible items
- Exit point
- Wall obstacles
- Enemy patrols (Bonus feature)
- Sprite animations (Bonus feature)
- On-screen movement counter (Bonus feature)

## How to Play

1. Use the following keys to move the player:
   - W: Move up
   - S: Move down
   - A: Move left
   - D: Move right
2. Collect all items on the map
3. Reach the exit to win the game
4. Avoid enemy patrols (in bonus version)

## Installation

1. Clone the repository
2. Run `make` to compile the game
3. Run `./so_long maps/[map_name].ber` to start the game with a specific map

## Requirements

- MiniLibX library
- C compiler (gcc recommended)
- Make

## Makefile

The project includes a Makefile with the following rules:
- `make`: Compile the game
- `make clean`: Remove object files
- `make fclean`: Remove object files and executable
- `make re`: Recompile the game
- `make bonus`: Compile the game with bonus features

## Norminette

This project follows the 42 school's Norm coding style. The Norminette tool is used to check compliance with the Norm. For more information about the Norm, please refer to the [42 Norm documentation](https://github.com/42School/norminette).

## Map Format

Maps are provided as .ber files with the following components:
- 0: Empty space
- 1: Wall
- C: Collectible
- E: Exit
- P: Player starting position

## Bonus Features

This implementation includes the following bonus features:
1. Enemy patrols that cause the player to lose upon contact
2. Sprite animations for game elements
3. On-screen display of the movement count