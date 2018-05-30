module thegame (input Clk,
							 reset,
							 press,
					 input [7:0] keycode,
					 input [17:0] switches,
					 output logic [17:0] board_out,
					 output logic error
);
enum logic [4:0] {WAIT,
						SEARCH_1, SEARCH_2, SEARCH_3, SEARCH_4, SEARCH_5, SEARCH_6, SEARCH_7,
						SEARCH_8, SEARCH_9, SEARCH_10, SEARCH_11, SEARCH_12, SEARCH_13, SEARCH_14,
						SEARCH_15, SEARCH_16, SEARCH_17, SEARCH_18, SEARCH_19, SEARCH_20, SEARCH_21,
						SEARCH_22, SEARCH_23, SEARCH_24, SEARCH_25, SEARCH_26, SEARCH_27, SEARCH_28, READY, ERROR, RESET} state, next_state;

logic found;

logic [4:0] table_addr;
logic [35:0] table_data_1, table_data_2, table_data_3, table_data_4, table_data_5;
logic [17:0] rotate_cw, rotate_ccw, rotate_180, flip_b, flip_f, flip_v, flip_h;

lookuptable_rom_1 table1(.addr(table_addr), .data(table_data_1));
lookuptable_rom_2 table2(.addr(table_addr), .data(table_data_2));
lookuptable_rom_3 table3(.addr(table_addr), .data(table_data_3));
lookuptable_rom_4 table4(.addr(table_addr), .data(table_data_4));
lookuptable_rom_5 table5(.addr(table_addr), .data(table_data_5));

logic oddeven;
parity parity(.in(board_out), .oddeven(oddeven));

logic load_board;
logic [17:0] board_in;
reg_18 board_reg(.Clk(Clk), .Reset(reset), .Shift_In(1'b0), .Load(load_board), .Shift_En (1'b0), .D(board_in), .Data_Out(board_out));

flippers flippers(.in(board_out),
						.rotate_cw_90(rotate_cw),
						.rotate_ccw_90(rotate_ccw),
						.rotate_180(rotate_180),
						.flip_diag_backslash(flip_b),
						.flip_diag_forward(flip_f),
						.flip_vert(flip_v),
						.flip_horz(flip_h)
);

logic [17:0]		out_rotate_cw1,
						out_rotate_ccw1,
						out_rotate_1801,
						out_flip_diag_b1,
						out_flip_diag_f1,
						out_flip_v1,
						out_flip_h1,
						out_rotate_cw2,
						out_rotate_ccw2,
						out_rotate_1802,
						out_flip_diag_b2,
						out_flip_diag_f2,
						out_flip_v2,
						out_flip_h2,
						out_rotate_cw3,
						out_rotate_ccw3,
						out_rotate_1803,
						out_flip_diag_b3,
						out_flip_diag_f3,
						out_flip_v3,
						out_flip_h3,
						out_rotate_cw4,
						out_rotate_ccw4,
						out_rotate_1804,
						out_flip_diag_b4,
						out_flip_diag_f4,
						out_flip_v4,
						out_flip_h4,
						out_rotate_cw5,
						out_rotate_ccw5,
						out_rotate_1805,
						out_flip_diag_b5,
						out_flip_diag_f5,
						out_flip_v5,
						out_flip_h5;
					
back_flippers back1(.board(table_data_1[17:0]),
					.out_rotate_cw(out_rotate_cw1),
					.out_rotate_ccw(out_rotate_ccw1),
					.out_rotate_180(out_rotate_1801),
					.out_flip_diag_b(out_flip_diag_b1),
					.out_flip_diag_f(out_flip_diag_f1),
					.out_flip_v(out_flip_v1),
					.out_flip_h(out_flip_h1));
					
back_flippers back2(.board(table_data_2[17:0]),
					.out_rotate_cw(out_rotate_cw2),
					.out_rotate_ccw(out_rotate_ccw2),
					.out_rotate_180(out_rotate_1802),
					.out_flip_diag_b(out_flip_diag_b2),
					.out_flip_diag_f(out_flip_diag_f2),
					.out_flip_v(out_flip_v2),
					.out_flip_h(out_flip_h2));
					
back_flippers back3(.board(table_data_3[17:0]),
					.out_rotate_cw(out_rotate_cw3),
					.out_rotate_ccw(out_rotate_ccw3),
					.out_rotate_180(out_rotate_1803),
					.out_flip_diag_b(out_flip_diag_b3),
					.out_flip_diag_f(out_flip_diag_f3),
					.out_flip_v(out_flip_v3),
					.out_flip_h(out_flip_h3));
					
back_flippers back4(.board(table_data_4[17:0]),
					.out_rotate_cw(out_rotate_cw4),
					.out_rotate_ccw(out_rotate_ccw4),
					.out_rotate_180(out_rotate_1804),
					.out_flip_diag_b(out_flip_diag_b4),
					.out_flip_diag_f(out_flip_diag_f4),
					.out_flip_v(out_flip_v4),
					.out_flip_h(out_flip_h4));
					
back_flippers back5(.board(table_data_5[17:0]),
					.out_rotate_cw(out_rotate_cw5),
					.out_rotate_ccw(out_rotate_ccw5),
					.out_rotate_180(out_rotate_1805),
					.out_flip_diag_b(out_flip_diag_b5),
					.out_flip_diag_f(out_flip_diag_f5),
					.out_flip_v(out_flip_v5),
					.out_flip_h(out_flip_h5));
	
always_ff @ (posedge Clk, posedge reset) begin
	if (reset == 1'b1)
	begin
		state <= RESET;
	end
	else
	begin
		state <= next_state;
	end
end

always_comb begin
	next_state = state;
	error = 1'b0;
	case (state)
		WAIT: begin
			if (press && oddeven)
				next_state = SEARCH_1;
			else
				next_state = WAIT;
		end
		
		SEARCH_1: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_2;
		end
		
		SEARCH_2: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_3;
		end
		
		SEARCH_3: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_4;
		end
		
		SEARCH_4: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_5;
		end
		
		SEARCH_5: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_6;
		end
		
		SEARCH_6: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_7;
		end
		
		SEARCH_7: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_8;
		end
		
		SEARCH_8: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_9;
		end
		
		SEARCH_9: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_10;
		end
		
		SEARCH_10: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_11;
		end
		
		SEARCH_11: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_12;
		end
		
		SEARCH_12: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_13;
		end
		
		SEARCH_13: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_14;
		end
		
		SEARCH_14: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_15;
		end
		
		SEARCH_15: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_16;
		end
		
		SEARCH_16: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_17;
		end
		
		SEARCH_17: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_18;
		end
		
		SEARCH_18: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_19;
		end
		
		SEARCH_19: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_20;
		end
		
		SEARCH_20: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_21;
		end
		
		SEARCH_21: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_22;
		end
		
		SEARCH_22: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_23;
		end
		
		SEARCH_23: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_24;
		end
		
		SEARCH_24: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_25;
		end
		
		SEARCH_25: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_26;
		end
		
		SEARCH_26: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_27;
		end
		
		SEARCH_27: begin
			if (found)
				next_state = READY;
			else
				next_state = SEARCH_28;
		end
		
		SEARCH_28: begin
			if (found)
				next_state = READY;
			else
				next_state = ERROR;
		end
		
		READY: begin
			if (~press)
				next_state = WAIT;
		end
		
		ERROR: begin
			error = 1'b1;
		end
		
		RESET: begin
			next_state = WAIT;
		end
		
	endcase
end

//always_ff @ (negedge Clk, posedge reset) begin
always_comb begin
	load_board = 1'b0;
	found = 1'b0;
	board_in = 18'b0;
	case(state)
		WAIT: begin
			found = 1'b0;
			if (press && ~oddeven)
			begin
				if(keycode == 8'h69)
					board_in = board_out | 18'b000000000000010000;
				else if (keycode == 8'h72)
					board_in = board_out | 18'b000000000000000100;
				else if (keycode == 8'h7a)
					board_in = board_out | 18'b000000000000000001;	
				else if (keycode == 8'h6b)
					board_in = board_out | 18'b000000010000000000;
				else if (keycode == 8'h73)
					board_in = board_out | 18'b000000000100000000;
				else if (keycode == 8'h74)
					board_in = board_out | 18'b000000000001000000;
				else if (keycode == 8'h6c)
					board_in = board_out | 18'b010000000000000000;
				else if (keycode == 8'h75)
					board_in = board_out | 18'b000100000000000000;
				else if (keycode == 8'h7d)
					board_in = board_out | 18'b000001000000000000;
				else
					board_in = board_out;
				
			/*	if (switches[2])
					board_in = board_out | 18'b000000000000010000;
				else if (switches[1])
					board_in = board_out | 18'b000000000000000100;
				else if (switches[0])
					board_in = board_out | 18'b000000000000000001;	
				else if (switches[5])
					board_in = board_out | 18'b000000010000000000;
				else if (switches[4])
					board_in = board_out | 18'b000000000100000000;
				else if (switches[3])
					board_in = board_out | 18'b000000000001000000;
				else if (switches[8])
					board_in = board_out | 18'b010000000000000000;
				else if (switches[7])
					board_in = board_out | 18'b000100000000000000;
				else if (switches[6])
					board_in = board_out | 18'b000001000000000000;
				else
					board_in = board_out; */
				
			end
			else
				board_in = board_out;
			load_board = 1'b1;
		end
		READY: begin
			found = 1'b0;
			load_board = 1'b0;
		end
		ERROR: begin
			found = 1'b0;
			load_board = 1'b0;
		end
		RESET: begin
			load_board = 1'b1;
		end
		
		default: begin
			if (table_data_1[35:18] == board_out)
			begin
				board_in = table_data_1[17:0];
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_1[35:18] == rotate_cw)
			begin
				board_in = out_rotate_ccw1;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_1[35:18] == rotate_ccw)
			begin
				board_in = out_rotate_cw1;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_1[35:18] == rotate_180)
			begin
				board_in = out_rotate_1801;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_1[35:18] == flip_b)
			begin
				board_in = out_flip_diag_b1;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_1[35:18] == flip_f)
			begin
				board_in = out_flip_diag_f1;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_1[35:18] == flip_v)
			begin
				board_in = out_flip_v1;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_1[35:18] == flip_h)
			begin
				board_in = out_flip_h1;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_2[35:18] == board_out)
			begin
				board_in = table_data_2[17:0];
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_2[35:18] == rotate_cw)
			begin
				board_in = out_rotate_ccw2;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_2[35:18] == rotate_ccw)
			begin
				board_in = out_rotate_cw2;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_2[35:18] == rotate_180)
			begin
				board_in = out_rotate_1802;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_2[35:18] == flip_b)
			begin
				board_in = out_flip_diag_b2;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_2[35:18] == flip_f)
			begin
				board_in = out_flip_diag_f2;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_2[35:18] == flip_v)
			begin
				board_in = out_flip_v2;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_2[35:18] == flip_h)
			begin
				board_in = out_flip_h2;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_3[35:18] == board_out)
			begin
				board_in = table_data_3[17:0];
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_3[35:18] == rotate_cw)
			begin
				board_in = out_rotate_ccw3;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_3[35:18] == rotate_ccw)
			begin
				board_in = out_rotate_cw3;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_3[35:18] == rotate_180)
			begin
				board_in = out_rotate_1803;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_3[35:18] == flip_b)
			begin
				board_in = out_flip_diag_b3;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_3[35:18] == flip_f)
			begin
				board_in = out_flip_diag_f3;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_3[35:18] == flip_v)
			begin
				board_in = out_flip_v3;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_3[35:18] == flip_h)
			begin
				board_in = out_flip_h3;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_4[35:18] == board_out)
			begin
				board_in = table_data_4[17:0];
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_4[35:18] == rotate_cw)
			begin
				board_in = out_rotate_ccw4;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_4[35:18] == rotate_ccw)
			begin
				board_in = out_rotate_cw4;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_4[35:18] == rotate_180)
			begin
				board_in = out_rotate_1804;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_4[35:18] == flip_b)
			begin
				board_in = out_flip_diag_b4;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_4[35:18] == flip_f)
			begin
				board_in = out_flip_diag_f4;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_4[35:18] == flip_v)
			begin
				board_in = out_flip_v4;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_4[35:18] == flip_h)
			begin
				board_in = out_flip_h4;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_5[35:18] == board_out)
			begin
				board_in = table_data_5[17:0];
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_5[35:18] == rotate_cw)
			begin
				board_in = out_rotate_ccw5;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_5[35:18] == rotate_ccw)
			begin
				board_in = out_rotate_cw5;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_5[35:18] == rotate_180)
			begin
				board_in = out_rotate_1805;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_5[35:18] == flip_b)
			begin
				board_in = out_flip_diag_b5;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_5[35:18] == flip_f)
			begin
				board_in = out_flip_diag_f5;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_5[35:18] == flip_v)
			begin
				board_in = out_flip_v5;
				load_board = 1'b1;
				found = 1'b1;
			end
			else if (table_data_5[35:18] == flip_h)
			begin
				board_in = out_flip_h5;
				load_board = 1'b1;
				found = 1'b1;
			end
		end
	endcase
end

always_comb begin
	table_addr = 5'b0;
	case (state)
		WAIT: begin
		end
		
		SEARCH_1: begin
			table_addr = 5'd0;
		end
		
		SEARCH_2: begin
			table_addr = 5'd1;
		end
		
		SEARCH_3: begin
			table_addr = 5'd2;
		end
		
		SEARCH_4: begin
			table_addr = 5'd3;
		end
		
		SEARCH_5: begin
			table_addr = 5'd4;
		end
		
		SEARCH_6: begin
			table_addr = 5'd5;
		end
		
		SEARCH_7: begin
			table_addr = 5'd6;
		end
		
		SEARCH_8: begin
			table_addr = 5'd7;
		end
		
		SEARCH_9: begin
			table_addr = 5'd8;
		end
		
		SEARCH_10: begin
			table_addr = 5'd9;
		end
		
		SEARCH_11: begin
			table_addr = 5'd10;
		end
		
		SEARCH_12: begin
			table_addr = 5'd11;
		end
		
		SEARCH_13: begin
			table_addr = 5'd12;
		end
		
		SEARCH_14: begin
			table_addr = 5'd13;
		end
		
		SEARCH_15: begin
			table_addr = 5'd14;
		end
		
		SEARCH_16: begin
			table_addr = 5'd15;
		end
		
		SEARCH_17: begin
			table_addr = 5'd16;
		end
		
		SEARCH_18: begin
			table_addr = 5'd17;
		end
		
		SEARCH_19: begin
			table_addr = 5'd18;
		end
		
		SEARCH_20: begin
			table_addr = 5'd19;
		end
		
		SEARCH_21: begin
			table_addr = 5'd20;
		end
		
		SEARCH_22: begin
			table_addr = 5'd21;
		end
		
		SEARCH_23: begin
			table_addr = 5'd22;
		end
		
		SEARCH_24: begin
			table_addr = 5'd23;
		end
		
		SEARCH_25: begin
			table_addr = 5'd24;
		end
		
		SEARCH_26: begin
			table_addr = 5'd25;
		end
		
		SEARCH_27: begin
			table_addr = 5'd26;
		end
		
		SEARCH_28: begin
			table_addr = 5'd27;
		end
		
		READY: begin
		end
	endcase
end

endmodule