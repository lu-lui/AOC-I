#1. Escreva um programa que leia dois halfwords (a e b) da memória e calcule a sua divisão se os dois valores forem diferentes e a sua multiplicação se os dois valores forem iguais. 
#Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da memória .data. Inicie o código com:

.data
a: .half 30
b: .half 5
y: .space 4

.text
lui $t0, 0x1001     #end base
lh  $t1, 0($t0)     #$t1 = 30
lh  $t2, 2($t0)     #$t2 = 5

beq $t1, $t2 Mult   #Se $t1 == $t2 pula para "Mult"
div $t1, $t2        #$t1 / $t2
j Fim 		     # pula para o fim

Mult: mult $t1, $t2 #$t1 * $t2
      j Fim	     # pula para o fim

Fim: mflo $t3       #$t3 = resultado
     sw $t3, 4($t0) #0x10010004 = resultado