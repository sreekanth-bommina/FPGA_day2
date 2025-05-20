//tff module 
module tff(t,clk,rst,q);
   input clk,rst,t;
   output reg q;

   always@(posedge clk or posedge rst)begin
       if(rst) q=0;
	   else begin
	      if(t) q=~q;
		  else q=q;
	   end
   end
endmodule

//2bit asynchronous counter using  tff
module asynch_counter_2bit(clk,rst,q);
   input clk,rst;
   output [1:0]q;
   tff dut1(.t(1),.clk(clk),.rst(rst),.q(q[0]));
   tff dut2(.t(1),.clk(~q[0]),.rst(rst),.q(q[1]));
endmodule 

