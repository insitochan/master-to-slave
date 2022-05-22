`timescale 1ns / 1ps
module tb();
     reg clk;
     reg rst;
     reg [7:0] data_in;
     reg data_en;
     
     wire [7:0] data_slave_out;
     
     top u_tb(
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_en(data_en),
        .data_slave_out(data_slave_out)
     );
     
     initial begin
        clk=0;
        rst=0;
        data_en=0;
        #20
        rst=1;
        #1000
        
        data_en=1;
        #50
        data_en=0;
        #50
        data_en=1;
        #10000
        $stop;
     end
     
     
     //50MHz
     always #10 clk=~clk;
     
     //data
     localparam N=64;
     reg [6:0] count;
     always@(posedge clk) begin
        if(!rst) begin
            count<='d0;
            data_in<='d0;
        end
        else if(data_en & count<=64) begin
            data_in<=count+1;
            count<=count+1;
        end
        else if(~data_en & count<=64) begin
            count<=count;
            data_in<='d0;
        end
        else begin
            count<='d0;
            data_in<='d0;
        end
     end
     



endmodule
