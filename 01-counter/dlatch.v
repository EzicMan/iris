module d_latch(
    input d,clk,r,
    output o
);
wire g1;
wire g2;

wire not_d;
not(not_d,d);

wire real_r;
or(real_r,g2,r);

rs_latch rs(g1,real_r,o);

and(g2,not_d,clk);
and(g1,d,clk);

endmodule
