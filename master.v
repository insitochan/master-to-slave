`timescale 1ns / 1ps
module master(
        input clk,
        input rst,
        input [7:0] data_in,  //range ¡À2^7 (dec)
        input ready, //slave
        input data_en,
        
        //output last,
        output reg valid,
        output [7:0] data_out
    );
    /*
    reg [7:0] data_buffer;
    always@(posedge clk) begin
        if(!rst) begin
            data_buffer<=0;
        end
        else begin
            data_buffer<=data_in;
        end
    end
    */
    
    //valid 
    always@(posedge clk) begin
        if(!rst) begin
            valid<=0;
        end
        else if(data_en) begin
            valid<=1;
        end
        else begin
            valid<=0;     //data_en==0;
        end
     end
     // data_out
assign data_out=valid&ready?data_in:'d0;        
    
    
endmodule
