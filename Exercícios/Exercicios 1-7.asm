.text

li a7, 5 #le int
ecall #salva int em a0, vai ser o int a do enunciado
mv s1, a0 #s1 = a0, s1 = a do enunciado
ecall #salva int em a0, vai ser o int b do enunciado
mv s2, a0 #s2 = a0, s2 = b do enunciado
ecall #salva int em a0, vai ser o int c do enunciado
mv s3, a0 #s3 = a0, s3 = c do enunciado
mul s2, s2, s3 #s2 = s2 * s3, b = b * c
add s1, s1, s2 #s1 = s1 + s2, a = a + (b * c)
li a7 1 #print int
mv a0, s1 #a0 = s1
ecall #print a0
li a7, 10 #end
ecall #end