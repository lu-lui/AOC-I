#4. Escreva um programa que conte com três subrotinas capazes de calcular a área da circunferência (π*r^2), do triângulo (b*a/2) e do retângulo (b*a). 
#Inicialmente, pergunte ao usuário (use syscall) qual forma geométrica ele deseja (armazenando no registrador $t0) e depois solicite as medidas necessárias 
#para calcular a área de cada forma (armazenar para circunferência o valor r em $t0, triângulo e retângulo armazenar valor de a e b em $t0 e $t1, respectivamente). 
#Ao final, imprima a área desejada. Respeite as convenções de uso dos registradores.

.data
    str0:   .asciiz "Qual forma geometrica deseja calcular a area?\n1-Circulo\n2-Triangulo\n3-Retangulo\n"
    raio:   .asciiz "Raio: "
    base:   .asciiz "Base: "
    altura: .asciiz "Altura: "
    area:   .asciiz "Area = "

.text
li   $v0, 4             # imprime menu
la   $a0, str0
syscall

li   $v0, 5             # le escolha -> $t0
syscall
move $t0, $v0

#teste para qual subrotina vai
li   $t1, 1
beq  $t0, $t1, circulo
li   $t1, 2
beq  $t0, $t1, triangulo
li   $t1, 3
beq  $t0, $t1, retangulo

j    fim

circulo: li   $v0, 4             # imprime "Raio"
         la   $a0, raio
         syscall
         li   $v0, 5             # le r -> $t0
         syscall
         move $t0, $v0

         mult $t0, $t0           # r²
         mflo $t1                # $t1 = r²
         li   $t2, 3             # pi aproximado
         mult $t1, $t2        
         mflo $t2                # $t2 = area
         j    imprime

triangulo: li   $v0, 4             # imprime "Base"
           la   $a0, base
           syscall
           li   $v0, 5             # le b -> $t0
           syscall
           move $t0, $v0

           li   $v0, 4             # imprime "Altura"
           la   $a0, altura
           syscall
           li   $v0, 5             # le a -> $t1
           syscall
           move $t1, $v0

           mult $t0, $t1           # b * a
           mflo $t2                # $t2 = b * a
           li   $t3, 2
           div  $t2, $t3           # (b * a) / 2
           mflo $t2                # $t2 = area
           j    imprime

retangulo: li   $v0, 4             # imprime "Base"
           la   $a0, base
           syscall
           li   $v0, 5             # le b -> $t0
           syscall
           move $t0, $v0

           li   $v0, 4             # imprime "Altura"
           la   $a0, altura
           syscall
           li   $v0, 5             # le a -> $t1
           syscall
           move $t1, $v0

           mult $t0, $t1           # b * a
           mflo $t2                # $t2 = area
           j    imprime

imprime: li   $v0, 1             # imprime area
         move $a0, $t2
         syscall

fim: li   $v0, 10            # encerra
     syscall