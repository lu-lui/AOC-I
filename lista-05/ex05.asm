#Escreva um programa que receba dois números em complemento de dois (armazenados em $s0 e $s1). 
#Procure em um vetor (com início endereçado em $s3 e tamanho armazenado em $s4) quantos números 
#existem com valores dentro do intervalo fechado definido por $s0 e $s1. Assuma que $s0 ≤ $s1.
#Utilize os registradores $s3 e $s4 apenas para armazenar o início e o tamanho do vetor.

.data
vetor_x: .word -20, -15, -12, -8, -3, 1, 0, 5

.text
addi $s0, $zero, -14 #inicio intervalo
addi $s1, $zero, -1 #fim intervalo
addi $s4, $zero, 8 #tamanho vetor
lui $s3, 0x1001 #reg base

add $t0, $zero, $zero #i = 0
add $t1, $zero, $zero #contador = 0
add $t2, $zero, $s3#ponteiro

loop: beq $t0, $s4, fim
      lw $t3, 0($t2) #carrega valor
      slt $t4, $t3, $s0 #numero < $s0
      bne $t4, $zero, fora #se 1, fora do intervalo 
      slt $t4, $s1, $t3 #se 0, dentro do intervalo
      bne $t4, $zero, fora
      j dentro
      
fora: addi $t0, $t0, 1 #i++
      addi $t2, $t2, 4 #avança o vetor
      j loop
    
dentro: addi $t1, $t1, 1 #contador++
        addi $t0, $t0, 1 #i++
        addi $t2, $t2, 4 #avança o vetor
        j loop      
          
fim: