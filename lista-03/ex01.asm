#1. Faça um programa que calcule a seguinte equação: y = 32ab - 3a + 7b - 13 Utilize endereços de memória para armazenar o valore de a, b e o resultado y. 
#Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). Utilize as três primeiras posições da memória .data para armazenar, consecutivamente, a, b e y, iniciando o código com:

.data
a: .word 3   #0x10010000
b: .word 5   #0x10010004
y: .space 4  #espaço reservado p/ 4 bytes

.text
lui $t0, 0x1001      #registrador-base $t0 = 0x10010000
lw $t1,  0($t0)      #$t1 = 3
lw $t2,  4($t0)      #$t2 = 5

addi $s0, $zero, 32  #$s0 = 32
mult $s0, $t1        #32 * a = 32 * 3 = 96
mflo $s0             #$s0 = 96
mult $s0, $t2        #96 * b = 96 * 5 = 480
mflo $s0             #$s0 = 480

addi $s1, $zero, -3  #$s1 = -3
mult $s1, $t1        #-3 * a = -3 * 3 = -9
mflo $s1             #$s0 = -9

add  $s0, $s0, $s1   #$s0 = 471
addi $s1, $zero, 7   #$s1 = 7
mult $s1, $t2        #7 * b = 7 * 5 = 35
mflo $s1             #$s1 = 35

add  $s0, $s0, $s1   #$s0 = 506
addi $s0, $s0, -13   #$s0 = 493

sw   $s0, 8($t0)     #0x10010008 (endereço na memória)