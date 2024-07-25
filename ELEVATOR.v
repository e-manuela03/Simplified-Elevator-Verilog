`timescale 1ns / 1ps


module ELEVATOR(
                  input clk,
                  input rst,
                  input stop,
                  input [1:0] in,
                  output [1:0] floor,
                  output [3:0] changes_count
                );
 wire count_enable;
 COUNTER COUNTER0(
                    .clk(clk),
                    .rst(rst),
                    .en(count_enable),
                    .changes_count(changes_count)
                   );
 CHANGE_DETECTOR CHANGE_DETECTOR(
                                   .clk(clk),
                                   .rst(rst),
                                   .in(in),
                                   .change(count_enable) 
                                 );
 ELEVATOR_FSM ELEVATOR_FSM(
                              .clk(clk),
                              .rst(rst),
                              .stop(stop),
                              .in(in),
                              .floor(floor));
endmodule