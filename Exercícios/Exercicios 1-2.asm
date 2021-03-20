.text

li a7, 5 #syscall para ler int
ecall #le um int e salva em a0
add t0, a0, x0 #salva o valor lido em t0
ecall #le um int e salva em a0
add a0, a0, t0 #soma os dois ints lidos e salva em a0
li a7, 1 #syscall para print int
ecall #print a soma dos ints lidos
li a7, 10 #syscall para terminar o programa
ecall #termina o programa