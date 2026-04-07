.text #identifica um segmento de memória para instruções
addi $t0, $zero, 5 #t0=5
addi $t1, $zero, 10 #$t1=10
add  $t2, $t1, $t0 #$t2=$t1+$t0
sub  $t3, $t2, $t1 #15-10=5
mult $t0, $t1 #$t0*$t1 = 5*10=50
mflo $t4 #$t4 = $t0*$t1
div  $t4, $t0 #$t4/$t0 = 50/5=10
mflo $t5 #$t5 = $t4/$t0
mfhi $t6 #$t6 = $t4%$t0
sra $t7, $t5, 1 #shift right