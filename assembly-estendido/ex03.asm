#3. Escreva um programa que leia um vetor de 10 posições (.word) da memória (começando na posição 0x10010000) e verifique se o vetor está ou não ordenado.
#Use o registrador $t0 como flag. Faça $t0 = 1 se o vetor estiver ordenado e $t0 = 0 caso contrário.

.data
vetor: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

.text
li $t0, 1        #flag == 1
la $t2, vetor    #$t2 = &vetor (primeira posicao)
li $t3, 9        #9 pares a comparar

loop: beq $t3, $zero, fim
      lw  $t4, 0($t2)           #$t4 = atual
      lw  $t5, 4($t2)           #$t5 = prox
      slt $s0, $t5, $t4         #$s0 = 1 se próximo < atual
      beq $s0, $zero, ordenado  #ordenado == continua lendo
      li  $t0, 0                #desordenado == acaba
      j fim
      
ordenado: addi $t2, $t2, 4      #ponteiro++
          addi $t3, $t3, -1     #cont-- 
          j loop

fim: nop