module DualPort_RAM(
    input [7:0] data_a , data_b,
    input[5:0] addr_a,addr_b,
    input we_a,we_b,
    input clk, 
    output reg[7:0] o_a,o_b);
reg [7:0] ram[63:0];
always @ (posedge clk)
    begin
      if(we_a)
      begin 
        ram[addr_a] <= data_a;
      end
      else
      begin
        o_a <= ram[addr_a];
      end
    end
always @ (posedge clk)
begin
      if(we_b)
      begin 
        ram[addr_b] <= data_b;
      end
      else
      begin
        o_b <= ram[addr_b];
      end
    end
endmodule