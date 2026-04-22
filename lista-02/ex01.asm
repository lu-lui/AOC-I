#1. Faça um programa que escreva o valor 0xDECADA70 no registrador $t7, incluindo um dígito hexadecimal por vez (isto é, insira letra por letra, individualmente) no registrador.

.text
addi $t7, $zero, 0xD #$t7 = d
sll $t7, $t7, 4 #$t7 = d0
addi $t7, $t7, 0xE #$t7 = de
sll $t7, $t7, 4 #$t7 = de0
addi $t7, $t7, 0xC #$t7 = dec
sll $t7, $t7, 4 #$t7 = dec0
addi $t7, $t7, 0xA #$t7 = deca
sll $t7, $t7, 4 #$t7 = deca0
addi $t7, $t7, 0xD #$t7 = decad
sll $t7, $t7, 4 #$t7 = decad0
addi $t7, $t7, 0xA #$t7 = decada
sll $t7, $t7, 4 #$t7 = decada0
addi $t7, $t7, 7 #$t7 = decada7
sll $t7, $t7, 4 #$t7 = decada70