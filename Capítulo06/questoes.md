# Capítulo 6

> Correção: 0,5

 ### Questão 1
     - a) Correto
     - b) Correto
     - c) Incorreto, rotate não é uma instrução
     - d) Correto
     - e) Correto
     - f) Incorreta, não pode ser memoria para memoria
     - g) Correto
     - h) Incorreto, lol não é uma instrução
     - i) Incorreto, shift não é uma instrução

 ### Questão 2

> Correção: 0,5

    - a)
    ```asm
    mov eax, total
    sar eax, 5
    mov ebx, num
    sub ebx, eax
    mov answer, ebx
    ```

    - b)
    ```asm
    mov eax, amount 
    add eax, number
    sal eax, 2
    mov result, eax
    ```
    - c)
    ```asm
    mov eax, y
    sal eax, 3
    mov ebx, z
    sar ebx, 1
    add eax, ebx
    mov x, eax
    ```
    - d)
    ```asm
    mov eax, a
    sar eax, 4
    mov a, eax
    mov eax, 6
    imul b
    sub a, eax
    ```
 ### Questão 3 (Teste da questão usando variáveis no .asm)

> Correção: 0,5

  ```asm
        push eax
        push ebx
        push ecx
        push edx
        pop eax
        pop ebx
        pop ecx
        pop edx
  ```