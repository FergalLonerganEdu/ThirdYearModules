/*---------------------------------------------------------------------------
  --      AES.sv                                                           --
  --      Joe Meng                                                         --
  --      Fall 2013                                                        --
  --                                                                       --
  --      For use with ECE 298 Experiment 9                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/

// AES module interface with all ports, commented for Week 1
 module  AES ( input  [127:0]  Plaintext,
                               Cipherkey,
               input           Clk, 
                               Reset,
										 Run,
              output [127:0]  Ciphertext,
               output          Ready ,	
				output [31:0] temptext_0, temptext_1, temptext_2, temptext_3
				);

// Partial interface for Week 1
// Splitting the signals into 32-bit ones for compatibility with ModelSim
//	module  AES ( input clk,
//			  input  [0:31]  Cipherkey_0, Cipherkey_1, Cipherkey_2, Cipherkey_3,
//            output [0:31]  keyschedule_out_0, keyschedule_out_1, keyschedule_out_2, keyschedule_out_3 );					 
					 
	logic [0:1407] keyschedule;
	logic [127:0] TEMPTEXT;
	logic [127:0] shiftin, shiftout, subout;
	logic [7:0] subout1, subout2, subout3, subout4,
					subout5, subout6, subout7, subout8,
					subout9, subout10, subout11, subout12, 
					subout13, subout14, subout15, subout16;
	logic [127:0] roundkeyin1, roundkeyin2, roundkeyin3, roundkeyin4, roundkeyin5, roundkeyin6,
					  roundkeyin7, roundkeyin8, roundkeyin9, roundkeyin10, roundkeyin11, 
					  roundkeyout1, roundkeyout2, roundkeyout3, roundkeyout4, roundkeyout5,
					  roundkeyout6, roundkeyout7, roundkeyout8, roundkeyout9, roundkeyout10, roundkeyout11;
	logic [31:0] invmixin, invmixout;
	KeyExpansion keyexpansion_0(.clk(Clk), .Cipherkey(Cipherkey), .KeySchedule(keyschedule));
	
	InvAddRoundKey IARK1(.in(Plaintext), .keyword(keyschedule[1280:1407]), .out(roundkeyout1));
	InvAddRoundKey IARK2(.in(subout), .keyword(keyschedule[1152:1279]), .out(roundkeyout2));
	InvAddRoundKey IARK3(.in(subout), .keyword(keyschedule[1024:1151]), .out(roundkeyout3));
	InvAddRoundKey IARK4(.in(subout), .keyword(keyschedule[896:1023]), .out(roundkeyout4));
	InvAddRoundKey IARK5(.in(subout), .keyword(keyschedule[768:895]), .out(roundkeyout5));
	InvAddRoundKey IARK6(.in(subout), .keyword(keyschedule[640:767]), .out(roundkeyout6));
	InvAddRoundKey IARK7(.in(subout), .keyword(keyschedule[512:639]), .out(roundkeyout7));
	InvAddRoundKey IARK8(.in(subout), .keyword(keyschedule[384:511]), .out(roundkeyout8));
	InvAddRoundKey IARK9(.in(subout), .keyword(keyschedule[256:383]), .out(roundkeyout9));
	InvAddRoundKey IARK10(.in(subout), .keyword(keyschedule[128:255]), .out(roundkeyout10));
	InvAddRoundKey IARK11(.in(subout), .keyword(keyschedule[0:127]), .out(roundkeyout11));
	
	InvShiftRows invshiftrows(.in(shiftin), .out(shiftout));
	
	InvSubBytes ISB1(.clk(Clk), .in(shiftout[127:120]) , .out(subout1));
	InvSubBytes ISB2(.clk(Clk), .in(shiftout[119:112]) , .out(subout2));
	InvSubBytes ISB3(.clk(Clk), .in(shiftout[111:104]) , .out(subout3));
	InvSubBytes ISB4(.clk(Clk), .in(shiftout[103:96]) , .out(subout4));
	InvSubBytes ISB5(.clk(Clk), .in(shiftout[95:88]) , .out(subout5));
	InvSubBytes ISB6(.clk(Clk), .in(shiftout[87:80]) , .out(subout6));
	InvSubBytes ISB7(.clk(Clk), .in(shiftout[79:72]) , .out(subout7));
	InvSubBytes ISB8(.clk(Clk), .in(shiftout[71:64]) , .out(subout8));
	InvSubBytes ISB9(.clk(Clk), .in(shiftout[63:56]) , .out(subout9));
	InvSubBytes ISB10(.clk(Clk), .in(shiftout[55:48]) , .out(subout10));
	InvSubBytes ISB11(.clk(Clk), .in(shiftout[47:40]) , .out(subout11));
	InvSubBytes ISB12(.clk(Clk), .in(shiftout[39:32]) , .out(subout12));
	InvSubBytes ISB13(.clk(Clk), .in(shiftout[31:24]) , .out(subout13));
	InvSubBytes ISB14(.clk(Clk), .in(shiftout[23:16]) , .out(subout14));
	InvSubBytes ISB15(.clk(Clk), .in(shiftout[15:8]) , .out(subout15));
	InvSubBytes ISB16(.clk(Clk), .in(shiftout[7:0]) , .out(subout16));
	
	
	assign subout = {subout1, subout2, subout3, subout4,
						  subout5, subout6, subout7, subout8,
						  subout9, subout10, subout11, subout12,
						  subout13, subout14, subout15, subout16}; 

	
	InvMixColumns IMC(.in(invmixin) , .out(invmixout));
	
	enum logic [6:0] {Round0, Round1_shift, Round1_sub, Round1_add, Round1_mix_1, Round1_mix_2, Round1_mix_3, Round1_mix_4,
									  Round2_shift_1, Round2_shift_2, Round2_shift_3, Round2_shift_4, Round2_sub, Round2_add,
																				Round2_mix_1, Round2_mix_2, Round2_mix_3, Round2_mix_4,
									  Round3_shift_1, Round3_shift_2, Round3_shift_3, Round3_shift_4, Round3_sub, Round3_add,
																				Round3_mix_1, Round3_mix_2, Round3_mix_3, Round3_mix_4,
									  Round4_shift_1, Round4_shift_2, Round4_shift_3, Round4_shift_4, Round4_sub, Round4_add,
																				Round4_mix_1, Round4_mix_2, Round4_mix_3, Round4_mix_4,
									  Round5_shift_1, Round5_shift_2, Round5_shift_3, Round5_shift_4, Round5_sub, Round5_add,
																				Round5_mix_1, Round5_mix_2, Round5_mix_3, Round5_mix_4,
									  Round6_shift_1, Round6_shift_2, Round6_shift_3, Round6_shift_4, Round6_sub, Round6_add,
																				Round6_mix_1, Round6_mix_2, Round6_mix_3, Round6_mix_4,
									  Round7_shift_1, Round7_shift_2, Round7_shift_3, Round7_shift_4, Round7_sub, Round7_add,
																				Round7_mix_1, Round7_mix_2, Round7_mix_3, Round7_mix_4,
									  Round8_shift_1, Round8_shift_2, Round8_shift_3, Round8_shift_4, Round8_sub, Round8_add,
																				Round8_mix_1, Round8_mix_2, Round8_mix_3, Round8_mix_4,
									  Round9_shift_1, Round9_shift_2, Round9_shift_3, Round9_shift_4, Round9_sub, Round9_add,
																				Round9_mix_1, Round9_mix_2, Round9_mix_3, Round9_mix_4,
									  Round10_shift_1, Round10_shift_2, Round10_shift_3, Round10_shift_4, Round10_sub, Round10_add, DONE, WAIT}
									  state, next_state;
	
	always @ (posedge Clk) begin
		if (Reset == 1'b0) begin
			state <= WAIT;
		end
		else begin
			state <= next_state;
		end
	end
	
	always_comb begin
			next_state = state;
			unique case (state)
				WAIT: begin
					if (Run)
						next_state = Round0;
				end
				Round0: begin
					next_state = Round1_shift;
				end
				Round1_shift: begin
					next_state = Round1_sub;
				end
				Round1_sub: begin
					next_state = Round1_add;
				end
				Round1_add: begin
					next_state = Round1_mix_1;
				end
				Round1_mix_1: begin
					next_state = Round2_shift_1;
				end
				Round2_shift_1: begin
					next_state = Round1_mix_2;
				end
				Round1_mix_2: begin
					next_state = Round2_shift_2;
				end
				Round2_shift_2: begin
					next_state = Round1_mix_3;
				end
				Round1_mix_3: begin
					next_state = Round2_shift_3;
				end
				Round2_shift_3: begin
					next_state = Round1_mix_4;
				end
				Round1_mix_4: begin
					next_state = Round2_shift_4;
				end
				Round2_shift_4: begin
					next_state = Round2_sub;
				end
				Round2_sub: begin
					next_state = Round2_add;
				end
				Round2_add: begin
					next_state = Round2_mix_1;
				end
				Round2_mix_1: begin
					next_state = Round3_shift_1;
				end
				Round3_shift_1: begin
					next_state = Round2_mix_2;
				end
				Round2_mix_2: begin
					next_state = Round3_shift_2;
				end
				Round3_shift_2: begin
					next_state = Round2_mix_3;
				end
				Round2_mix_3: begin
					next_state = Round3_shift_3;
				end
				Round3_shift_3: begin
					next_state = Round2_mix_4;
				end
				Round2_mix_4: begin
					next_state = Round3_shift_4;
				end
				Round3_shift_4: begin
					next_state = Round3_sub;
				end
				Round3_sub: begin
					next_state = Round3_add;
				end
				Round3_add: begin
					next_state = Round3_mix_1;
				end
				Round3_mix_1: begin
					next_state = Round4_shift_1;
				end
				Round4_shift_1: begin
					next_state = Round3_mix_2;
				end
				Round3_mix_2: begin
					next_state = Round4_shift_2;
				end
				Round4_shift_2: begin
					next_state = Round3_mix_3;
				end
				Round3_mix_3: begin
					next_state = Round4_shift_3;
				end
				Round4_shift_3: begin
					next_state = Round3_mix_4;
				end
				Round3_mix_4: begin
					next_state = Round4_shift_4;
				end
				Round4_shift_4: begin
					next_state = Round4_sub;
				end
				Round4_sub: begin
					next_state = Round4_add;
				end
				Round4_add: begin
					next_state = Round4_mix_1;
				end
				Round4_mix_1: begin
					next_state = Round5_shift_1;
				end
				Round5_shift_1: begin
					next_state = Round4_mix_2;
				end
				Round4_mix_2: begin
					next_state = Round5_shift_2;
				end
				Round5_shift_2: begin
					next_state = Round4_mix_3;
				end
				Round4_mix_3: begin
					next_state = Round5_shift_3;
				end
				Round5_shift_3: begin
					next_state = Round4_mix_4;
				end
				Round4_mix_4: begin
					next_state = Round5_shift_4;
				end
				Round5_shift_4: begin
					next_state = Round5_sub;
				end
				Round5_sub: begin
					next_state = Round5_add;
				end
				Round5_add: begin
					next_state = Round5_mix_1;
				end
				Round5_mix_1: begin
					next_state = Round6_shift_1;
				end
				Round6_shift_1: begin
					next_state = Round5_mix_2;
				end
				Round5_mix_2: begin
					next_state = Round6_shift_2;
				end
				Round6_shift_2: begin
					next_state = Round5_mix_3;
				end
				Round5_mix_3: begin
					next_state = Round6_shift_3;
				end
				Round6_shift_3: begin
					next_state = Round5_mix_4;
				end
				Round5_mix_4: begin
					next_state = Round6_shift_4;
				end
				Round6_shift_4: begin
					next_state = Round6_sub;
				end
				Round6_sub: begin
					next_state = Round6_add;
				end
				Round6_add: begin
					next_state = Round6_mix_1;
				end
				Round6_mix_1: begin
					next_state = Round7_shift_1;
				end
				Round7_shift_1: begin
					next_state = Round6_mix_2;
				end
				Round6_mix_2: begin
					next_state = Round7_shift_2;
				end
				Round7_shift_2: begin
					next_state = Round6_mix_3;
				end
				Round6_mix_3: begin
					next_state = Round7_shift_3;
				end
				Round7_shift_3: begin
					next_state = Round6_mix_4;
				end
				Round6_mix_4: begin
					next_state = Round7_shift_4;
				end
				Round7_shift_4: begin
					next_state = Round7_sub;
				end
				Round7_sub: begin
					next_state = Round7_add;
				end
				Round7_add: begin
					next_state = Round7_mix_1;
				end
				Round7_mix_1: begin
					next_state = Round8_shift_1;
				end
				Round8_shift_1: begin
					next_state = Round7_mix_2;
				end
				Round7_mix_2: begin
					next_state = Round8_shift_2;
				end
				Round8_shift_2: begin
					next_state = Round7_mix_3;
				end
				Round7_mix_3: begin
					next_state = Round8_shift_3;
				end
				Round8_shift_3: begin
					next_state = Round7_mix_4;
				end
				Round7_mix_4: begin
					next_state = Round8_shift_4;
				end
				Round8_shift_4: begin
					next_state = Round8_sub;
				end
				Round8_sub: begin
					next_state = Round8_add;
				end
				Round8_add: begin
					next_state = Round8_mix_1;
				end
				Round8_mix_1: begin
					next_state = Round9_shift_1;
				end
				Round9_shift_1: begin
					next_state = Round8_mix_2;
				end
				Round8_mix_2: begin
					next_state = Round9_shift_2;
				end
				Round9_shift_2: begin
					next_state = Round8_mix_3;
				end
				Round8_mix_3: begin
					next_state = Round9_shift_3;
				end
				Round9_shift_3: begin
					next_state = Round8_mix_4;
				end
				Round8_mix_4: begin
					next_state = Round9_shift_4;
				end
				Round9_shift_4: begin
					next_state = Round9_sub;
				end
				Round9_sub: begin
					next_state = Round9_add;
				end
				Round9_add: begin
					next_state = Round9_mix_1;
				end
				Round9_mix_1: begin
					next_state = Round10_shift_1;
				end
				Round10_shift_1: begin
					next_state = Round9_mix_2;
				end
				Round9_mix_2: begin
					next_state = Round10_shift_2;
				end
				Round10_shift_2: begin
					next_state = Round9_mix_3;
				end
				Round9_mix_3: begin
					next_state = Round10_shift_3;
				end
				Round10_shift_3: begin
					next_state = Round9_mix_4;
				end
				Round9_mix_4: begin
					next_state = Round10_shift_4;
				end
				Round10_shift_4: begin
					next_state = Round10_sub;
				end
				Round10_sub: begin
					next_state = Round10_add;
				end
				Round10_add: begin
					next_state = DONE;
				end
				DONE: begin
					next_state = WAIT;
				end
			endcase
	end
	always @ (negedge Clk) begin
			unique case (state)
				WAIT: begin
					Ready = 1'b0;
				end
				Round0: begin
					TEMPTEXT = roundkeyout1;
					temptext_0=TEMPTEXT[127:96];
					temptext_1=TEMPTEXT[95:64];
					temptext_2=TEMPTEXT[63:32];
					temptext_3=TEMPTEXT[31:0];
				end
				Round1_shift: begin
					shiftin = TEMPTEXT;
				end
				Round1_sub: begin
					
				end
				Round1_add: begin
					TEMPTEXT = roundkeyout2;
				end
				
				Round1_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round2_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round1_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round2_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round1_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round2_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round1_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round2_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				
				
				
				Round2_sub: begin
					
				end
				Round2_add: begin
					TEMPTEXT = roundkeyout3;
				end
				Round2_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round3_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round2_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round3_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round2_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round3_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round2_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round3_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				Round3_sub: begin
					
				end
				Round3_add: begin
					TEMPTEXT = roundkeyout4;
				end
				Round3_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round4_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round3_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round4_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round3_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round4_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round3_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round4_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				Round4_sub: begin
				
				end
				Round4_add: begin
					TEMPTEXT = roundkeyout5;
				end
				Round4_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round5_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round4_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round5_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round4_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round5_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round4_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round5_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				Round5_sub: begin
					
				end
				Round5_add: begin
					TEMPTEXT = roundkeyout6;
				end
				Round5_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round6_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round5_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round6_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round5_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round6_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round5_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round6_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				Round6_sub: begin
					
				end
				Round6_add: begin
					TEMPTEXT = roundkeyout7;
				end
				Round6_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round7_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round6_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round7_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round6_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round7_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round6_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round7_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				Round7_sub: begin
					
				end
				Round7_add: begin
					TEMPTEXT = roundkeyout8;
				end
				Round7_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round8_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round7_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round8_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round7_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round8_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round7_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round8_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				Round8_sub: begin
					
				end
				Round8_add: begin
					TEMPTEXT = roundkeyout9;
				end
				Round8_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round9_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round8_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round9_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round8_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round9_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round8_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round9_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				Round9_sub: begin
				
				end
				Round9_add: begin
					TEMPTEXT = roundkeyout10;
				end
				Round9_mix_1: begin
					invmixin = TEMPTEXT[127:96];
				end
				Round10_shift_1: begin
					shiftin[127:96] = invmixout;
				end
				Round9_mix_2: begin
					invmixin = TEMPTEXT[95:64];
				end
				Round10_shift_2: begin
					shiftin[95:64] = invmixout;
				end
				Round9_mix_3: begin
					invmixin = TEMPTEXT[63:32];
				end
				Round10_shift_3: begin
					shiftin[63:32] = invmixout;
				end
				Round9_mix_4: begin
					invmixin = TEMPTEXT[31:0];
				end
				Round10_shift_4: begin
					shiftin[31:0] = invmixout;
				end
				Round10_sub: begin
					
				end
				Round10_add: begin
					TEMPTEXT = roundkeyout11;
				end
				DONE: begin
					Ciphertext = TEMPTEXT;
					Ready = 1'b1;
				end
			endcase
	end
					 				 
endmodule

module InvAddRoundKey(input [127:0] in, keyword, output [127:0] out);
	assign out = in ^ keyword;
	/*out[119:112] = in[119:112] ^ keyword[119:112];
	out[111:104] = in[111:104] ^ keyword[111:104];
	out[103:96] = in[103:96] ^ keyword[103:96];
	out[95:88] = in[95:88] ^ keyword[95:88];
	out[87:80] = in[87:80] ^ keyword[87:80];
	out[79:72] = in[79:72] ^ keyword[79:72];
	out[71:64] = in[71:64] ^ keyword[71:64];
	out[63:56] = in[63:56] ^ keyword[63:56];
	out[55:48] = in[55:48] ^ keyword[55:48];
	out[47:40] = in[47:40] ^ keyword[47:40];
	out[39:32] = in[39:32] ^ keyword[39:32];
	out[31:24] = in[31:24] ^ keyword[31:24];
	out[23:16] = in[23:16] ^ keyword[23:16];
	out[15:8] = in[15:8] ^ keyword[15:8];
	out[7:0] = in[7:0] ^ keyword[7:0];*/
endmodule

module InvShiftRows(input [127:0] in, output [127:0] out);
	assign out[127:120] = in[127:120];
	assign out[119:112] = in[23:16];
	assign out[111:104] = in[47:40];
	assign out[103:96] = in[71:64];
	assign out[95:88] = in[95:88];
	assign out[87:80] = in[119:112];
	assign out[79:72] = in[15:8];
	assign out[71:64] = in[39:32];
	assign out[63:56] = in[63:56];
	assign out[55:48] = in[87:80];
	assign out[47:40] = in[111:104];
	assign out[39:32] = in[7:0];
	assign out[31:24] = in[31:24];
	assign out[23:16] = in[55:48];
	assign out[15:8] = in[79:72];
	assign out[7:0] = in[103:96];
endmodule