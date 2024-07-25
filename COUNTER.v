`timescale 1ns / 1ps


module COUNTER #(parameter W=4)(
    input clk,
    input rst,
    input en,
    output reg [W-1:0] changes_count
    );
    
always@(posedge clk)
begin
if(rst==1)
    begin
    changes_count<=0;
    end
else if(en==1) changes_count<=changes_count+1;
        else changes_count<=changes_count;
end
endmodule
