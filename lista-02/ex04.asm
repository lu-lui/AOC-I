#4. Escreva a sequência 0x12345678 em $t1. A seguir, escreva um código que inverta a sequência, escrevendo 0x87654321 em $t2.
#Obviamente o código deve inverter os bits de $t1 e não simplesmente escrever 0x87654321 diretamente em $t2.

.text
ori  $t1, $zero, 0x1234 #$t1 = 1234
sll  $t1, $t1, 16 #$t1 = 12340000
ori  $t1, $t1, 0x5678 #$t1 = 12345678
andi $t2, $t1, 0xF #$t2 = 8
sll  $t2, $t2, 28 #$t2 = 80000000
srl $t1, $t1, 4 #$t1 = 01234567
andi $t3, $t1, 0xF #$t3 = 7
sll  $t3, $t3, 24 #$t3 = 07000000
or $t2, $t2, $t3 #t2 = 87000000
srl $t1, $t1, 4 #$t1 = 00123456
andi $t3, $t1, 0xF #$t2 = 7
sll  $t3, $t3, 20 #$t3 = 00600000
or $t2, $t2, $t3 #t2 = 87600000
srl $t1, $t1, 4 #$t1 = 00012345
andi $t3, $t1, 0xF #$t2 = 5
sll  $t3, $t3, 16 #$t3 = 00050000
or $t2, $t2, $t3 #t2 = 87650000
srl $t1, $t1, 4 #$t1 = 00001234
andi $t3, $t1, 0xF #$t2 = 4
sll  $t3, $t3, 12 #$t3 = 0004000
or $t2, $t2, $t3 #t2 = 87654000
srl $t1, $t1, 4 #$t1 = 00000123
andi $t3, $t1, 0xF #$t2 = 3
sll  $t3, $t3, 8 #$t3 = 0000300
or $t2, $t2, $t3 #t2 = 87654300
srl $t1, $t1, 4 #$t1 = 00000012
andi $t3, $t1, 0xF #$t2 = 2
sll  $t3, $t3, 4 #$t3 = 0000020
or $t2, $t2, $t3 #t2 = 87654320
srl $t1, $t1, 4 #$t1 = 00000001
or $t2, $t2, $t1 #t2 = 87654321

# 0000 0001 0010 0011 0100 0101 0110 0111 1000  
# andi do ultimo valor com F (1111) = pega o ultimo valor e armazena no registrador