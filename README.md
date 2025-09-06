# CORDIC-Based Phase Correction on FPGA
This project implements the CORDIC (COordinate Rotation DIgital Computer) algorithm for signal phase rotation and correction in a digital communication system using 32-PSK (Phase Shift Keying).

The work was developed as a final project for EL2002 – Digital Systems (Institut Teknologi Bandung, 2024). The system is designed in VHDL and implemented on an FPGA, with UART communication support and Python Serial Tool integration for input/output handling.

**🔧 Key Features**

CORDIC implementation for calculating and correcting signal phase.

32 reference angles (32PSK) for precise phase correction.

Input coordinates (x, y) via UART in HEX format → processed → converted into degrees/radians.

Modular VHDL design with reusable blocks:

register16bit, addsub, multiplier24to16bit, mux, counter4bit, etc.

Integration with Python for data conversion and visualization.

**📂 Repository Structure**

src/ → VHDL source code (main modules and submodules).

sim/ → Simulation files and testbenches (ModelSim).

docs/ → Technical report and documentation.

python/ → Python scripts for UART communication and output processing.

**🚀 Workflow Overview**

Input coordinates (x,y) are sent from PC → FPGA via UART.

FPGA executes the CORDIC iterative rotation algorithm.

Output phase is computed in binary, radians, and degrees.

Results are sent back to PC for display/processing.

**📹 Demonstration**

Video demo: [YouTube](https://youtu.be/gsHEkxnVPYY)

Full documentation: [Uploading Kelompok_20_Laporan (1).pdf…]()
