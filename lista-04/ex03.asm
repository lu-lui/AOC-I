# 3. Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e calcule o x-ésimo termo da série de Fibonacci:
#1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ... Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. 
# O resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da memória .data. Inicie o código com:

.data
x: .word 7
y: .space 4

.text
lui $t0 0x1001 #end base
lw $s0 0($t0) #$t1 = 7
addi $t2, $zero, 1 #$t1 = 1
addi $t3, $zero, 1 #$t1 = 1
addi $s1, $zero, 2 #$s1 = 2 (contador de termos)

Fibo: add  $t4, $t2, $t3    #$t4 = $t2 + $t3 = 1 + 1 = 2 --> 3 + 5 = 8 
      addi $s1, $s1, 1      #($s1)++
      or   $s2, $zero, $t4  #$s2 = $t4
      beq  $s1, $s0, Fim    #se $s0 == $s1 -> acaba
      add  $t2, $t3, $t4    #$t2 = $t3 + $t4 = 1 + 2 = 3 --> 5 + 8 = 13
      addi $s1, $s1, 1      #($s1)++
      or   $s2, $zero, $t2  #$s2 = $t2
      beq  $s1, $s0, Fim    #se $s0 == $s1 -> acaba
      add  $t3, $t4, $t2    # $t3 = $t4 + $t2 = 2 + 3 = 5 
      addi $s1, $s1, 1      #($s1)++
      or   $s2, $zero, $t3  #$s2 = $t3
      beq  $s1, $s0, Fim    #se $s0 == $s1 -> acaba
      j Fibo                #volta p loop
      
Fim:  sw  $s2, 4($t0)   
      
# se x = 7
# y = 1 + 1 + 2 + 3 + 5 + 8 + 13 = 13