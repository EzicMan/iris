module latch_test;

reg i,r;
wire o;

rs_latch uut(i,r,o);

initial begin
    $dumpfile("latch.vcd");
    $dumpvars(0,latch_test);
    i = 0; r = 1;
    #1 r = 0;
    #1 i = 1;
    #1 i = 0;
    #4 r = 1;
    #1 r = 0;
    #3
    $finish();
end


endmodule
