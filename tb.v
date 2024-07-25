`timescale 1ns / 1ps

module tb();
reg clk_tb,rst_tb,en_tb,stop_tb;                                
reg [1:0] in_tb;            
wire clk_delay_tb;          
wire [6:0] floor_display_tb;
wire [3:0] changes_count_tb; 

TOP dut(
         .clk(clk_tb),                 
         .rst(rst_tb),                 
         .en(en_tb),                  
         .stop(stop_tb),                
         .in(in_tb),            
         .clk_delay(clk_delay_tb),          
         .floor_display(floor_display_tb),
         .changes_count(changes_count_tb)
       );
 initial
 begin
 clk_tb=0;
  forever #5 clk_tb=~clk_tb;
 end
 
 initial
 begin
  rst_tb=1;
  stop_tb=0;
  in_tb=0;
  en_tb=0;
  #10;
  rst_tb=0;
  en_tb=1;
 #10;
 in_tb=3; 
 #40;
 in_tb=1;
 #20;
 stop_tb=1;
 in_tb=2;
 #30;
stop_tb=0;
 #20;
 in_tb=3;
 stop_tb=1;
 #20;
 in_tb=0;
 #10;
 stop_tb=0;
 #30;
 $stop();
 end
endmodule
