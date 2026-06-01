.data
string: .asciiz "Hello World!!\n"
str0: .asciiz "Digite um valor:\n"

.text
li $v0, 4       #id chamada de sistema - imprimir string 
la $a0, string  #endereço do inicio da string
syscall

li $v0, 4       #id chamada de sistema - imprimir string 
la $a0, str0    #endereço do inicio da string
syscall

li $v0, 5       #ler um inteiro
syscall

move $s0, $v0   #move o inteiro para $s0

li $v0, 1       #imprime o inteiro na tela
syscall

li $v0, 10      #fim do programa
syscall
