class monitor1;
  virtual intf vif;
  mailbox mon1_2_scb;
  function new(virtual intf vif,mailbox mon1_2_scb);
    this.vif = vif;
    this.mon1_2_scb=mon1_2_scb;
  endfunction
  task main();
    #3;
    repeat(1)
      begin
  transaction trans;
  trans=new();
    trans.a=vif.a;
    trans.b=vif.b;
    trans.cin=vif.cin;
    mon1_2_scb.put(trans);
        trans.display("monitor1");
      end
  endtask
endclass
