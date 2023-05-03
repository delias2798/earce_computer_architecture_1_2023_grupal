transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/unidad_control.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/senal_reg_write.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/senal_reg_src.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/senal_mem_write.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/senal_mem_to_reg.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/senal_imm_src.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/senal_ALU_src.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/senal_ALU_control.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/main_deco.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/logica_cond.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/cond_check.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/ALU_deco.sv}

<<<<<<< HEAD
vlog -sv -work work +incdir+C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/testbenches {C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/testbenches/ALU_tb.sv}
=======
vlog -sv -work work +incdir+C:/Users/Usuario/Desktop/Git\ Arqui/earce_computer_architecture_1_2023_grupal {C:/Users/Usuario/Desktop/Git Arqui/earce_computer_architecture_1_2023_grupal/unidad_control_tb.sv}
>>>>>>> 6f6192a9401a9bc75798d8cac49979a8bcb50a5e

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  unidad_control_tb

add wave *
view structure
view signals
run -all
