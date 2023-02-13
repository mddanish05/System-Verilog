class monitor2;
  virtual intf vif;
  mailbox  mon2_2_scb;
  function new(virtual intf vif,mailbox mon2_2_scb);
    this.vif=vif;
    this.mon2_2_scb=mon2_2_scb;
  endfunction 
  
  task main();
    #4;
    repeat(1)
      begin
     
    transaction trans;
    trans=new();
        trans.a=vif.a;
        trans.b=vif.b;
        trans.cin=vif.cin;
    trans.sum=vif.sum;
    trans.carry=vif.carry;
    mon2_2_scb.put(trans);
    trans.display("monitor2");
      end
  endtask
  
endclass
