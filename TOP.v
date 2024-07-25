`timescale 1ns / 1ps

module TOP(
             input clk,
             input rst,
             input en,
             input stop,
             input [1:0] in,
             output clk_delay,
             output [6:0] floor_display,
             output [3:0] changes_count
           );
           wire clkdelay1;
           wire [1:0] floor1;
  CLK_DELAY CLK_DELAY(
                        .clk(clk),
                        .rst(rst),
                        .en(en),
                        .clk_delay(clk_delay1)
                      );
   ELEVATOR ELEVATOR(
                        .clk(clk_delay1),
                        .rst(rst),
                        .stop(stop),
                        .in(in),
                        .changes_count(changes_count),
                        .floor(floor1)
                     );
FLOOR_TRANSCODER TRANSCODER(
                                 .in(floor1),
                                 .out(floor_display)
                                );
  assign  clk_delay=clk_delay1;
    
endmodule