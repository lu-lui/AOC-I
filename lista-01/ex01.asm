#1. Faça um programa que some os números decimais 326, -211, 311 e -684 e escreva o resultado no registrador $t0. 

.text
addi $t0, $zero, 326 #$t0 = 1
addi $t1, $zero, -211 #$t1 = 2
add $t0, $t0, $t1 #$t0 = $t0 + $t1 = 3
addi $t1, $zero, 311 #$t1 = 3
add $t0, $t0, $t1  #$t0 = $t0 + $t1 = 6 
addi $t1, $zero, -684 
add $t0, $t0, $t1