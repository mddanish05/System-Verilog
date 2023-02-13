class driver;
  virtual intf vif;
  mailbox gen2driver;
  function new(virtual intf vif,mailbox gen2driver);
    this.vif =vif;
    this.gen2driver=gen2driver;
  endfunction
  
  task main();
    repeat(1)
      begin
  
  transaction trans;
  gen2driver.get(trans);
  vif.a <= trans.a;
  vif.b <= trans.b;
  vif.cin <= trans.cin;
  trans.sum=vif.sum;
  trans.carry=vif.carry;
  trans.display("generator");
      end
