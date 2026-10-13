module rs_latch (
  input  i,r,       // primary inputs
  output o         // primary outputs
);

wire g1;
wire g2;

wire not_i;
not(not_i,i);
wire not_r;
not(not_r,r);

nand(g1,not_i,g2);
nand(g2,not_r,g1);

buf(o,g1);

endmodule
