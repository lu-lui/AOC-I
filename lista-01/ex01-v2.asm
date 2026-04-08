#1. Faça um programa que some os números decimais 326, -211, 311 e -684 e escreva o resultado no registrador $t0. 
#versão 2 - colocando cada valor em um registrador diferente

.text
addi $t0, $zero, 326 #$t0 = 1
addi $t1, $zero, -211 #$t1 = 2
addi $t2, $zero, 311 #$t2 = 3
addi $t3, $zero, -684 #$t3 = 4

add $t4, $t0, $t1  #$t0 = $t0 + $t1 = 6 (poderia ter um jump p/ linha 6?)
add $t5, $t2, $t3
add $t0, $t4, $t5