// Code your design here
module full_adder(sum,carry,a,b,cin);
output sum,carry;
input a,b,cin;
assign sum=a^b^cin;
assign carry=((a&b)|(b&cin)|(cin&a));

endmodule
