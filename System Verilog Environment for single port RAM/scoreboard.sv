class scoreboard;
  mailbox mon2scb;
  int no_transactions;
  bit [7:0] mem[4];
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
    foreach(mem[i])
      begin
        mem[i]=8'hFF;
      end
    
  endfunction
  
  task main;
    transaction trans;
    forever 
      begin
      #50;
      mon2scb.get(trans);
      if(trans.rd_en)
        begin
          if(mem[trans.addr] != trans.rdata)
            begin
              $error("[SCB_FAIL] Addr =%0h,\n \t Data::Expected=%0h Actual =%0h",trans.addr,mem[trans.addr],trans.rdata);
            end
          else 
            begin
              $display("[SCB-PASS] addr=%0h,\n Data::Expected=%0h Actual =%0h",trans.addr,mem[trans.addr],trans.rdata);
            end
        end
          else if(trans.wr_en)
            begin
              mem[trans.addr]=trans.wdata;
            end
          no_transactions++;
      end
       
   endtask
endclass
