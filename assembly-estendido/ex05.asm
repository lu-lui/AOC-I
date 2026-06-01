#5. Declare três vetores do mesmo tamanho: Inicialize um ponteiro para cada vetor (pseudo-instrução la) e faça a soma dos elementos dos vetores 2 a 2.
# O vetor resultante deve ser armazenado depois dos elementos do segundo vetor. Exemplo: soma[i] = vetor1[i]+vetor2[i]

.data
tamanho: .word 7
vetor1: .word -30, -23, 56, -43, 72, -18, 71
vetor2: .word 45, 23, 21, -23, -82, 0, 69
soma: .word 0, 0, 0, 0, 0, 0, 0

.text
lw $t0, tamanho   #contador
la $t1, vetor1    #ponteiro vetor1
la $t2, vetor2    #ponteiro vetor2
la $t3, soma      #ponteiro soma

loop: beq  $t0, $zero, fim    #se vetor chegou ao fim, acaba
      lw  $t4, 0($t1)         #$t4 = vetor1[i]
      lw  $t5, 0($t2)         #$t5 = vetor2[i]
      add $t6, $t4, $t5       #$t6 = vetor1[i] + vetor2[i]
      sw  $t6, 0($t3)         #soma[i] = $t6

      addi $t1, $t1, 4        #p_vetor1++
      addi $t2, $t2, 4        #p_vetor2++
      addi $t3, $t3, 4        #p_soma++
      addi $t0, $t0, -1       #contador--
      j loop

fim: nop