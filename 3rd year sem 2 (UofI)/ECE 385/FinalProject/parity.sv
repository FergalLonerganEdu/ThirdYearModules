module parity ( input [17:0] in,
				  output logic oddeven);
				  
				  
logic [3:0] sum;
assign sum = in[17]+in[16]+in[15]+in[14]+
						in[13]+in[12]+in[11]+in[10]+
						in[9]+in[8]+in[7]+in[6]+in[5]+
						in[4]+in[3]+in[2]+in[1]+in[0];
						
assign oddeven = sum[0];

endmodule

