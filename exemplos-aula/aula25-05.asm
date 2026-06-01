.data 
tamanho: .word  12
vetor: .word  4, -2, 33, 52, 1, 17, 11, 7, 90, -7, 8, -13

.text

#inicialização
lw $t0, tamanho     #$t0 = tamanho = 12
la $t1, vetor       #$t1 = &vetor
li $t3, 0	    #$t3 = contador = 0
li $s0, 0	    #$s0 = positivos = 0
li $s1, 0	    #$s1 = negativos = 0
li $s2, 0	    #$s2 = soma = 0

#laço de execução
loop: slt  $k0, $t3, $t0 	 #Se cont < tamanho, então $k0 = 1, senão $k0 = 0
      beq  $k0, $zero, fim       #se $k0 = 0 = j fim
      lw   $t4, 0($t1)	         #$t4 = vetor[cont]
      add  $s2, $s2, $t4         # soma += vetor[cont]
      slti $k0, $t4, 0           #Se vetor[cont] < 0 então $k0 = 1
      beq  $k0, $zero, positivo  #Se vetor[cont] > 0 então $k0 = 0
      
      #negativos
      add $s1, $s1, $t4 #negativo += vetor[cont]
      j pula
      
positivo: add  $s0, $s0, $t4 #positivo += vetor[cont]
pula:	  addi $t3, $t3, 1   #cont++
	  addi $t1, $t1, 4   #&vetor++ (como é .word, incrementa 4 bytes)
	  j loop
	  
fim: nop