#2. Escreva um programa equivalente ao código C abaixo com o assembly do MIPS. Assim como no exemplo em C, 
#subrotinas (soma3n e soma). Armazene os valores em $t0, $t1, $t2 e $t3, para X, Y, Z e R, respectivamente.

#main(){
#	int X=150;
#	int Y=230;
#	int Z=991;
#	int R=0;
#	R = soma3n(X, Y, Z);
#}
#int soma3n(int n1, int n2, int n3){
#	return( soma(n3, soma(n1, n2)));
#}
#int soma(int A, int B){
#	return( A+B );
#}

#2. Escreva um programa equivalente ao código C abaixo:
#
# main(){
#     int X=150;
#     int Y=230;
#     int Z=991;
#     int R=0;
#     R = soma3n(X, Y, Z);
# }
#
# int soma3n(int n1, int n2, int n3){
#     return( soma(n3, soma(n1, n2)));
# }
#
# int soma(int A, int B){
#     return( A+B );
# }

.text
li $t0, 150 # X = 150
li $t1, 230 # Y = 230
li $t2, 991 # Z = 991
li $t3, 0   # R = 0

# argumentos 
move $a0, $t0
move $a1, $t1
move $a2, $t2

jal soma3n # chama soma3n(X,Y,Z)

move $t3, $v0 # R = retorno

li $v0, 10 # encerra o programa
syscall

# int soma3n(int n1, int n2, int n3)
soma3n: addi $sp, $sp, -4 # salva o endereço de retorno
        sw $ra, 0($sp)

        jal soma # soma(n1,n2)

        move $a0, $a2 # soma(n3, resultado)
        move $a1, $v0
        jal soma

	lw $ra, 0($sp) # recupera o end. retorno
	addi $sp, $sp, 4

	jr $ra

# int soma(int A, int B)
soma:
    add $v0, $a0, $a1
    jr $ra
