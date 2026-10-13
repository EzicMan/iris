module latch_test;

reg d,clk,r;
wire o;

d_flipflop uut(d,clk,r,o);

initial begin
    d = 0;
    clk = 0;
    r = 1;
    #1 r = 0;
end
always #2 clk = !clk;
initial begin
    $dumpfile("output.vcd");
    $dumpvars(0,latch_test);
    #1 d = 1;
    #1 d = 0;
    #5 d = 1;
    #3 d = 0;
    #2
    $finish();
end


endmodule
