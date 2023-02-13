class transaction;
  randc bit a,b,cin;
  bit sum,carry;
  
  function void display(string name);
    $display("========================");
    $display("%0s",name);
    $display("========================");
    $display("a=%0d,b=%0d,cin=%0d",a,b,cin);
    $display("sum=%0d,carry=%0d",sum,carry);
    $display("=========================");
  endfunction
endclass
