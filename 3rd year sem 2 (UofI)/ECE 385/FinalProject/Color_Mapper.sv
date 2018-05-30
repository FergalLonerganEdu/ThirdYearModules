//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [17:0] board,
							  input        [9:0] DrawX, DrawY,
                       output logic [7:0]  Red, Green, Blue );
    
    logic shape1_on;
    logic shape2_on;
    logic shape3_on;
    logic shape4_on;
    logic shape5_on;
    logic shape6_on;
    logic shape7_on;
    logic shape8_on;
    logic shape9_on;
	 
	 logic[8:0] shape1_x = 30;
	 logic[8:0] shape1_y = 30;
	 logic[8:0] shape1_size_x = 100;
	 logic[8:0] shape1_size_y = 100;
	 
	 logic[8:0] shape2_x = 190;
	 logic[8:0] shape2_y = 30;
	 logic[8:0] shape2_size_x = 100;
	 logic[8:0] shape2_size_y = 100;
	 
	 logic[8:0] shape3_x = 350;
	 logic[8:0] shape3_y = 30;
	 logic[8:0] shape3_size_x = 100;
	 logic[8:0] shape3_size_y = 100;
	 
	 logic[8:0] shape4_x = 30;
	 logic[8:0] shape4_y = 190;
	 logic[8:0] shape4_size_x = 100;
	 logic[8:0] shape4_size_y = 100;
	 
	 logic[8:0] shape5_x = 190;
	 logic[8:0] shape5_y = 190;
	 logic[8:0] shape5_size_x = 100;
	 logic[8:0] shape5_size_y = 100;
	 
	 logic[8:0] shape6_x = 350;
	 logic[8:0] shape6_y = 190;
	 logic[8:0] shape6_size_x = 100;
	 logic[8:0] shape6_size_y = 100;
	 
	 logic[8:0] shape7_x = 30;
	 logic[8:0] shape7_y = 350;
	 logic[8:0] shape7_size_x = 100;
	 logic[8:0] shape7_size_y = 100;
	 
	 logic[8:0] shape8_x = 190;
	 logic[8:0] shape8_y = 350;
	 logic[8:0] shape8_size_x = 100;
	 logic[8:0] shape8_size_y = 100;
	 
	 logic[8:0] shape9_x = 350;
	 logic[8:0] shape9_y = 350;
	 logic[8:0] shape9_size_x = 100;
	 logic[8:0] shape9_size_y = 100;
	 
	 logic [6:0] xcoord, ycoord;
	 wire [11:0] sprite_addr;
	 logic [23:0] conor_data, debjit_data, pixel_data;
	 conor_rom conor(.addr(sprite_addr), .data(conor_data));
	 debjit_rom debjit(.addr(sprite_addr), .data(debjit_data));
	 sprite_addr_rom mult_table(.xcoord( xcoord[6:1]) , .ycoord(ycoord[6:1]), .addr(sprite_addr));
	 
	 
	 
    always_comb
    begin:shape_proc
			if (DrawX >= shape1_x && DrawX < shape1_x +shape1_size_x &&
				 DrawY >= shape1_y && DrawY < shape1_y +shape1_size_y)
				begin 
					shape1_on = 1'b1;
					shape2_on = 1'b0;
					shape3_on = 1'b0;
					shape4_on = 1'b0;
					shape5_on = 1'b0;
					shape6_on = 1'b0;
					shape7_on = 1'b0;
					shape8_on = 1'b0;
					shape9_on = 1'b0;
					xcoord = DrawX-shape1_x;
					ycoord = DrawY-shape1_y;
					if (board[16] == 1'b1)
						pixel_data = debjit_data;
					else if (board[17] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else if (DrawX >= shape2_x && DrawX < shape2_x +shape2_size_x &&
					   DrawY >= shape2_y && DrawY < shape2_y +shape2_size_y)
				begin 
					shape1_on = 1'b0;
					shape2_on = 1'b1;
					shape3_on = 1'b0;
					shape4_on = 1'b0;
					shape5_on = 1'b0;
					shape6_on = 1'b0;
					shape7_on = 1'b0;
					shape8_on = 1'b0;
					shape9_on = 1'b0;
					xcoord = DrawX-shape2_x;
					ycoord = DrawY-shape2_y;
					if (board[14] == 1'b1)
						pixel_data = debjit_data;
					else if (board[15] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else if (DrawX >= shape3_x && DrawX < shape3_x +shape3_size_x &&
					   DrawY >= shape3_y && DrawY < shape3_y +shape3_size_y)
				begin 
					shape1_on = 1'b0;
					shape2_on = 1'b0;
					shape3_on = 1'b1;
					shape4_on = 1'b0;
					shape5_on = 1'b0;
					shape6_on = 1'b0;
					shape7_on = 1'b0;
					shape8_on = 1'b0;
					shape9_on = 1'b0;
					xcoord = DrawX-shape3_x;
					ycoord = DrawY-shape3_y;
					if (board[12] == 1'b1)
						pixel_data = debjit_data;
					else if (board[13] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else if (DrawX >= shape4_x && DrawX < shape4_x +shape4_size_x &&
					   DrawY >= shape4_y && DrawY < shape4_y +shape4_size_y)
				begin 
					shape1_on = 1'b0;
					shape2_on = 1'b0;
					shape3_on = 1'b0;
					shape4_on = 1'b1;
					shape5_on = 1'b0;
					shape6_on = 1'b0;
					shape7_on = 1'b0;
					shape8_on = 1'b0;
					shape9_on = 1'b0;
					xcoord = DrawX-shape4_x;
					ycoord = DrawY-shape4_y;
					if (board[10] == 1'b1)
						pixel_data = debjit_data;
					else if (board[11] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else if (DrawX >= shape5_x && DrawX < shape5_x +shape5_size_x &&
					   DrawY >= shape5_y && DrawY < shape5_y +shape5_size_y)
				begin 
					shape1_on = 1'b0;
					shape2_on = 1'b0;
					shape3_on = 1'b0;
					shape4_on = 1'b0;
					shape5_on = 1'b1;
					shape6_on = 1'b0;
					shape7_on = 1'b0;
					shape8_on = 1'b0;
					shape9_on = 1'b0;
					xcoord = DrawX-shape5_x;
					ycoord = DrawY-shape5_y;
					if (board[8] == 1'b1)
						pixel_data = debjit_data;
					else if (board[9] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else if (DrawX >= shape6_x && DrawX < shape6_x +shape6_size_x &&
					   DrawY >= shape6_y && DrawY < shape6_y +shape6_size_y)
				begin 
					shape1_on = 1'b0;
					shape2_on = 1'b0;
					shape3_on = 1'b0;
					shape4_on = 1'b0;
					shape5_on = 1'b0;
					shape6_on = 1'b1;
					shape7_on = 1'b0;
					shape8_on = 1'b0;
					shape9_on = 1'b0;
					xcoord = DrawX-shape6_x;
					ycoord = DrawY-shape6_y;
					if (board[6] == 1'b1)
						pixel_data = debjit_data;
					else if (board[7] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else if (DrawX >= shape7_x && DrawX < shape7_x +shape7_size_x &&
					   DrawY >= shape7_y && DrawY < shape7_y +shape7_size_y)
				begin 
					shape1_on = 1'b0;
					shape2_on = 1'b0;
					shape3_on = 1'b0;
					shape4_on = 1'b0;
					shape5_on = 1'b0;
					shape6_on = 1'b0;
					shape7_on = 1'b1;
					shape8_on = 1'b0;
					shape9_on = 1'b0;
					xcoord = DrawX-shape7_x;
					ycoord = DrawY-shape7_y;
					if (board[4] == 1'b1)
						pixel_data = debjit_data;
					else if (board[5] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else if (DrawX >= shape8_x && DrawX < shape8_x +shape8_size_x &&
					   DrawY >= shape8_y && DrawY < shape8_y +shape8_size_y)
				begin 
					shape1_on = 1'b0;
					shape2_on = 1'b0;
					shape3_on = 1'b0;
					shape4_on = 1'b0;
					shape5_on = 1'b0;
					shape6_on = 1'b0;
					shape7_on = 1'b0;
					shape8_on = 1'b1;
					shape9_on = 1'b0;
					xcoord = DrawX-shape8_x;
					ycoord = DrawY-shape8_y;
					if (board[2] == 1'b1)
						pixel_data = debjit_data;
					else if (board[3] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else if (DrawX >= shape9_x && DrawX < shape9_x +shape9_size_x &&
					   DrawY >= shape9_y && DrawY < shape9_y +shape9_size_y)
				begin 
					shape1_on = 1'b0;
					shape2_on = 1'b0;
					shape3_on = 1'b0;
					shape4_on = 1'b0;
					shape5_on = 1'b0;
					shape6_on = 1'b0;
					shape7_on = 1'b0;
					shape8_on = 1'b0;
					shape9_on = 1'b1;
					xcoord = DrawX-shape9_x;
					ycoord = DrawY-shape9_y;
					if (board[0] == 1'b1)
						pixel_data = debjit_data;
					else if (board[1] == 1'b1)
						pixel_data = conor_data;
					else
						pixel_data = 24'hffffff;
				end
			else
				begin
					shape1_on = 1'b0;
					shape2_on = 1'b0;
					shape3_on = 1'b0;
					shape4_on = 1'b0;
					shape5_on = 1'b0;
					shape6_on = 1'b0;
					shape7_on = 1'b0;
					shape8_on = 1'b0;
					shape9_on = 1'b0;
					pixel_data = 24'hf;
					xcoord = 7'b0;
					ycoord = 7'b0;
				end
    end
       
    always_comb
    begin:RGB_Display
		  if (shape1_on)
		  begin
				if( (board[17] && board[15] && board[13]) || (board[17] && board[11] && board[5]) || (board[17] && board[9] && board[1]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
		  else if (shape2_on)
		  begin
				if( (board[17] && board[15] && board[13]) || (board[15] && board[9] && board[3]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
		  else if (shape3_on)
		  begin
				if( (board[17] && board[15] && board[13]) || (board[13] && board[7] && board[1]) || (board[13] && board[9] && board[5]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
		  else if (shape4_on)
		  begin
				if( (board[11] && board[9] && board[7]) ||  (board[17] && board[11] && board[5]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
		  else if (shape5_on)
		  begin
				if( (board[11] && board[9] && board[7]) || (board[15] && board[9] && board[3]) || (board[17] && board[9] && board[1])   || (board[13] && board[9] && board[5]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
		  else if (shape6_on)
		  begin
				if( (board[11] && board[9] && board[7]) ||  (board[13] && board[7] && board[1]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
		  else if (shape7_on)
		  begin
				if( (board[5] && board[3] && board[1]) ||  (board[17] && board[11] && board[5]) ||  (board[13] && board[9] && board[5]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
		  else if (shape8_on)
		  begin
				if( (board[5] && board[3] && board[1]) || (board[15] && board[9] && board[3]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
		  else if (shape9_on)
		  begin
				if( (board[5] && board[3] && board[1]) ||  (board[13] && board[7] && board[1]) || (board[17] && board[9] && board[1]) )
				begin
					Red = ~pixel_data[23:16];
					Green = ~pixel_data[15:8];
					Blue = ~pixel_data[7:0];
				end
				else
				begin
					Red = pixel_data[23:16];
					Green = pixel_data[15:8];
					Blue = pixel_data[7:0];
				end
		  end
		  
        else
        begin
				if ( (DrawX >= 140 && DrawX < 180) || (DrawX >= 300 && DrawX < 340) ||
					  (DrawY >= 140 && DrawY < 180 && DrawX < 480) || (DrawY >= 300 && DrawY < 340 && DrawX < 480) )
				begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end
				else
				begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'hff;
				end
        end      
    end
		
		
    
endmodule
