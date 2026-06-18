#1. Escreva uma subrotina que retorne a média entre três valores. A subrotina deve receber como argumentos três inteiros e retornar a média entre eles. 
#Escreva um programa para testar a subrotina que leia três valores do usuário e imprima o resultado. Importante: Utilize os registradores convencionados 
#para a passagem de argumentos e valor de retorno! Armazene o retorno da subrotina (média entre os três valores) no registrador $t5. Exemplo:
#Entrada      Saída
#51
#42
#39            44 -- 44 também deve ser armazenado em $t5

.data 
str0: .asciiz "Digite um valor inteiro: "

.text
#inicialização
la $s0, str0    #end. string
li $t1, 3       #constante para a media

#entrada de dados 1 (fazer um for para o scanf)
move $a0, $s0   #$a0 = string
li $v0, 4       #imprimir string
syscall

#scanf ler inteiro
li $v0, 5      #ler inteiro
syscall
move $s1, $v0 #armazenar $v0 em $s1 (dado 1)

#entrada de dados 2
move $a0, $s0   #$a0 = string
li $v0, 4       #imprimir string
syscall

#scanf ler inteiro
li $v0, 5      #ler inteiro
syscall
move $s2, $v0 #armazenar $v0 em $s2 (dado 2)

#entrada de dados 3
move $a0, $s0   #$a0 = string
li $v0, 4       #imprimir string
syscall

#scanf ler inteiro
li $v0, 5      #ler inteiro
syscall
move $s3, $v0 #armazenar $v0 em $s3 (dado 3)

#argumentos da subrotina
move $a0, $s1
move $a1, $s2
move $a2, $s3

jal media #chama a subrotina

move $t5, $v0 #$t5 = retorno da função

li $v0, 1      #imprime inteiro
move $a0, $t5   #move $t5 para $a0 (inteiro para ser impresso)
syscall

li $v0, 10      #finalizar programa
syscall


media: #push ra
       addi $sp, $sp, -4
       sw $ra, 0($sp)       #armazena $ra na pilha
       add $t0, $a0, $a1
       add $t0, $t0, $a2
       div $t0, $t1
       mflo $v0           #registrador de retorno = valor da media
       
       #pop ra
       lw $ra, 0($sp)  #restaura onde esta salvo
       addi $sp, $sp, 4
       jr $ra 		  #fim subrotina