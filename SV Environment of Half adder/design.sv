module half_adder(sum,carry,a,b);
  input a,b;
  output sum,carry;
  xor g1(sum,a,b);
  and g2(carry,a,b);
endmodule
