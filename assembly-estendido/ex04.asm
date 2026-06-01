#4. Escreva um programa que inverta a ordem dos elementos de um vetor (.word) com 5 posições. Por exemplo, a entrada: 1, 2, 3, 4, 5 deve produzir 5, 4, 3, 2, 1.
#A resposta deve ser o vetor de entrada modificado, e não um novo vetor na memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
vetor: .word 1, 2, 3, 4, 5

.text
la   $t0, 0x10010000        #ponteiro1 = início
addi $t1, $t0, 16           #ponteiro2 = início + 4 posicoes *4 bytes (fim)

loop: slt $t4, $t1, $t0     #$t4 = 1 se direito < esquerdo
      bne $t4, $zero, fim   #se cruzaram, termina
      beq $t0, $t1, fim     #se iguais, termina
  
      lw $t2, 0($t0)        #$t2 = p1
      lw $t3, 0($t1)        #$t3 = p2
      
      sw $t3, 0($t0)        #p1 = p2
      sw $t2, 0($t1)        #p2 = p1

      addi $t0, $t0, 4      #p1++
      addi $t1, $t1, -4     #p2--
      j loop

fim: nop