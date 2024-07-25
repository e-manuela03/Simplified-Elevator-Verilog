`timescale 1ns / 1ps


module ELEVATOR_FSM(
    input clk,
    input rst,
    input stop,
    input [1:0] in,
    output [1:0] floor
    );
    
 localparam FLOOR0=2'b00;
 localparam FLOOR1=2'b01;
 localparam FLOOR2=2'b10;
 localparam FLOOR3=2'b11;
 
 reg [1:0] state, state_next;
 
 always@(posedge clk)
 begin
 if(rst==1)
    begin
        state<=FLOOR0;
    end
 else state<=state_next;
 end
 
 always@(*)
 begin
 state_next=state;
 case(state)
    FLOOR0: begin
                if(in==0 | stop==1) state_next=FLOOR0;
                else if(in>0) state_next=FLOOR1;
            end
    FLOOR1: begin
                if(in==1 | stop==1) state_next=FLOOR1;
                else if(in>1) state_next=FLOOR2;
                else if(in<1) state_next=FLOOR0;
            end
    FLOOR2: begin
                if(in==2 | stop==1) state_next=FLOOR2;
                else if(in>2) state_next=FLOOR3;
                else if(in<2) state_next=FLOOR1;
            end
    FLOOR3: begin
                if(in==3 | stop==1) state_next=FLOOR3;
                else if(in<3) state_next=FLOOR2;    
            end
    default : state_next=FLOOR0;
 endcase
 end
 
 assign floor=(state==FLOOR0)? 0 : (state==FLOOR1)? 1: (state==FLOOR2)? 2: (state==FLOOR3)? 3:0;
 
endmodule
