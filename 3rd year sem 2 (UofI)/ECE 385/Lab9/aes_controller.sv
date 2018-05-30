/*---------------------------------------------------------------------------
  --      aes_controller.sv                                                --
  --      Christine Chen                                                   --
  --      10/29/2013                                                       --
  --                                                                       --
  --      For use with ECE 298 Experiment 9                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/
// AES controller module

module aes_controller(
				input			 		clk,
				input					reset_n,
				input	[127:0]			msg_en,
				input	[127:0]			key,
				output  [127:0]			msg_de,
				input					io_ready,
				output					aes_ready,
				output [31:0] temptext_0, temptext_1, temptext_2, temptext_3
			    );

enum logic [1:0] {WAIT, COMPUTE, READY} state, next_state;
logic done;

AES aes0(.Plaintext(msg_en), .Cipherkey(key), .Clk(clk), .Reset(reset_n),
			.Run(io_ready), .Ciphertext(msg_de), .Ready(done),
			.temptext_0(temptext_0), .temptext_1(temptext_1), .temptext_2(temptext_2), .temptext_3(temptext_3)
			); 
			  
always_ff @ (posedge clk, negedge reset_n) begin
	if (reset_n == 1'b0)
		state <= WAIT;
	else
		state <= next_state;
end

always_comb begin
	next_state = state;
	case (state)
		WAIT: begin
			if (io_ready)
				next_state = COMPUTE;
		end
		
		COMPUTE: begin
			if (done)
				next_state = READY;
		end
		
		READY: begin
		end
	endcase
end

always_comb begin
	aes_ready = 1'b0;
	case (state)
		WAIT: begin
			aes_ready = 1'b0;
		end
		
		COMPUTE: begin
			aes_ready = 1'b0;
		end
		
		READY: begin
			aes_ready = 1'b1;
		end
	endcase
end
			  
endmodule