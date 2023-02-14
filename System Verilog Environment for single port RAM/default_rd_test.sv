`include "environment.sv"
program test(mem_intf intf);
  class my_trans extends transaction;
     bit [1:0] count;
    function void pre_randomize();
      wr_en.rand_mode(0);
      rd_en.rand_mode(0);
      addr.rand_mode(0);
      wr_en=0;
      rd_en=1;
      addr=cnt;
      cnt++;
    endfunction
  endclass
  environment env;
  my_trans my_tr;
  initial
    begin
      env=new(intf);
      my_tr=new();
      env.gen.repeat_count=4;
      env.gen.trans=my_tr;
      env.run();
      
      
    end
endprogram
