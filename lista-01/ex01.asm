#1. Faça um programa que some os números decimais 326, -211, 311 e -684 e escreva o resultado no registrador $t0. 

.text
addi $t0, $zero, 326 #$t0 = 326
addi $t1, $zero, -211 #$t1 = -211
add $t0, $t0, $t1 #$t0 = $t0 + $t1 = 115
addi $t1, $zero, 311 #$t1 = 311
add $t0, $t0, $t1  #$t0 = $t0 + $t1 = 426
addi $t1, $zero, -684 #$t1 = -684
add $t0, $t0, $t1 #$t0 = $t0 + $t1 = -258
