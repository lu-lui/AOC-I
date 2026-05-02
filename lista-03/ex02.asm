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

addi $s0, $zero, 9  #$s0 = 9
mult $s0, $t1       #9 * 3 = 27
mflo $s0            #$s0 = 27

addi $s1, $zero, 5   #$s1 = 5
sub $s0, $s0, $s1 #27 - 5 = 22
mult $s0, $t1       #22 * 3 = 66
mflo $s0            #$s0 = 66

addi $s1, $zero, 7   #$s1 = 7
add $s0, $s0, $s1 #66 + 7 = 73
mult $s0, $t1       #73 * 3 = 219
mflo $s0            #$s0 = 219

addi $s1, $zero, 15   #$s1 = 15
add $s0, $s0, $s1 #219 + 15 = 234

sw $s0 4($t0)       #0x10010004 = 234