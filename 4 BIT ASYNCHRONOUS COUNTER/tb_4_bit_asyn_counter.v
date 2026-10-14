module up_counter_tb();
  reg[3:0]din;
  reg clk, rst, load;
  wire [3:0]count;

  up_counterDUT(clk,rst,din,load,count);

  initial 
    begin 
      clk = 1'b0;
      forever #5 clk = ~clk;
    end
  initial
    begin
      {rst, load} = 0;
      din = 4'd0;
    end

  initial
    begin 
      {rst,load} = 2'b10; din=4'd3: #10;
      {rst,load} = 2'b01; din=4'd3: #10;
      {rst,load} = 2'b00; din=4'd3: #10;
      {rst,load} = 2'b00; din=4'd3: #10;
      {rst,load} = 2'b00; din=4'd3: #10;
      {rst,load} = 2'b11; din=4'd3: #10;
      {rst,load} = 2'b00; din=4'd3: #10;
      {rst,load} = 2'b10; din=4'd3: #10;

    end 
  initial 
    begin
      $monitor($time."input din=%b output)
