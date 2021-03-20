.data
# segmento de dados
ehpar: 	 .string "Eh par"
ehimpar: .string "Eh impar"

.text

li a7, 5 #le int
ecall #a0 recebe int
add s1, a0, x0 # s1 = a0
li s2, 2 #s2 = 2
remu s4, s1, s2 #s4 = s1 % 2
beqz s4, L2 #se s4 for 0, vai para L2, pois é par. Senão vai para L1, pois é impar
L1:
	la a0, ehimpar #a0 = &ehimpar
	li a7, 4 #print string
	ecall #print a0
	li a7, 10 #end
	ecall #end
L2:
	la a0, ehpar #a0 = &ehpar
	li a7, 4 #print string
	ecall #print a0
	li a7, 10 #end
	ecall #end