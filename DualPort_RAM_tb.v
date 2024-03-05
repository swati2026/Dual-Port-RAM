`include "DualPort_RAM.v"

module DualPort_RAM_tb();

    reg [7:0] data_a , data_b;
    reg [5:0] addr_a,addr_b;
    reg we_a,we_b;
    reg clk; 
    wire [7:0] o_a,o_b;

 DualPort_RAM DualPort_RAM(
    .data_a(data_a),.data_b(data_b),
    .addr_a(addr_a),.addr_b(addr_b),
    .we_a(we_a),.we_b(we_b),
    .clk(clk),.o_a(o_a),.o_b(o_b)
    );
     initial begin
        $dumpfile("DualPort_RAM_tb.vcd");
        $dumpvars(0);
    end

    initial
     begin
        clk = 1'b1;
        forever #50 clk = ~clk;
    end

    initial
    begin
        data_a = 8'h55;
        addr_a = 6'h01;

        data_b = 8'h66;
        addr_b = 6'h02;
        
        we_a = 1'b1;
        we_b = 1'b1;
        #100

        addr_a = 6'h02;
        addr_b = 6'h01;

        we_a = 1'b0;
        we_b = 1'b0;
        #100;
        $stop;
    end
   
endmodule
