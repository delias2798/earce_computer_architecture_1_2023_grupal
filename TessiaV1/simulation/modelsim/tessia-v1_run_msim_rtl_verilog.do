transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/ram.v}
vlog -vlog01compat -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/rom.v}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/TOP.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/Tessia.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/RegisterFile.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/Mux2to1.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/InstructionMemory.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/flopr.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/ExtendImmediate.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/Decoder.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/Datapath.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/DataMemory.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/ControlUnit.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/ConditionCheck.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/ConditionalLogic.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/ALU.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/Adder.sv}

vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1 {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/TessiaV1/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
