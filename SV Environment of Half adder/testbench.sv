`include "interface.sv"
`include "test.sv"
module testbench_top;
  intf i_intf();
  test t1(i_intf);
  half_adder h1(.a(i_intf.a),.b(i_intf.b),.sum(i_intf.sum),.carry(i_intf.carry));
  initial 
    begin
    
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule
