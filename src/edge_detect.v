module edge_detect
//#()
(
input clk,
input rst,
input signal,
output p_edge,
output n_edge,
output both_edge
);

reg sig_0,sig_1;
assign p_edge=~sig_1&sig_0;
assign n_edge=sig_1&~sig_0;
assign both_edge=sig_1^sig_0;

always @ (posedge clk or negedge rst) begin
	if (!rst) begin
		sig_0<=0;
		sig_1<=0;
	end
	else begin
		sig_0<=signal;
		sig_1<=sig_0;
	end
end

endmodule
