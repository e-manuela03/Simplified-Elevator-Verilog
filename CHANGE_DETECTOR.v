`timescale 1ns / 1ps

module CHANGE_DETECTOR(
                          input clk,
                          input rst,
                          input [1:0] in,
                          output reg change   
                       );
     reg [1:0] memo;
  always@(posedge clk)
  begin
    if(rst==1)
     begin
        memo<=0;
     end
    else begin
          memo<=in;
         end
  end
  
  always@(*)
   begin
     if(memo!=in) 
     begin 
       change=1;
     end 
     else begin
      change=0;
     end
     end
endmodule