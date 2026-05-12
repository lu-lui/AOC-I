#4. Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
#20 ≤ temp ≤ 40 e 60 ≤ temp ≤ 80.
#Escreva um programa que coloque uma flag (registrador $t1) para 1 se a temperatura está entre os valores permitidos e para 0 caso contrário.
#Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo temperatura por um valor qualquer.

.text
ori  $t0, $zero, 50 #$t0 = 21 (temperatura)
ori  $t1, $zero, 1  #$t1 = 1 (flag)

slti $t2, $t0, 81          #$t2 = 1 se $t0 < 81
beq  $t2, $zero, Fora      #pula pro fim se $t2 = 0 

slti $t2, $t0, 60          #$t2 = 1 se $t0 < 20
beq  $t2, $zero, Dentro    # pula pro fim se $t2 = 0 

slti $t2, $t0, 41          #$t2 = 1 se $t0 < 41
beq  $t2, $zero, Fora      #pula pro fim se $t2 = 0 

slti $t2, $t0, 20          #$t2 = 1 se $t0 < 20
beq  $t2, $zero, Dentro    #pula pro fim se $t2 = 0
j Fora           

Dentro: j Fim

Fora:  ori $t1, $zero, 0   # $t1 = 0 (flag se está fora do intervalo)

Fim: sll $0, $0, 0  #nop (pula a modificação da flag)