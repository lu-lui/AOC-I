#3. Faça um programa que calcule o seguinte polinômio usando o método de Horner: y = - ax^4 + bx³ - cx² + dx - e
#Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado y. 
#Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). 
#Utilize as sete primeiras posições da memória .data para armazenar, consecutivamente, a, b, c, d, e, x e y, iniciando o código com:

.data
a: .word -3 #0x10010000
b: .word 7 #0x10010004
c: .word 5 #0x10010008
d: .word -2 #0x1001000C
e: .word 8 #0x10010010
x: .word 4 #0x10010014
y: .space 4 #0x10010018

#y=((((−a)x+b)x−c)x+d)x−e

.text
lui $t0, 0x1001 #endereço-base
lw $t1, 20($t0) #t1 = x = 4 

lw $s0, 0($t0) #$s0 = a = -3
sub $s0, $zero, $s0 #$s0 = -a = 3
mult $s0, $t1 #3 * 4 = 12
mflo $s0 #s0 = 12

lw $s1, 4($t0) #$s1 = b = 7
add $s0, $s0, $s1 #$s0 = 19
mult $s0, $t1 #19 * 4 = 76
mflo $s0 #s0 = 76

lw $s1, 8($t0) #$s1 = c = 5
sub $s0, $s0, $s1 #$s0 = 76 - 5 = 71
mult $s0, $t1 #71 * 4 = 284
mflo $s0 #s0 = 284

lw $s1, 12($t0) #$s1 = d = -2
add $s0, $s0, $s1 #$s0 = 284 + -2 = 282
mult $s0, $t1 #282 * 4 = 1128
mflo $s0 #s0 = 1128

lw $s1, 16($t0) #$s1 = e = 8
sub $s0, $s0, $s1 #$s0 = 1128 - 8 = 1120

sw $s0, 24($t0)
