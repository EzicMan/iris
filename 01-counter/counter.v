module counter(
    input clk,r,
    output [1:0] o
);

wire i1;
not(i1,o[0]);

d_flipflop d1(i1,clk,r,o[0]);

wire i2;
xor(i2,o[0],o[1]);

d_flipflop d2(i2,clk,r,o[1]);

endmodule
