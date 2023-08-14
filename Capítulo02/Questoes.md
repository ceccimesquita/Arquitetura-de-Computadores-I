## Capítulo 2 - Questões

### Questão 1

> Correção: 0,5

- a )  Correta

- b ) Incorreta, o \n não tá em hexadecímal, deveria ser 

     `0Ah "%d%s" 0Ah, 0`

- c ) Incorreta, variável number não precisa do ADDR 

- d ) Correta

- e ) Incorreta, o \n deveria ser notado em hexadecímal, ou seja 0Ah

### Questão 2

> Correção: 0,5

Ao usar o IVOKE para o printf o conteúdo de eax é perdido, então é necessário armazenar o valor de eax em outra variável antes de usar o printf.

Se a intenção do programa é imprimir primeiro a variável num2 e depois muda-la para o valor de num1, então o código deveria ser:

```asm
mov num1,5
INVOKE printf, ADDR msg1fmt, ADDR msg1, num2
mov eax,num1
mov num2,eax
```

### Questão 3

> Correção: 0,5

```
xb=b1byb=b2
blank line
blank line
z=3
```

### Questão 4

> Correção: 0,5

```
blank line
Thebfirstbnumberbisb5,butbthebsecondbnumberbis7,
blank line
whilebthebthirdbnumberbisb11
blank line
```

```

The first number is 5, but the second number is 7,

while the third number is 11

```





