#3. Escreva um programa que encontre a mediana de três valores lidos da memória. 
#A mediana deve ser salva na posição 0x1001000C da memória. Exemplos:

.data
a: .word 19
b: .word 6
c: .word 9
#Mediana = 9
M: .space 4

.text
lui $t0, 0x1001 #reg base
lw  $t1, 0($t0) #$t1 = a = 19 
lw  $t2, 4($t0) #$t2 = b = 9 
lw  $t3, 8($t0) #$t3 = c = 6

slt $s0, $t2, $t1 #$s0 = 1 se a > b || $s0 = 0 se a < b
slt $s1, $t1, $t3 #$s1 = 1 se a < c || $s0 = 0 se a > c
beq $s0, $s1 MA

slt $s0, $t1, $t2 #$s0 = 1 se a < b || $s0 = 0 se a > b
slt $s1, $t2, $t3 #$s1 = 1 se b < c || $s0 = 0 se b > c
beq $s0, $s1 MB   # se iguais, mediana == b

j MC #se o beq não funcionar em nenhum caso, a mediana é c

MA: add $s2, $zero, $t1
    j fim

MB: add $s2, $zero, $t2
    j fim
    
MC: add $s2, $zero, $t3 
    j fim

fim: sw $s2, 12($t0) #0x1001000C = $s1

