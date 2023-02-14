`define DRIV_IF mem_vif.DRIVER.driver_cb
class driver;
  int no_transactions;
  virtual mem_intf mem_vif;
  mailbox gen2driv;
  function new(virtual mem_intf mem_vif,mailbox gen2driv);
    this.mem_vif=mem_vif;
    this.gen2driv=gen2driv;
  endfunction
  
  task reset;
    wait(mem_vif.reset);
    $display("---[Driver] Reset started------");
    `DRIV_IF.wr_en<=0;
    `DRIV_IF.rd_en<=0;
    `DRIV_IF.addr<=0;
    `DRIV_IF.wdata<=0;
    wait(!mem_vif.reset);
    $display("----------[DRIVER] Reset ended--------");
    
  endtask
  
  task drive;
    transaction trans;
    `DRIV_IF.wr_en<=0;
    `DRIV_IF.rd_en<=0;
    gen2driv.get(trans);
    $display("---------[Driver -Transfer: %0d]---",no_transactions);
    @(posedge mem_vif.DRIVER.clk)
    `DRIV_IF.addr<=trans.addr;
    if(trans.wr_en)
      begin
        `DRIV_IF.wr_en<=trans.wr_en;
        `DRIV_IF.wdata<=trans.wdata;
        $display("\tADDR=%0h \tDATA=%0h",trans.addr,trans.wdata);
                 @(posedge mem_vif.DRIVER.clk);
      end
   else if(trans.rd_en)
                   begin
                     `DRIV_IF.rd_en<=trans.rd_en;
                     @(posedge mem_vif.DRIVER.clk);
                     `DRIV_IF.rd_en<=0;
                     @(posedge mem_vif.DRIVER.clk);
                     trans.rdata=`DRIV_IF.rdata;
                     $display("\tADDR=%0h \tRDATA=%0h",trans.addr,`DRIV_IF.rdata);
                     
                   end
                 $display("--------------------------------");
                 no_transactions++;
  endtask
                 task main;
                   forever 
                     begin
                       fork
                         begin
                           wait(mem_vif.reset);
                         end
                         begin
                           forever
                             drive();
                         end
                       join_any
                       disable fork;
                     end
                 endtask
  
  
endclass
