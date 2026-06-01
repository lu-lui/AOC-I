#6. Escreva um programa que repetidamente pergunte ao usuário pelo número de quilômetros viajados e litros de gasolina consumidos e 
#depois imprima o número de quilômetros por litro. Para sair do programa, o usuário deve digitar 0 como númerode quilômetros.
#Armazene todos os números de quilômetros por litro na memória, iniciando pelo endereço 0x10010000. Exemplo:
#Entrada Saída
#40
#3         13 -- 13 também deve ser armazenado em 0x10010000
#60
#5         12 -- 12 também deve ser armazenado em 0x10010004
#0 -- Sai do programa

.data
reserva: .space 120
str0: .asciiz "Digite Km percorrido:\n"
str1: .asciiz "Litros consumidos:\n"

.text
la $t0, reserva     #resultados

loop: la $a0, str0    #$a0 = &str0
      li $v0, 4       #codigo p print
      syscall         #print "digite km..."

      li $v0, 5       #codigo ler inteiro  
      syscall         #lê Km
      move $t1, $v0   # $t1 = km
      beq  $t1, $zero, fim     # se km == 0, acaba
      
      la $a0, str1     #$a0 = &str0
      li $v0, 4        #codigo p print
      syscall          #print "litros..."

      li $v0, 5        #ler int
      syscall          #le litros          
      move $t2, $v0    # $t2 = litros

      div  $t1, $t2    #divide km / litros
      mflo $a0         # $a0 = resultado

      li   $v0, 1      # imprime inteiro
      syscall          #imprime resultado

      sw   $a0, 0($t0) #salva result memoria
      addi $t0, $t0, 4 #ponteiro++
   j    loop

fim:li $v0, 10 #codigo p encerrar programa
    syscall    #fim