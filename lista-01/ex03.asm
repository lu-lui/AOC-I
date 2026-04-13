#3. Faça um programa que calcule a seguinte equação: y = 3x² - 5x + 13
# Armazene x no registrador $t5 com a instrução addi $t5, $zero, x, substituindo x pelo valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no registrador $t5.
# Armazene o resultado y no registrador $t6.
# Faça teste com diferentes valores positivos e negativos de x. 

.text
addi $t0, $zero, 3 #$t0 = 3
addi $t1, $zero, -5 #$t1 = -5
addi $t2, $zero, 13 #$t2 = 13
addi $t5, $zero, 2 #$t5 = x = 2
mult $t5, $t5 #$t5 * $t5 = 2 * 2 = 4
mflo $t6 #t6 = 4
mult $t0, $t6 # 3 * x² = 3 * 4 = 12
mflo $t6 #$t6 = 12
mult $t1, $t5 #5 * x = 5 * 2
mflo $t7 #t7 = -10
add  $t6, $t7, $t6 #t6¨= 12 -10 = 2
add  $t6, $t6, $t2 #$t6 = 2 + 13 = 15