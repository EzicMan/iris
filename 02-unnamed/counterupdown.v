`timescale 1ns/100ps

module counter_updown(
    input clk,
    input rst,
    input up,
    input down,
    output reg [3:0] count
);

always @(posedge clk)
begin
    if(rst) begin
        count <= 4'h0;
    end
    else begin
        // use count from last step
        if(!(up && down)) begin
            if(count != 4'hf)
                count = count + up;
            if(count != 4'h0)
                count = count - down;
        end
    end
end

endmodule

module debug;

reg clk,r,up,down;
wire [3:0] o;

counter_updown test(clk,r,up,down,o);

initial begin
    up = 0;
    down = 0;
    clk = 0;
    r = 1;
    #2 r = 0;
end
always #1 clk = !clk;

initial begin
    $dumpfile("output.vcd");
    $dumpvars(0,debug);
    #2.5 down = 1;
    #1 down = 0;
    #1 up = 1;
    #33 up = 0;
    $finish();
end

endmodule
