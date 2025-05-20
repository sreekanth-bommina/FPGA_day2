//full adder module 
module fa(a,b,c,sum,carry);
   input a,b,c;
   output sum,carry;
   assign sum=a^b^c;
   assign carry=a&b|b&c|c&a;
endmodule 

//half adder module
module ha(a,b,sum,carry);
    input a,b;
	output sum,carry;
	assign sum=a^b;
	assign carry=a&b;
endmodule 

//3bit multiplier using half adder and full adder modules
module multiplier_3bit(a,b,p);
   input [2:0]a,b;
   output [5:0]p;
   
   wire [8:0]w;
   wire c1,c2,c3,c4,c5,c6;
   wire s1,s2;

   assign w[0]=a[0]&b[0];
   assign w[1]=a[0]&b[1];
   assign w[2]=a[0]&b[2];
   assign w[3]=a[1]&b[0];
   assign w[4]=a[1]&b[1];
   assign w[5]=a[1]&b[2];
   assign w[6]=a[2]&b[0];
   assign w[7]=a[2]&b[1];
   assign w[8]=a[2]&b[2];

   assign p[0]=w[0];
   ha dut1(w[1],w[3],p[1],c1);
   fa dut2(w[2],w[4],c1,s1,c2);
   ha dut3(s1,w[6],p[2],c3);
   fa dut4(w[5],w[7],c2,s2,c4);
   ha dut5(c3,s2,p[3],c5);
   fa dut6(c4,c5,w[8],p[4],c6);
   assign p[5]=c6;
endmodule 

