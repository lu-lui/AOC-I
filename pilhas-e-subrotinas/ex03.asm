#3. Escreva um programa que calcule o fatorial de um número N inteiro sem sinal, o valor N deve ser inicializado no registrador $t0. 
#Para o cálculo do fatorial deve ser utilizada uma subrotina recursiva. O resultado final deve ser armazenado em $t1. O argumento para 
#a subrotina deve ser passado através do registrador $a0 e o resultado da subrotina deve ser retornado através do registrador $v0.

.data
    str0: .asciiz "Digite um valor inteiro sem sinal: "

.text
#incicialização
la $a0, str0

li $v0, 4 #imprime string
syscall

li $v0, 5 #lê inteiro
syscall
move $t0, $v0 #guarda N em $t0

#argumento
move $a0, $t0
jal  fatorial
move $t1, $v0  #$t1 = resultado 

li $v0, 1 # Exibe o resultado
move $a0, $t1
syscall

li $v0, 10 # Encerra
syscall

fatorial: beq  $a0, $zero, caso_base

          addi $sp, $sp, -8 # Salva $ra e n na pilha
          sw $ra, 4($sp)
          sw $a0, 0($sp)

          addi $a0, $a0, -1 #atorial(n-1)
          jal  fatorial

          lw   $a0, 0($sp) # Recupera n e calcula n * fatorial(n-1)
          mult $a0, $v0    # a0 * $v0
          mflo $v0  

          lw   $ra, 4($sp) # Restaura $ra e desempilha
         addi $sp, $sp, 8
          jr   $ra

caso_base: li $v0, 1
           jr $ra