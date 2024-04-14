# ECE532_24W_FinalDemo
Group 7 Camera Pong

To make a new Project from this repo, please follow the steps below:
  1. Clone this repo to your local directory.
  2. Open Vivado and load the board file. We also share the board file of Digilent Nexys DDR 4 under the 'board' folder
  3. locate into the 'prj' folder, where you can find 2 .tcl scripts.
  4. Run the 'source ./camera_pong.tcl' first to create a new project.
  5. Run the 'source ./top_bd.tcl' then to create the block design.

After you re-generate bitstream, you also need to load the SDK for loading our software player, HSV tuning and button control paddle. The 'helloworld.c' under 'sdk' folder contains the source file.
