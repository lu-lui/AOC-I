#4. Faça um programa que calcule a seguinte equação: y = (9x + 7) /(2x + 8)
# Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor desejado, e sempre que precisar o valor de x, utilize o valor armazenado no registrador $t1.
# Armazene o quociente da divisão em $t2 e o resto em $t3.
# Responda o que acontece quando x = -4.

.text
addi $t1, $zero, -4 #$t1 = x = -4
addi $s0, $zero, 9 #t2 = 9
addi $s1, $zero, 2 #t4 = 2
mult $s0, $t1 # 9 * x = 9 * -4
mflo $t2 #$t2 = -36
addi $t2, $t2, 7 #$t2 = -36 + 7 = -29 
mult $s1, $t1 # 2 * -4 = -8
mflo $t3 #t3 = -8
addi $t3, $t3, 8 #t3 = 0
div $t2, $t3 #-29 / 0 = ? (uma divisão por 0 é impossível na matemática) 
mflo $t2 #t2 = quociente
mfhi $t3 #t3 = resto

#Quando x=-4 o quociente e resto são indefinidos, o resultado armazenado nos registradores é das operações anteriores
 
