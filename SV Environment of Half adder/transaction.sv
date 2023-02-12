class transaction;
  rand bit a;
  rand bit b;
  bit sum;
  bit carry;
  function void display(string name);
    $display("==========================");
    $display("%s",name);
    $display("==========================");
    $display("a=%0d,b=%0d",a,b);
    $display("sum=%0d,carry=%0d",sum,carry);
    $display("==========================");
  endfunction
endclass
