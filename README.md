# Clomp

I made this game in 24 hours. Not during a hackathon or anything just because I thought it would be fun :)

I made this from May 21st to 22nd in 2022.

## About

Clomp is a fast-paced paddle arcade game built in Godot 3. Two blob-like characters called "Clomps" face off across a playfield, deflecting a bouncing ball back and forth.

## Game Modes

- **PvCPU (Player vs Computer)** - Play against a CPU opponent with adjustable difficulty.
- **PvP   (Player vs Player)**   - Local two-player on the same keyboard.

## Controls

| Action           | Keys         |
|------------------|--------------|
| Move paddle (P1) | Arrow Keys   |
| Move paddle (P2) | A/D          |
| Select ball type | (\`, 0-9, -) |
| CPU difficulty   | V, B, N, M   |
| Return to menu   | Backspace    |

## Difficulties

V - easy
B - normal
N - hard
M - impossible

## Ball Types

There are 12 different ball types, each with unique physics:

| Key | Ball   | Behavior                                                           |
|-----|--------|--------------------------------------------------------------------|
| `   | Purple | Medium speed, normal physics                                       |
| 1   | Blue   | Default ball, steady acceleration                                  |
| 2   | Black  | Slow but accelerates quickly, smaller hitbox                       |
| 3   | Brown  | Fastest base speed, large hitbox                                   |
| 4   | Pink   | Drifts horizontally based on its position relative to center       |
| 5   | Red    | Starts slow, rapidly accelerates with each bounce                  |
| 6   | Cyan   | Tracks and follows the player's horizontal position                |
| 7   | Yellow | Starts slow, acceleration ramps up over time                       |
| 8   | Gray   | Pulsing speed - ramps up after a hit then resets                   |
| 9   | Green  | Wraps around horizontally (teleports edge to edge)                 |
| 0   | Orange | Near-standstill start with exponential acceleration                |
| -   | White  | Wild card - randomly picks between all other balls every 5 seconds |

