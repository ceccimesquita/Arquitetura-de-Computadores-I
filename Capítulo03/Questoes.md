# **Capítulo 3** #

> Correção: 1,9

### **Questão 18** ###

> Correção: 0,5

- **a )** incorreto, inc é um operador unário 

- **b )** correto

- **c )** incorreto, dois acessos a memória

- **d )** incorreto, não pode ser usado um valor constante

- **e )** incorreto, não pode subtrair de um valor constante

- **f )** correto

### **Questão 2** ###

> Correção: 0,5

- **a )**
```asm
    mov eax, 3
    imul number
    mov product, eax
```
- **b )**
```asm
    mov eax, number
    cdq
    idiv amount
    mov result, edx
```   
- **c )** 
```asm
    mov eax, number
    cdq
    mov ebx, 2
    idiv ebx
    mov answer, eax
```        
- **d )** 
```asm
    mov eax, 4
    mov ebx, number
    sub eax, ebx  
    mov difference, eax         
```

### **Questão 3** ###

> Correção: 0,5

- **a )**
```asm
    mov eax, y
    imul x
    mov ebx, eax
    mov eax, z
    mov ecx, 2
    imul ecx
    add ebx, eax
    mov x, ebx
```
- **b )**
```asm
    mov ebx, 3
    mov eax, c
    cdq
    idiv ebx
    mov ebx, b
    sub ebx, eax
    mov a, ebx
```
- **c )**
```asm
    mov eax, num3
    imul num4
    mov ebx, eax
    mov eax, num1
    cdq
    idiv num2
    sub eax, ebx
    mov total, eax
```
- **d )**
```asm
    mov eax, s
    neg eax
    add eax, t
    mov r, eax
    inc t
```
- **e )**
```asm
    mov eax, i
    sub eax, j
    imul k
    imul n
    mov m, eax
```
- **f )**
```asm
    mov eax, c
    cdq
    idiv d
    imul e
    mov ebx, a
    sub ebx, b
    add ebx, eax
    mov q, ebx
```

### **Questão 4** ###

> Correção: 0,4

- **a )**
```asm
    dec i
```
- **b )**
```asm
    inc k
    mov eax, k
    sub eax, m
    mov j, eax
```
- **c )**
```asm
    mov eax, x
    add eax, y
    neg eax
    mov z, eax
```
- **d )**
```asm
    inc b
    mov eax, b
    sub eax, c
    mov a, eax
    inc c
```
- **e )**

> Correção: o _z_ deve ser decrementado.

```asm
    mov eax, y
    neg eax
    add eax, z
    mov x, eax
    inc z
```