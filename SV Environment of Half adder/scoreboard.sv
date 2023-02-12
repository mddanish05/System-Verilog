class scoreboard;
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb =mon2scb;
  endfunction 
  
  task main;
    transaction trans;
    repeat(1)
      begin
        mon2scb.get(trans); // geting the informatoin from mailbox
        if(((trans.a^trans.b)==trans.sum)&&((trans.a&trans.b)==trans.carry))
        $display("Result is as Expected");
        else 
          $display("wrong result");
        
        trans.display("scoreboard");
      end
  endtask
  endclass
