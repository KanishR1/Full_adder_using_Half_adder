module tb_full_adder;

reg a,b,cin;
wire sum,cout;

full_adder DUT(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

task initialize;
begin
a = 1'b0;
b = 1'b0;
cin = 1'b0;
end
endtask

task delay(input integer i);
begin
#i;
end
endtask

task stimulus(input integer o);
begin
    {a,b,cin} = o;
end
endtask

integer k;
initial begin
   initialize;
   delay(10);
   for (k = 0; k<8; k=k+1) begin
        stimulus(k);
        delay(10);
    end
    $finish;
end
initial $monitor("a = %b, b = %b, cin = %b, cout = %b, sum = %b",a,b,cin,cout,sum);


endmodule