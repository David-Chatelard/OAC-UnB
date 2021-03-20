.text

add s2, x0, x0 #s2 = 0, s2 vai ser a vari�vel onde os ints lidos ser�o somados
li a7, 5 #syscall para ler int
ecall #le o int e salva em a0, o n�mero de ints a serem lidos
add s1, a0, x0 #salva a0 em s1, s1 ser� o n�mero de ints a serem lidos
L1:
	beq s1, x0, L2 #se o n�mero de ints a serem lidos for 0, pula para o fim
	ecall #le int e salva em a0
	add s2, s2, a0 #s2 += a0, soma o valor lido na vari�vel da soma
	addi s1, s1, -1 #s1 -= 1, decrementa o n�mero de ints a serem lidos
	j L1 #pula para L1
L2:
	li a7, 1 #print int que est� salvo em a0
	add a0, s2, x0 #a0 = s2
	ecall #print a0
	li a7, 10 #end
	ecall #end