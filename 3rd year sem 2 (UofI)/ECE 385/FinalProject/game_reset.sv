module game_reset (input [7:0] keycode, output logic reset);

always_comb
begin
	if(keycode == 8'h29)
		reset = 1'b1;
	else
		reset = 1'b0;
end

endmodule