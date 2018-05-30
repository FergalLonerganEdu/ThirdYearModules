module back_flippers ( input [17:0] board,
				  output logic [17:0] out_rotate_cw, out_rotate_ccw, out_rotate_180, out_flip_diag_b, out_flip_diag_f, out_flip_v, out_flip_h);

assign out_rotate_cw = {board[5:4], board[11:10], board[17:16],
								board[3:2], board[9:8], board[15:14],
								board[1:0], board[7:6], board[13:12]};
assign out_rotate_ccw = {board[13:12], board[7:6], board[1:0],
							    board[15:14], board[9:8], board[3:2],
							    board[17:16], board[11:10], board[5:4]};
assign out_rotate_180 = {board[1:0], board[3:2], board[5:4],
								 board[7:6], board[9:8], board[11:10],
								 board[13:12], board[15:14], board[17:16]};
assign out_flip_diag_b = {board[17:16], board[11:10], board[5:4],
								  board[15:14], board[9:8], board[3:2],
								  board[13:12], board[7:6], board[1:0]};
assign out_flip_diag_f = {board[1:0], board[7:6], board[13:12],
								  board[3:2], board[9:8], board[15:14],
								  board[5:4], board[11:10], board[17:16]};
assign out_flip_v = {board[13:12], board[15:14], board[17:16],
							board[7:6], board[9:8], board[11:10],
							board[1:0], board[3:2], board[5:4]};
assign out_flip_h = {board[5:0], board[11:6], board[17:12]};

endmodule

