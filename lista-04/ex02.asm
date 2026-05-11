#2. Escreva um programa que calcule: 1 + 2 + 3 + … + 333. Escreva o resultado (y) em uma palavra (4 bytes) de memória. 
#O resultado deve ser armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. Inicie o código com:

.data
y: .space 4

.text
lui $t0, 0x1001 #end base

addi $t1, $zero, 1 #$t1 = 1
addi $t2, $zero, 2 #$t2 = 2
addi $t3, $zero, 334 #$t1 = 334

loop: add $t1, $t1, $t2
      addi $t2, $t2, 1  
      bne $t2, $t3, loop

sw $t1, 0($t0)

#1 + 2 = 3 + 3 = 6 + 4 = 10 + 5 = 15 + 6 = 21 ... = 55611