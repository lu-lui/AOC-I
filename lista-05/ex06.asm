#Escreva um programa que calcule o número de bits significativos de um número inteiro positivo. 
#Inicie o programa com a instrução ori $t1, $0, x, substituindo x pelo valor desejado. 
#Armazene o resultado final no registrador $t2.


.text
ori $t1, $zero, 20 #$$t1 = 20 = 010100
ori $t2, $zero, 0  #$t2 = 0 = contador

loop: beq $t1, $zero, fim #se $t1 == 0, acaba
      srl $t1, $t1, 1     #shift direita 1 bit
      addi $t2, $t2, 1    #c++
      j loop

fim: or $s0, $zero, $zero #NOP