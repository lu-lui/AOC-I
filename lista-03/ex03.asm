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