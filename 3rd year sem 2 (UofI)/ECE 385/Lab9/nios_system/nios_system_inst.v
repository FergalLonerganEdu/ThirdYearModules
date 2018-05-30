	nios_system u0 (
		.clk_clk           (<connected-to-clk_clk>),           //        clk.clk
		.reset_reset_n     (<connected-to-reset_reset_n>),     //      reset.reset_n
		.sdram_clk_clk     (<connected-to-sdram_clk_clk>),     //  sdram_clk.clk
		.sdram_wire_addr   (<connected-to-sdram_wire_addr>),   // sdram_wire.addr
		.sdram_wire_ba     (<connected-to-sdram_wire_ba>),     //           .ba
		.sdram_wire_cas_n  (<connected-to-sdram_wire_cas_n>),  //           .cas_n
		.sdram_wire_cke    (<connected-to-sdram_wire_cke>),    //           .cke
		.sdram_wire_cs_n   (<connected-to-sdram_wire_cs_n>),   //           .cs_n
		.sdram_wire_dq     (<connected-to-sdram_wire_dq>),     //           .dq
		.sdram_wire_dqm    (<connected-to-sdram_wire_dqm>),    //           .dqm
		.sdram_wire_ras_n  (<connected-to-sdram_wire_ras_n>),  //           .ras_n
		.sdram_wire_we_n   (<connected-to-sdram_wire_we_n>),   //           .we_n
		.temptext_0_export (<connected-to-temptext_0_export>), // temptext_0.export
		.temptext_1_export (<connected-to-temptext_1_export>), // temptext_1.export
		.temptext_2_export (<connected-to-temptext_2_export>), // temptext_2.export
		.temptext_3_export (<connected-to-temptext_3_export>), // temptext_3.export
		.to_hw_port_export (<connected-to-to_hw_port_export>), // to_hw_port.export
		.to_hw_sig_export  (<connected-to-to_hw_sig_export>),  //  to_hw_sig.export
		.to_sw_port_export (<connected-to-to_sw_port_export>), // to_sw_port.export
		.to_sw_sig_export  (<connected-to-to_sw_sig_export>)   //  to_sw_sig.export
	);

