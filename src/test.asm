section .data 
arr DW 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

section .bss


section .text
global _start


_start:
mov r13, 0
jmp CALC_PRIMERAS_SEN

begin_loop:
add r14, 5		; k
mov r9, r14		; Ax
mov r10, r14		; Ay
mov r8, 0		; count x
cmp r14, 200
jg END

loop_imgx:

cmp r8, 299 
je begin_loop
mov r15, 0

loop_imgy:

mov r13, 1
mov r11, r15
cmp r15, 299 
jne POS

inc r8
jmp loop_imgx


AUX_NEW_X:

mov r13, 0

mov rcx, 2
mov rax, r15
sub rax, r12
mul rcx
mov rcx, rax 		; Arreglo

mov rax, 0
mov ax, [arr + rcx]	; funct sin

mul r9
mov rcx, 1000
div rcx

add rax, r8
mov rbx, rax
mov r11, r8
jmp POS


AUX_NEW_Y:

mov rcx, 2
mov rax, r8
sub rax, r12
mul rcx
mov rcx, rax ; Arreglo

mov rax, 0
mov ax, [arr + rcx]	;funct sin

mul r10
mov rcx, 1000
div rcx

add rax, r15

inc r15

COND:

mov r11, rax	; aux y r11
mov rcx, 300
div rcx

mov r13, rdx	; new y r13
mov rax, rbx	; aux x rbx
div rcx		; new x rdx


cmp r11, r13
jne loop_imgy

cmp rbx, rdx
jne loop_imgy

		; Pasar color de pixel

jmp loop_imgy


POS:

cmp r11, 78
jl DIF_1

cmp r11, 156
jl DIF_2

cmp r11, 234
jl DIF_3

cmp r11, 300
jl DIF_4


DIF_1:
mov r12, 0
cmp r13, 1
je AUX_NEW_X

jmp AUX_NEW_Y

DIF_2:
mov r12, 78
cmp r13, 1
je AUX_NEW_X

jmp AUX_NEW_Y

DIF_3:
mov r12, 156
cmp r13, 1
je AUX_NEW_X

jmp AUX_NEW_Y

DIF_4:
mov r12, 234
cmp r13, 1
je AUX_NEW_X

jmp AUX_NEW_Y



CALC_PRIMERAS_SEN:
mov ax, [arr + 18]
mov r11, 19
cmp r13, 19
jg SIN_VALUES_II

SIN_I_AUX:

mov r12, r13	; base
mov r11, r12	; base ^n
inc r13


SIN_VALUES_I:
mov r9, 255	; res

mov rax, 83526	; x
mul r12
add r9, rax

mov rax, r12
mul r11
mov r12, rax
mov rax, 120
mul r12
add r9, rax

mov rax, r12
mul r11
mov r12, rax
mov rax, 118
mul r12
sub r9, rax

mov rax, r12
mul r11
mov r12, rax
mov rax, 1
mul r12
add r9, rax

mov rcx, 2
mov rax, r11
mul rcx
mov r14, rax

mov rcx, 1000
mov rax, r9
div rcx

mov [arr + r14], ax 

jmp CALC_PRIMERAS_SEN 

SIN_VALUES_II:
mov r12, 38
cmp r13, 38
jg SIN_VALUES_III

mov rcx, 2
mov rax, r11
mul rcx
mov r14, rax

mov bx, [arr + r14]

mov rcx, 2
mov rax, r13
mul rcx
mov r14, rax

mov [arr + r14], bx
inc r13
dec r11

jmp SIN_VALUES_II



SIN_VALUES_III:

cmp r13, 77
jg SIN_VALUES_IV


mov rcx, 2
mov rax, r12
mul rcx
mov r14, rax

mov bx, [arr + r14]

mov cx, bx
sub bx, cx
sub bx, cx

mov rcx, 2
mov rax, r13
mul rcx
mov r14, rax

mov [arr + r14], bx

inc r13
dec r12

jmp SIN_VALUES_III


SIN_VALUES_IV:
mov rax, 0
mov [arr + 156], rax

mov r14, 0
jmp begin_loop


END:
mov rax, 60
mov rdi, 0
syscall
