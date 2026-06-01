#2. Escreva um programa que altere uma string para “capitalizar” a primeira letra de cada palavra. Por exemplo, a entrada "meu professor é muito bom"
#deve produzir a string "Meu Professor É Muito Bom" Assuma que a entrada possui apenas espaços e letras minúsculas. Pode haver mais de um espaço entre as palavras. 
#A resposta deve ser a string de entrada modificada, e não uma nova string na memória, ou seja, iniciando no endereço de memória 0x10010000.

.data
string: .asciiz "meu professor é muito bom"

.text
la $t0, string  #&string
li $t1, 1       #flag == 1 - proximo char char deve ser capitalizado

loop: lb   $t2, 0($t0)          #carrega byte atual
      beq  $t2, $zero, fim      #se '\0', termina
      beq  $t2, 32, espaco      #se espaço, pula
      beq  $t1, $zero, proximo  #flag == 0 não capitaliza
      addi $t2, $t2, -32        #converte para maiúscula
      sb   $t2, 0($t0)          #salva no mesmo endereço de memória
      li   $t1, 0               #flag == 0
      j proximo

espaco: li $t1, 1               #flag == 1
      
proximo: addi $t0, $t0, 1       #ponteiro++
         j loop

fim: nop