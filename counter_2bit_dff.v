//dff module 
module dff(d,clk,rst,q);
   input clk,rst,d;
   output reg q;

   always@(posedge clk or posedge rst)begin
       if(rst) q=0;
	   else q=d; 
   end
endmodule

//2bit asynchronous counter using  tff
module asynch_counter_2bit_dff(clk,rst,q);
   input clk,rst;
   output [1:0]q;
   dff dut1(.d(~q),.clk(clk),.rst(rst),.q(q[0]));
   dff dut2(.d(~q),.clk(~q[0]),.rst(rst),.q(q[1]));
endmodule 

