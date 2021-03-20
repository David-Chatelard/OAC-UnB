.data 
str:	.space 32
n1:	.word 10

.text
	li a7, 8 #le str
	la a0, str #a0 recebe endereço do começo da str
	li a1, 30 #a1 recebe o número máximo de caracteres a serem lidos
	ecall #le o str e bota no endereço de a0
	
	lw a1, n1 #a1 recebe o código do \n na tabela ASCII
	jal limpa #chama a função limpa
	
	li a7, 4 #print str
	la a0, str #a0 recebe o endereço da str
	ecall #print str que começa no endereço salvo em a0
	
	li a7, 10 #end
	ecall #end
		
limpa:
	mv s1, a0 #s1 = a0, só para garantir que vai ter o começo da str salvo
	mv s2, s1 #s2 = s1, s2 vai ser incrementado para ler cada caractere
	li s3, 0 #s3 = 0, s3 vai ser o índice a ser incrementado para ler a str
	L1:
		add s2, s1, s3 #s2 = s1 + s3, s2 vai indicar o próximo caractere
		lbu s4, (s2) #s4 = s1[s3], s4 recebe o caractere dessa iteração
		addi s3, s3, 1 #s3 += 1, incrementa o índice
	bne s4, a1, L1 #se o caractere não for \n, vai para o próximo caractere. Se for igual a \n continua o código
	sb x0, (s2) #s1[s3] = 0, 0 é o caractere do \0
	ret #retorna da função