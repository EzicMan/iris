`timescale 1ns/100ps

module maximum(
    clk,rst,clr,in,in_valid,out
);

input clk,rst,clr,in_valid;
input [3:0] in;
output [3:0] out;

reg [3:0] max;

assign out = max;

always @(posedge clk)
begin
    if(rst)
        max <= 4'h0;
    else begin
        if(clr)
            max <= 4'h0;
        else if((in > max) && in_valid)
            max <= in;
    end
end

endmodule

module debug;

reg clk,r,clr,in_valid;
reg [3:0] in;
wire [3:0] o;

maximum test(.clk(clk),.rst(r),.clr(clr),.in(in),.in_valid(in_valid),.out(o));

initial begin
    clr = 0;
    in_valid = 0;
    clk = 0;
    r = 1;
    #2 r = 0;
end
always #1 clk = !clk;

initial begin
    $dumpfile("output.vcd");
    $dumpvars(0,debug);
    #2.5 in = 4'h1;
    in_valid = 1;
    #1 in_valid = 0;
    in = 4'hf;
    #3 in = 4'ha;
    in_valid = 1;
    #1 in_valid = 0;
    #1 clr = 1;
    #1 clr = 0;
    #1 in = 4'h2;
    in_valid = 1;
    #1
    $finish();
end

endmodule
