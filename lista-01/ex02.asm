#2. Escreva um programa que calcule o valor de 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3, respectivamente) e coloque o resultado em $t7. 
#Faça testes com alguns valores diferentes de x, y e z. Utilize apenas instruções já vistas na disciplina.

.text
addi $t1, $zero, 1 #$t1 = x = 1
addi $t2, $zero, 2 #$t2 = y = 2
addi $t3, $zero, 3 #$t3 = z = 3

addi $s0, $zero, 4 #$s0 = 4
addi $s1, $zero, 2 #$s1 = 2
addi $s2, $zero, 3 #$s2 = 3

mult $t1, $s0 #$t1*$s0
mflo $s0 #$s0 = 4x (sobrescreve)
