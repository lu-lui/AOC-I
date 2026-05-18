#2. Escreva um programa que calcule o produtório abaixo. O valor de n deve ser lido daposição 0x10010000 da memória no início do programa. 
#O valor de A deve ser escrito na memória no fim do programa, na posição 0x10010004. OBS: considere a divisão inteira, i.e.:
#1 / 2 = 0, 2 / 2 = 1, 3 / 2 = 1, 4 / 2 = 2, etc.

.data
n: .word 5   #0x10010000
A: .space 4  #0x10010004

.text
lui $t0, 0x1001     #reg. base
lw  $t1, 0($t0)     #$t1 = n = 5
addi $t2, $zero, 0  #$t2 = i = 0
addi $t3, $zero, 2  #$t3 = 2
addi $s2, $zero, 1  #$s1 = el neutro = 1

loop: div  $t2, $t3      #i/2
      mflo $s0           #$s0 = res i/2
      add  $s1, $t1, $s0 #$s1 = n + i/2
      mult $s2, $s1      #$s1 * $s2
      mflo $s2           #$s2 = res
      beq  $t2, $t1 fim  #acaba se o contador chegou em n
      addi $t2, $t2, 1   #i++
      j loop
      
fim: sw $s2, 4($t0)