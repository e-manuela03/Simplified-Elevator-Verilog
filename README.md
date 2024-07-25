# Simplified-Elevator-Verilog

The purpose of the circuit is to correctly display the floors traveled by an elevator and the number of floors visited. At the entrance we receive the in signal, which indicates the floor we want to reach, and the stop signal, which can stop the elevator at the current floor. Like a real elevator, visiting a floor involves going through the intermediate floors.

CHANGE_DETECTOR - is a module that detects the pressing of a button corresponding to a different stage than the current one. Thus, it contains a register that records the previous input, and on each positive clock step it checks if the current input value is different from the previous one in the register. If the value is different, the change output signal will produce a pulse as long as a clock period.

COUNTER - is a 4-bit counter that counts only when a change of the input signal is detected by the CHANGE_DETECTOR module.

CLK_DELAY - a module whose role is to slow down the clock signal coming from the FPGA, which has a very high frequency. It has an internal 32-bit count signal, which, if enabled, increments with each positive clock edge from the FPGA. The output signal, clk_delay, represents the 28th bit of the count signal. The output signal from CLK_DELAY also goes to the output of TOP to observe, using an LED, the period of a clock.

