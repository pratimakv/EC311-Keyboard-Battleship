# EC311-Keyboard-Battleship

Project name: Keyboard Battleship

Pratima Vaidyanathan, Jong Whee Jeon, Daniel Gruspier , Kenneth Chan

Link to your Project Demo Video: [link]

Overview of the Project:
A program that plays the board game battleship. The playing field is the keyboard, used both for placing and hitting the ship. The VGA shows whether players have hit or missed during their turn, and displays a winner when the game is over. The seven segment display indicates whose turn it is. The FPGA center button is used to progress through the phase.

How to run your project:
Cycle through the game using the center button on the FPGA.
1) Start the FPGA
2) Press button
3) It is now P1’s turn to set ships. In any order, P1 presses the keys where they want ships. Then press the button.
4) It is now P2’s turn to set ships. In any order, P2 press the keys where they want ships. Then press the button.
5) It is now P1’s turn to fire. P1 selects the key where they want to fire. Then press the button.
6) It is now P2’s turn to fire. P2 select the key where they want to fire. Then press the button.
7) It is now P1’s turn again. Repeat steps 5 and 6 until there is a winner, which will be indicated on the VGA display.
Use the CPU Reset button to play again. This button can also be used at any time to restart the game.

Overview of the code structure (what code does what):

Top.v : wires all modules together.

Set_ships: takes in keyboard inputs during the “placing ships” phase and compiles them into one register.

Scan_to_keys: Creates a one-hot 36-bit register, where each bit represents one of the used keys in the game (all letters and numbers), where this register acts as a “map” of the pressed key

Hit_or_miss: takes in ship location registers and pressed key register; matches pressed key to ship locations and determines a hit or miss accordingly, and tracks which ship locations have already been hit.

Get_state: keeps track of what state the game is in. Helps progress through the game.

Displays_and_keyboard: takes in PS2 data and outputs the 36 bit one-hot encoding on the keys that represents a key. This module also takes in game logic input to drive the seven segment display and the VGA display. 

top_vga: Controls the vga and calls modules that display each screen. The output of the module is controlled by a mux that depends on the game logic inputs. 

Other relevant things:
We originally wanted to use the keyboard enter key to cycle through the game. However, we found that when another key was pressed between enter key presses, player turns were unintentionally skipped. In the end, we were unable to discover the root of this issue. To progress through the game, the enter key was swapped out for a button the FPGA, and the game logic is triggered on the rising edge of this button.
