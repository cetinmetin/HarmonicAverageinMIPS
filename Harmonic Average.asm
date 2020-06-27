.data
sayilar: .double 0
i: .word 0
sonuc: .double 0.0
payda: .double 0.0
input: .asciiz "Sayiyi Girin: "
result: .asciiz "\nHarmonik Ortalama Sonucu: "
gecicipayda: .double 0.0
gecicisonuc: .double 0.0
bir: .double 1.0
on: .double 10.0

.text
.globl	main

main:
ldc1	$f0, sayilar
ldc1	$f2, sonuc
ldc1	$f4, payda
ldc1 	$f6,bir #sabit 1
ldc1 	$f8,on #sabit 10
ldc1	$f10,gecicipayda

while:
add.d $f4,$f4,$f10
bge     $t2, 10, exit

#input message
li $v0, 4
la $a0, input
syscall

addi    $t2, $t2, 1
#get user input
li $v0, 7
syscall
div.d $f10,$f6,$f0

j while

exit:
#Display result message
li $v0, 4
la $a0, result
syscall
#print result
li $v0, 3
div.d $f12,$f8,$f4
syscall
    
