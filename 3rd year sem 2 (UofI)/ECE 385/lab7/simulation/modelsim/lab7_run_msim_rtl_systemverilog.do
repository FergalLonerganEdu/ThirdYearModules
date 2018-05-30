transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib lab7_soc
vmap lab7_soc lab7_soc
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis {D:/lab7/lab7_soc/synthesis/lab7_soc.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_avalon_st_adapter_005.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_sysid_qsys_0.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_sdram_pll.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_sdram.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_onchip_memory2_0.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_nios2_gen2_0.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_nios2_gen2_0_cpu.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_nios2_gen2_0_cpu_debug_slave_sysclk.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_nios2_gen2_0_cpu_debug_slave_tck.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_nios2_gen2_0_cpu_debug_slave_wrapper.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_nios2_gen2_0_cpu_test_bench.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_led.v}
vlog -sv -work work +incdir+D:/lab7 {D:/lab7/lab7.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_irq_mapper.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_avalon_st_adapter_005_error_adapter_0.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_avalon_st_handshake_clock_crosser.v}
vlog -vlog01compat -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_avalon_st_clock_crosser.v}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_width_adapter.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_rsp_mux_001.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_rsp_demux_004.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_cmd_mux_004.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_burst_adapter.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_burst_adapter_uncmpr.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_router_007.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_router_006.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_router_002.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_router_001.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/lab7_soc_mm_interconnect_0_router.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work lab7_soc +incdir+D:/lab7/lab7_soc/synthesis/submodules {D:/lab7/lab7_soc/synthesis/submodules/altera_merlin_master_translator.sv}

