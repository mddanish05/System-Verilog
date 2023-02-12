class driver;
  virtual intf vif;
  mailbox gen2drive;
  function new(virtual intf vif,mailbox gen2drive);
    this.vif=vif;
    this.gen2drive=gen2drive;
  endfunction
  task main;
    repeat(1)
      begin
        transaction trans; //creating handle
        gen2drive.get(trans); //getting value from mailbox
        vif.a<=trans.a;
        vif.b<=trans.b;
        trans.sum=vif.sum;
        trans.carry=vif.carry;
        trans.display("driver");
      end
  endtask
endclass
