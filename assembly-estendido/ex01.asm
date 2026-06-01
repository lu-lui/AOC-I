#1. Escreva um programa que remova os espaços de uma string. Por exemplo, a entrada “Gosto muito do meu professor de AOC-I."
#deve produzir a string "GostomuitodomeuprofessordeAOC-I.“ Use apenas uma string (não use uma string de saída ou uma string 
#auxiliar no seu programa). Não esqueça de terminar sua string com nulo (ver tabela ASCII para código do espaço e do \0 (null)).
#A resposta deve ser a string de entrada modificada, e não uma nova string na memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
string: .asciiz "Gosto muito do meu professor de AOC-I."

.text
la $t0, string
la $t1, string
li $t2, 32 #codigo ASCII do espaço (" ")

loop: lbu $t3, 0($t1)      #carrega o char
      beq $t3, $zero, fim  #se = 0, acaba
      beq $t3, $t2, espaco #se o caractere atual é um espaço, pula 
      
      sb $t3, 0($t0)       #copia o char p $t0
      addi $t0, $t0, 1     #ponteiro++
      
espaco: addi $t1, $t1, 1  #ponteiro2++
	j loop
      
fim: sb $zero, 0($t0)