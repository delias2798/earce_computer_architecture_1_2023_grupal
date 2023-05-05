transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/unidad_control.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/senal_reg_write.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/senal_reg_src.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/senal_mem_write.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/senal_mem_to_reg.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/senal_imm_src.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/senal_ALU_src.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/senal_ALU_control.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/main_deco.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/logica_cond.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/cond_check.sv}
vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/ALU_deco.sv}

vlog -sv -work work +incdir+C:/Users/DELIA/OneDrive/Documents/TEC/I\ Semestre\ 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor {C:/Users/DELIA/OneDrive/Documents/TEC/I Semestre 2023/Arqui/Proyectos/Proyecto2/earce_computer_architecture_1_2023_grupal/single-cycle-processor/unidad_control_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  unidad_control_tb

add wave *
view structure
view signals
run -all
