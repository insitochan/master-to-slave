`timescale 1ns / 1ps
module top(
        input clk,
        input rst,
        input [7:0] data_in,
        input data_en,
        
        output [7:0] data_slave_out
    );
    wire ready;
    wire valid;
    wire [7:0] data_master_out;
    
    master u_master(
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .ready(ready),
        .data_en(data_en),
        
        .valid(valid),
        .data_out(data_master_out)
    );
    
    slave u_slave(
        .clk(clk),
        .rst(rst),
        .valid(valid),
        .data_en(data_en),
        .data_in(data_master_out),
        
        .ready(ready),
        .data_out(data_slave_out)
    );
    
endmodule
