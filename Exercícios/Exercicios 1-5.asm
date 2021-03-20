.data

rsp:  .space 30
size: .word 30

.text

li a7, 8 #le string
la a0, rsp #a0 recebe o endereço da string
la s1, rsp #s1 recebe o endereço do começo da string
li a1, 30 #define o tamanho da string
ecall #a0 recebe a string
mv s2, s1 #s2 = s1, s2 vai ser incrementado para obter os caracteres um por um
li s3, 0 #s3 = 0, s3 vai ser o valor incrementado para ter a função do indice da string
li s5, 97 #s5 = 97, 97 é o valor de 'a' na tabela ASCII
li s6, 122 #s6 = 122, 122 é o valor de 'z' na tabela ASCII
li s7, 30

L1:
	bgt s3, s7, LF
	add s2, s1, s3 #s2 = s1 + s3, vai incrementar o indice da string
	lbu s4, (s2) #s4 = s1[s3], s4 vai receber cada caractere da string
	addi s3, s3, 1 #s3 += 1, incrementa s3, para ir para o próximo índice
	bge s4, s5, L2 #se o caractere em s4 tiver um valor maior ou igual a 'a' na tabela ASCII vai faltar verificar se ele tem um valor menor ou igual a 'z' para que ele seja uma letra minúscula
	j L1 #se s4 for menor que 'a', então não é uma letra minúscula, então vai para o próximo caractere
L2:
	ble s4, s6, L3 #se o caractere for menor ou igual a 'z', como ja foi garantido antes ser maior ou igual a 'a', o caractere é uma letra minúscula
	j L1 #se s4 for maior que 'z', então não é uma letra minúscula, então vai para o próximo caractere
L3:
	addi s4, s4, -32 #s4 -=32, pela tabela ASCII, converte a letra para maiúscula
	sb s4, (s2) #salva a letra maiúscula na string
	j L1 #vai para o próximo caractere

LF:
	li a7, 4 #print string
	ecall #print
	li a7, 10 #end
	ecall #end