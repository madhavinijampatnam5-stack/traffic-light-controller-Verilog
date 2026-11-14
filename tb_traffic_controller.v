
`timescale 1ns/1ps
module tb_traffic_light_controller();
    reg clk;
    reg reset;
    wire [1:0] NS_light;
  wire [1:0] EW_light;
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .NS_light(NS_light),
        .EW_light(EW_light)
    );
    always begin
        #5 clk = ~clk;
    end
    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #100 $finish;
    end
    initial begin
        $monitor("At time %t, NS_light = %b, EW_light = %b", $time, NS_light, EW_light);
    end
endmodule
