`timescale 1ns / 1ps

module CLK_Divide(clk,clk_out);
input clk;
output reg clk_out;
reg [7:0] count = 0;
parameter divide = 4;

always@(posedge clk) begin
if (count >= (divide -1) )
count <= 0;
else 
count <= count + 1;
clk_out = (count<divide/2)?1:0;
end

endmodule


