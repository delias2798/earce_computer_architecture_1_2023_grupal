transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaX/execute-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaX/execute-stage/ALU.sv}

vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaX/testbenches {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaX/testbenches/ALU_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
