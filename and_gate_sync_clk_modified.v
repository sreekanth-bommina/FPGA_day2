//and gate design that output is synchronization with clock
module and_gate_sync_clk(a,b,clk,y);
   input a,b,clk;
   output y;
   always@(posedge clk)begin
      assign y=a&b;
   end
endmodule
