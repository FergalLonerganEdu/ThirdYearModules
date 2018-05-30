//-------------------------------------------------------------------------
//      1-bit register                                                   --
//      Sai Ma                                                           --
//      11-13-2014                                                       --
//                                                                       --
//      For use with ECE 385 Final Project                     			 --
//      ECE Department @ UIUC                                            --
//-------------------------------------------------------------------------
module reg_18 (input logic    Clk, Reset, Shift_In, Load, Shift_En,
               input logic [17:0] D,
               output logic    Shift_Out,
               output reg [17:0] Data_Out);

always_ff @ (posedge Clk)
begin
	if (Reset)
		Data_Out <= 18'b0;
	else if (Load)
		Data_Out <= D;
	else if (Shift_En)
		Data_Out <= {Shift_In,Data_Out[17:1]};
end

assign Shift_Out = Data_Out[0];
	
endmodule
