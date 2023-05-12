transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/write-back-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/write-back-stage/WriteBack.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/decode-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/decode-stage/ControlUnit.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/memory {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/memory/InstructionMemory.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/memory {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/memory/DataMemory.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/TOP.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/decode-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/decode-stage/RegisterFile.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/decode-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/decode-stage/ExtendImmediate.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/decode-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/decode-stage/decode.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/execute-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/execute-stage/execute.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/execute-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/execute-stage/ConditionCheck.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/execute-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/execute-stage/ConditionalUnit.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/execute-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/execute-stage/ALU.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/fetch-stage {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/fetch-stage/fetch.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils/mux2to1.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils/flopr.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils/flopenrc.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils/adder.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/Tessia.sv}
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/utils/flopenr.sv}

vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/testbenches {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaP/testbenches/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
