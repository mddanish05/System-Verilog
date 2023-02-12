class monitor1;
  virtual intf vif;
  mailbox mon2scb;
  function new(virtual intf vif, mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    #1;
    repeat(1)
      begin
        transaction trans;
        trans=new();
        trans.a=vif.a;
        trans.b=vif.b;
        trans.sum=vif.sum;
        trans.carry=vif.carry;
        mon2scb.put(trans);
        trans.display("monitor1");
      end
  endtask
endclass
