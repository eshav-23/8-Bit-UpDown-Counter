# Up/Down Counter with Seven-Segment Display on Nexys 4 DDR FPGA

This project implements an **8-bit up/down counter** in Verilog with **clock division, reset, and direction control**, designed for the **Nexys 4 DDR FPGA board**.  
The counter value is displayed simultaneously on **binary LEDs** and an **8-digit seven-segment display** using multiplexing logic.

---

## Features

- **Clock Divider**
  - Converts the 100 MHz onboard clock into a **1 Hz pulse** for human-readable counting.  
  - Ensures stable and observable count increments.  

- **Up/Down Counter**
  - 8-bit counter counts in the range **0 → 255** (up) or **255 → 0** (down).  
  - **Direction control input** selects incrementing or decrementing mode.  
  - **Reset input** clears the counter to 0.  

- **Output Visualization**
  - **LEDs**: Show the current count value in **binary format**.  
  - **Seven-Segment Display**: Displays the counter value (decimal/hex) using multiplexing.  

- **Multiplexing Logic**
  - The Nexys 4 DDR has 8 common-anode 7-segment displays that share segment lines.  
  - High-speed multiplexing drives all displays in sequence, making them appear lit simultaneously.  
  - Ensures **clear and flicker-free visualization**.  

- **Post-Synthesis Power Analysis**
  - Total on-chip power: **0.126 W**  
  - Junction temperature: **25.6 °C**  

---

## Implementation Details

### Clock Divider
- Divides the **100 MHz system clock** down to **1 Hz**.  
- Provides a slow pulse for human-visible counting.  

### Up/Down Counter
- 8-bit register incremented or decremented at each 1 Hz pulse.  
- Inputs:
  - `reset` → clears the count to 0.  
  - `up` (direction) → 1 for up-count, 0 for down-count.  

### Seven-Segment Display Driver
- Converts the binary count into BCD/hex digits.  
- Uses **digit multiplexing** to activate each of the 8 displays sequentially.  
- Refresh rate > 1 kHz, so all digits appear continuously lit.  

### Binary LED Output
- Counter value is directly output to the 8 on-board LEDs.  
- Provides quick debug and binary visualization.  

---

##  How It Works

1. The **clock divider** generates a 1 Hz tick.  
2. The **counter** updates on each tick (increment or decrement depending on direction).  
3. The **binary LEDs** display the count in binary.  
4. The **seven-segment driver** shows the same value in decimal/hex by scanning all digits quickly.  

---

## Example Usage

- **Reset Button** → sets count = 0.  
- **Direction Switch** →  
  - HIGH → Count up (0 → 255).  
  - LOW → Count down (255 → 0).  
- **LEDs** → Show binary value.  
- **7-Segment Display** → Shows decimal/hex value.  

---

## Tools & Environment

- **Language**: Verilog HDL  
- **Synthesis & Simulation**: Xilinx Vivado  
- **Target Board**: Digilent Nexys 4 DDR FPGA  

## Usage

1. Clone the repository to your local machine:
    
    ```
    git clone <https://github.com/eshav-23/8-Bit-UpDown-Counter>
    
    ```
    
2. Open XILINX Vivado and create a new project.
3. Add the Verilog source files from the cloned repository to your project.
4. Synthesize and implement the design.  
