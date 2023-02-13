class scoreboard;
  mailbox mon1_2_scb;
  mailbox mon2_2_scb;
  
  function new(mailbox mon1_2_scb,mon2_2_scb);
    this.mon1_2_scb=mon1_2_scb;
    this.mon2_2_scb=mon2_2_scb;
    endfunction
  task main();
    transaction trans;
    repeat(1)
      begin
        mon1_2_scb.get(trans);
        mon2_2_scb.get(trans);
        if(((trans.a^trans.b^trans.cin)==trans.sum)&&(((trans.a&trans.b)|(trans.b&trans.cin)|(trans.cin&trans.a))==trans.carry))
          $display("Result is as Expected");
      else
        $error("wrong result");
        
        trans.display("scoreboard");
      end
    
    
  endtask
endclass
