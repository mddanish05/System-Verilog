class generator;
  transaction trans;
  mailbox gen2driver;
  function new(mailbox gen2driver);
  this.gen2driver=gen2driver;
  
  endfunction
  task main();
    repeat(1)
    begin
      trans =new();
      trans.randomize();
      trans.display("generator");
      gen2driver.put(trans);
    end
   endtask
  
endclass
