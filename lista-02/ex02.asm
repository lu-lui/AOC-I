#2. Escreva 0xAAAAAAAA em $t1. Faça um shift de um bit para a direita desse valor e coloque o resultado em $t2, deixando $t1 inalterado. 
#Em $t3, $t4 e $t5 coloque os resultados das operações or, and e xor entre $t1 e $t2, respectivamente. 
#Em comentários no final do código, explique os resultados obtidos, mostrando os valores binários.

.text
ori $t1, $zero, 0xAAAA #t1 = AAAA
sll $t1, $t1, 16 #t1 = AAAA0000
ori $t1, $t1, 0xAAAA #t1 = AAAAAAAA
srl $t2, $t1, 1 #t1 = 55555555
or  $t3, $t1, $t2 #t3 = ffffffff
and $t4, $t1, $t2 #t1 = 00000000
xor $t5, $t1, $t2 #t1 = ffffffff

# or: se um dos bits comparados é 1, o resultado da or é 1. 
# $t1 = AAAAAAAA = 10101010 10101010 10101010 10101010
# $t2 = 55555555 = 01010101 01010101 01010101 01010101
# $t3 = FFFFFFFF = 11111111 11111111 11111111 11111111

# and: se os dois bits comparados forem 1, o resultado da and é 1. 
# $t1 = AAAAAAAA = 10101010 10101010 10101010 10101010
# $t2 = 55555555 = 01010101 01010101 01010101 01010101
# $t3 = 00000000 = 00000000 00000000 00000000 00000000

# xor: se a quantidade de 1s nos bits comparados for ímpar, o resultado da or é 1. 
# $t1 = AAAAAAAA = 10101010 10101010 10101010 10101010
# $t2 = 55555555 = 01010101 01010101 01010101 01010101
# $t3 = FFFFFFFF = 11111111 11111111 11111111 11111111
