module counter_debug;

reg clk,r;
wire [1:0] o;

counter uut(clk,r,o);

initial begin
    clk = 0;
    r = 0;
    #2 r = 1;
    #1 r = 0;
end
always #1 clk = !clk;
initial begin
    $dumpfile("output.vcd");
    $dumpvars(0,counter_debug);
    #25
    $finish();
end


endmodule
