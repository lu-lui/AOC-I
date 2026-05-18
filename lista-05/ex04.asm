#4. Escreva um programa que calcule o fatorial de n. O valor de n deve ser lido da memória na 
#posição 0x10010000 e o valor de n! deve ser escrito na posição seguinte na memória (0x10010004).

.data
n: .word 6  #0x10010000
f: .space 4 #0x10010004

.text
lui  $t0 0x1001       #reg base
lw   $t1, 0($t0)      #$t1 = n = 5
addi $t2, $zero, 1    #$t2 = 1
add  $s0, $zero, $t1  #$s0 = 5
addi $t3, $t1, -1     #$t3 = 4

fatorial: mult $t3, $s0        # 5 * 4
    	  mflo $s0             # acumula resultado = 20
   	  addi $t3, $t3, -1    # $t3 == 3
 	  beq  $t3, $zero, fim # se $t3 == 1, acaba
	  j fatorial
    
fim: sw $s0, 4($t0) #0x10010004