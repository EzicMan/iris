module rs_latch (
  input  i,r,       // primary inputs
  output o         // primary outputs
);

wire g1;
wire not_g1;
wire g2;
wire not_g2;

wire not_i;
not(not_i,i);
wire not_r;
not(not_r,r);

and(g1,not_i,not_g2);
and(g2,not_r,not_g1);

not(not_g1,g1);
not(not_g2,g2);

buf(o,not_g1);

endmodule
