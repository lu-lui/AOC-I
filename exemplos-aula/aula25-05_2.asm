.data
string: .asciiz "Ser ou nao ser?"
.text
# Inicialização
main: ori $t0, $zero, 0 # cont
      lui $t1, 0x1001 # ponteiro

# Enquanto ch != null
loop: lbu $t2, 0($t1) # carrega o char
      beq $t2, $zero, fim # nulo?
      addi $t0, $t0, 1 # cont++
      addi $t1, $t1, 1 # ponteiro++
      j loop
      
# fim (resultado está em $t0)
fim: nop