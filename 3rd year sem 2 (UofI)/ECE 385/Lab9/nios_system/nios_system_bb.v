
module nios_system (
	clk_clk,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	temptext_0_export,
	temptext_1_export,
	temptext_2_export,
	temptext_3_export,
	to_hw_port_export,
	to_hw_sig_export,
	to_sw_port_export,
	to_sw_sig_export);	

	input		clk_clk;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input	[31:0]	temptext_0_export;
	input	[31:0]	temptext_1_export;
	input	[31:0]	temptext_2_export;
	input	[31:0]	temptext_3_export;
	output	[7:0]	to_hw_port_export;
	output	[1:0]	to_hw_sig_export;
	input	[7:0]	to_sw_port_export;
	input	[1:0]	to_sw_sig_export;
endmodule
