.data 
str:	.space 32
n1:	.word 10

.text
	li a7, 8 #le str
	la a0, str #a0 recebe endere�o do come�o da str
	li a1, 30 #a1 recebe o n�mero m�ximo de caracteres a serem lidos
	ecall #le o str e bota no endere�o de a0
	
	lw a1, n1 #a1 recebe o c�digo do \n na tabela ASCII
	jal limpa #chama a fun��o limpa
	
	li a7, 4 #print str
	la a0, str #a0 recebe o endere�o da str
	ecall #print str que come�a no endere�o salvo em a0
	
	li a7, 10 #end
	ecall #end
		
limpa:
	mv s1, a0 #s1 = a0, s� para garantir que vai ter o come�o da str salvo
	mv s2, s1 #s2 = s1, s2 vai ser incrementado para ler cada caractere
	li s3, 0 #s3 = 0, s3 vai ser o �ndice a ser incrementado para ler a str
	L1:
		add s2, s1, s3 #s2 = s1 + s3, s2 vai indicar o pr�ximo caractere
		lbu s4, (s2) #s4 = s1[s3], s4 recebe o caractere dessa itera��o
		addi s3, s3, 1 #s3 += 1, incrementa o �ndice
	bne s4, a1, L1 #se o caractere n�o for \n, vai para o pr�ximo caractere. Se for igual a \n continua o c�digo
	sb x0, (s2) #s1[s3] = 0, 0 � o caractere do \0
	ret #retorna da fun��o