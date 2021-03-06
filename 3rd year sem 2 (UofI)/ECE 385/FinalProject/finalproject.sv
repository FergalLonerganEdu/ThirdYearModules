//-------------------------------------------------------------------------
//      final.sv                                                         --
//      Samuel Lim, Fergal Lonergan                                      --
//      Spring 2016                                                      --
//                                                                       --
//                                                                       --
//                                                                       --
//      For use with Boats and Hoes (for the garden variety)             --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------

module finalproject (input CLOCK_50,
								   RESET,
								   PS2_CLK,
								   PS2_DAT,
							input [17:0] switches,
							output error_led,

						   // VGA Interface
						   output [7:0]  VGA_R,					//VGA Red
						 					  VGA_G,					//VGA Green
											  VGA_B,					//VGA Blue
											  keycode,
							output logic [17:0] board,
						   output        VGA_CLK,				//VGA Clock
											  VGA_SYNC_N,			//VGA Sync signal
											  VGA_BLANK_N,			//VGA Blank signal
											  VGA_VS,					//VGA virtical sync signal	
											  VGA_HS					//VGA horizontal sync signal

);

	logic Reset_h;
	assign {Reset_h}=~ (RESET);  // The push buttons are active low
	logic [9:0] drawxsig, drawysig;
	//logic [7:0] keycode;
	logic press;
	//logic [17:0] board_in;
	logic new_clk;
	logic game_resetttt;
	
	thegame thegame (.Clk(CLOCK_50),
						  .keycode(keycode),
						  .press(press),
						  .reset(game_resetttt),
						  .board_out(board),
						  .error(error_led),
						  .switches(switches)
	);
	
	game_reset game_reset (.keycode(keycode), .reset(game_resetttt));
	
	keyboard keyboard_instance (.Clk(CLOCK_50),
							 .psClk(PS2_CLK),
							 .psData(PS2_DAT),
							 .reset(Reset_h),
							 .keyCode(keycode),
							 .press(press)
	);
	
	vga_controller vgasync_instance(.Clk(CLOCK_50),
											  .Reset(Reset_h),
											  .hs(VGA_HS),
											  .vs(VGA_VS),
											  .pixel_clk(VGA_CLK),
											  .blank(VGA_BLANK_N),
											  .sync(VGA_SYNC_N),
											  .DrawX(drawxsig),
											  .DrawY(drawysig)
	);
	
	color_mapper color_instance(.board(board),
										 .DrawX(drawxsig),
										 .DrawY(drawysig),
										 .Red(VGA_R),
										 .Green(VGA_G),
										 .Blue(VGA_B)
	);


endmodule

