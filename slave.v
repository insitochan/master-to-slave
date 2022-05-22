`timescale 1ns / 1ps
module slave(
        input clk,
        input rst,
        input valid,
        input data_en,
        input [7:0] data_in,
        
        output reg ready,
        output [7:0] data_out //debug use
    );
    
    //ready
    always@(posedge clk) begin
        if(!rst) begin
            ready<=0;
        end
        else if(data_en) begin
            ready<=1;
        end
        else begin
            ready<=0;
        end
    end
    //
    assign data_out=valid&ready?data_in:'d0;
    
endmodule
