module half_subtractor(a,b,diff,br);
input a,b;
output diff,br;
assign diff = a^b;
assign br = ~(a)&b;
endmodule

module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
wire w1, w2, w3, w4, w5;
not n1(w1, a);
half_subtractor H1(.a(w1), .b(b), .diff(w3), .br(w4));
half_subtractor H2(.a(w3), .b(cin), .diff(w2), .br(w5));
or o1(cout, w5,w4);
not n2(sum,w2);
endmodule