module top(clk, reset_l);

input clk, reset_l;
reg array [255:0];
wire [7:0] in_tmp='h32;
int i;
bit index=0;

`ifndef MOD_RTL
always @(posedge clk) begin
	if (~reset_l) begin
		for (i=0; i<256; i++)
			array[i] <= 0; // Need Non-delayed for verilatoror
	end
	else begin
		array[index] <= in_tmp;
	end 
	$write("*-* All Finished *-*\n");
	$finish;
end
`else
always @(posedge clk) begin
	if (~reset_l) begin
		for (i=0; i<256; i++)
			array[i] = 0; // Need Non-delayed for verilatoror
	end
end
always @(posedge clk) begin
	if (~reset_l) begin
		//for (i=0; i<256; i++)
		//	array[i] <= 0; // Need Non-delayed for verilatoror
	end
	else begin
		array[index] <= in_tmp;
	end 
	$write("*-* All Finished *-*\n");
	$finish;
end
`endif 

endmodule
