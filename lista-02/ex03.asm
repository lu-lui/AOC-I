#3. Comece um programa pela instrução: ori $t1, $zero, 0x01. Usando apenas as instruções lógicas do tipo R (dois registradores como operandos) 
#or, and e xor e instruções de shift (isto é, sem usar outras instruções ori além da inicial e nem instruções nor), escreva 0xFFFFFFFF em $t1. 
#Procure usar o menor número de instruções possível.

.text
ori $t1, $zero, 0x01 #$t1 = 00000001
sll $t2, $t1, 1 #t2 = 00000002
or  $t1, $t1, $t2 #$t1 = 0000003
sll $t2, $t1, 2 #t2 = 00001100
or $t1, $t1, $t2 #t1 = 0000000c
sll $t2, $t1, 4 #t2 = 0000000f
sll $t2, $t1, 4 #t2 = 000000f0
or $t1, $t1, $t2 #t1 = 000000ff
sll $t2, $t1, 8 #t2 = 000000f0
or $t1, $t1, $t2 #t1 = 0000ffff
sll $t2, $t1, 16 #t2 = 000000f0
or $t1, $t1, $t2 #t1 = ffffffff