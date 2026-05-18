#N numeros a partir do numero inicial, guardar na memória soma de todos os números, soma dos pares e quantidade de pares

.data 
inicio: .word 3 #0x1001
N:      .word 5 #3,4,5,6,7
soma_pares:   .space 4
numero_pares: .space 4 
somatŕio:     .space 4

.text
lui  $t0, 0x1001   #reg base
lw   $t1, 0($t0)   #inicio
lw   $t2, 4($t0)   #n
addi $t3, $zero, 0 #contador
addi $s3, $zero, 0 #somatorio = 0
addi $s1, $zero, 0 #somatorio_par = 0
addi $s2, $zero, 0 #numero_de_par = 0
addi $t4, $zero, 2 #constante 2

loop: beq  $t3, $t2, fim   #acaba se $t2 == $t3
      add  $s3, $s3, $t1   #soma elementos
      div  $t1, $t4        # i / 2
      mfhi $s4             #resto divisão
      addi $t3, $t3, 1     #c++
      beq  $s4, $zero, par #se o resto for par, pula
      addi $t1, $t1, 1     #avança a leitura
      j loop
      
par: addi $s2, $s2, 1   #numero_de_pares++
     add  $s1, $s1, $t1 #somatorio_par = $t1
     addi $t1, $t1, 1   ##avança a leitura
     j loop

fim: sw $s1, 8($t0)  #somatorio_par
     sw $s2, 12($t0) #numero_de_pares
     sw $s3, 16($t0) #somatorio
    
