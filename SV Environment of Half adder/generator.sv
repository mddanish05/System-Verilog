class generator;
  transaction trans; // handle of transaction
  mailbox gen2drive; //declaring mailbox
  function new(mailbox gen2drive); //mailbox constructor
    this.gen2drive=gen2drive; //
  endfunction
  task main();
    repeat(1)
    begin
      trans=new();       //creating trans object
      trans.randomize(); //randomising value of trans class
    	trans.display("generator"); //checking randomise value
    	gen2drive.put(trans); //putting value in mailbox
    end
  endtask
endclass
