.data

num: .space 32

.text

li a7, 5 # le int
ecall #salva int em a0
mv s1, a0 #s1 = a0
la s2, num #s2 vai ter o endere�o do come�o da string de bits
mv s3, s2 #s3 = s2, s3 vai ser incrementado, ent�o � bom manter s2 salvo para se ter o come�o da string
li s4, 2 #s4 = 2
mv s5, s1 #s5 = s1
li s7, 0 #s7 = 0, s7 vai ser usado para incrementar o �ndice da string
li s8, 0 #s8 = 0, s8 vai ser o contador de 1's
li s9, 32 #s9 = 32, limite m�ximo da string
BINARIO: #cria uma string com o valor de s1 em bin�rio
	remu s6, s5, s4 #s6 = s5 % 2
	divu s5, s5, s4 #s5 = s5 / 2
	add s3, s2, s7 #s3 = s2 + s7, s3 vai ser o �ndice incrementado da string
	sb s6, (s3) #s2[s7] = s6, vai guardar o bit calculado na string
	addi s7, s7, 1 #s7 += 1, incrementa s7, para a string ir para o pr�ximo �ndice
	bnez s5, BINARIO #se s5 n�o for 0, continua a convers�o de decimal para bin�rio
	mv s3, s2 #volta o s3 para o come�o da string
	li s7, 0 #s7 = 0, para come�ar no come�o da string no pr�ximo procedimento
CONTADOR:
	add s3, s2, s7 #s3 = s2 + s7, s3 vai ser o �ndice incrementado da string
	addi s7, s7, 1 #s7 += 1, incrementa s7, para a string ir para o pr�ximo �ndice
	bgt s7, s9, LF #caso s7 seja maior que s9(31), para de contar, pois o limite da string � 31
	lb s6, (s3) #s6 = s2[s7], vai guardar o bit a ser analisado se � 0 ou 1
	bnez s6, INCREMENTA #se s6 for 1 incrementa, se n�o vai para o pr�ximo bit
	j CONTADOR
INCREMENTA:
	addi s8, s8, 1 #s8 += 1
	j CONTADOR
LF:
	li a7, 1 #print int
	mv a0, s8
	ecall #print a0
	li a7, 10 #end
	ecall #end