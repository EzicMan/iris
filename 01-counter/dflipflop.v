module d_flipflop(
    input d,clk,r,
    output o
);

wire not_clk;
not(not_clk,clk);

wire out_d1;

d_latch d1(d,not_clk,1'b0,out_d1);
d_latch d2(out_d1,clk,r,o);

endmodule
