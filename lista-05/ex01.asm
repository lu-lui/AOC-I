#1. Reescreva o seguinte código C em MIPS Assembly:
#int i;
#int vetor[8];
#for(i=0; i<8; i++) {
   #if(i%2==0)
      #vetor[i] = i * 2;
   #else
      #vetor[i] = vetor[i] + vetor[i-1];
#}
#Cada posição do vetor deve ter 4 bytes e deve ser armazenada, em sequência, a partir da posição 0x1001000 da memória.

.data
vetor: .space 32 #4 * 8 indices = 32

.text
lui $s0, 0x1001
add $t0, $zero, $zero #$t0 = i = 0
addi $t1, $zero, 8    #$t1 = limite = 8
addi $t3, $zero, 2    #$t3 = 2
 
for: beq  $t0, $t1, fim #jump fim se $t0 = 8
     div  $t0, $t3
     mfhi $t2 #resto
     beq  $t2, $zero, par
     j impar

par: mult $t0, $t3
     mflo $s1
     sw   $s1, 0($s0)
     addi $t0, $t0, 1 #i++
     addi $s0, $s0, 4 #próxima posição do vetor
     j for 
     
impar: lw  $t5, 0($s0)   #vetor[i]
       lw  $t6, -4($s0)  #vetor[i-1]
       add $t7, $t5, $t6 #[i] + [i-1]
       sw  $t7, 0($s0)   #guarda $t7 na memoria
       
       addi $t0, $t0, 1 #i++
       addi $s0, $s0, 4 #próxima posição do vetor
       j for
fim:
