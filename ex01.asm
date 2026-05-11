#1. Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores forem iguais. 
#Escreva o resultado (y) em uma palavra (4 bytes) de memória. 
#O resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da memória .data. Inicie o código com:

.data
a: .half 30 #0x10010000
b: .half 5  #0x10010002
y: .space 4 #0x10010004

.text
lui $s0, 0x1001 #0x10010000 (registrador base)
lhu $t0, 0($s0)  #$t1 = 30
lhu $t1, 2($s0)  #$t2 = 5

	beq $t0, $t1, iguais
	div $t0, $t1
	mflo $t3      #$t3 = $t0 / $t1
	j fim
iguais: mult $t0, $t1 
	mflo $t3      #$t3 = $t0 * $t1

fim: 	sw $t3, 4($s0) #MEM[0x10010004] = $t3