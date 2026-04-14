#5. Faça um programa que calcule a área do triângulo equilátero de base 160 e altura 120 e escreva o resultado em $t3.
#Armazene b em $t1 e h em $t2 utilizando as instruções addi $t1, $zero, b e addi $t2, $zero, h, substituindo b e h 
#pelos valores desejados, e sempre que precisar de b e h, utilize os valores armazenados nos registradores $t1 e $t2. 

.text
addi $t1, $zero, 160 #$t1 = 160
addi $t2, $zero, 120 #$t2 = 120
mult $t1, $t2 #160 * 120 = 19200
mflo $t3 #t3 = 19200
addi $t4, $zero, 2 #t4 = 2
div $t3, $t4 #19200 - 2 = 9600
mflo $t3 #$t3 = 9600