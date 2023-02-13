`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor1.sv"
`include "monitor2.sv"
`include "scoreboard.sv"
class environment;
  generator gen;
  driver drive;
  monitor1 mon1;
  monitor2 mon2;
  scoreboard scb;
  mailbox m1,m2,m3;
  virtual intf vif;
  function new(virtual intf vif);
   this.vif=vif;
    m1=new();
    m2=new();
    m3=new();
    gen =new(m1);
    drive=new(vif,m1);
    mon1=new(vif,m2);
    mon2=new(vif,m3);
    scb=new(m2,m3);
    
  endfunction
  task test();
    fork
      gen.main();
      drive.main();
      mon1.main();
      mon2.main();
      scb.main();
    join
  endtask
  
  task run;
    test();
    $finish();
    
  endtask
  
  
endclass 
