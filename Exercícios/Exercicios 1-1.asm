.text

li a7, 5 #syscall para ler int
ecall #o int lido vai para a0
li a7, 1 #syscall para print int
ecall #print no int em a0
li a7, 10 #syscall para terminar o programa
ecall #termina o programa