#Faça um programa que leia a palavra DECADA20 da memória e armazenene em $t7

.data
.word 0xD
.word 0xE
.word 0xC
.word 0xA
.word 0xD
.word 0xA
.word 0x2
.word 0x0

.text
lui  $t0, 0x1001     #reg base
addi $s0, $zero, 8   #limite
addi $s1, $zero, 1   #contador


loop: lw   $t6 0($t0)     #$t6 = 0x10010000
      or   $t7, $t7, $t6  #$t7 = $t6
      sll  $t7, $t7, 4    #desloca 1 bit esq
      addi $t0, $t0, 4    #aponta p prox valor
      addi $s1, $s1, 1    #c++
      beq  $s0, $s1, fim  #acaba se $s0 == $s1
      j loop
      
fim: