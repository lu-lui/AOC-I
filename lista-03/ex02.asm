#2. Faça um programa que calcule o seguinte polinômio usando o método de Horner: y = 9a³ - 5a² + 7a + 15 
#Utilize endereços de memória para armazenar o valor de a e o resultado y. Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). 
#Utilize as duas primeiras posições da memória .data para armazenar, consecutivamente, a e y, iniciando o código com:
#Observe como o método de Horner é mais eficiente (faz menos operações) que calcular o polinômio de forma sequencial.

.data
a: .word 3
y: .space 4

.text
lui $t0, 0x1001      #registrador-base $t0 = 0x10010000
lw $t1,  0($t0)      #$t1 = 3

addi $s0, $zero, 7  #$s0 = 7
mult $s0, $t1       #7 * a = 7 * 3 = 21
mflo $s0            #$s0 = 21
addi $s0, $s0, 15   #$s0 = 36

mult $t1, $t1 	     # a² = 3 * 3 = 9
mflo $t2            #$t1 = 9
addi $s1, $zero, -5 #$s1 = -5
mult $s1, $t2       #5 * a² = 5 * 9 = -45
mflo $s1            #$s1 = -45
add  $s0, $s0, $s1  #$s0 = -9

mult $t2, $t1       #a² * a = 27
mflo $t2            #$t1 = 27
addi $s1, $zero, 9  #$s1 = 9
mult $s1, $t2       #9 * a³ = 9 * 27 = 243
mflo $s1            #$s1 = 243
add  $s0, $s0, $s1  #$s0 = 234

sw $s0 4($t0)       #0x10010004 = 234