# **Capitulo 1**

> Correção: 2,0

 - Questão 1

> Correção: 0,4

   - a - correto
   - b - errado
   - c - correto
   - d - correto
   - e - correto
   - f - errado

 - Questão 2

> Correção: 0,4

   - a
     - `initial byte ?`
   - b
     - `grade byte 'b'`
   - c
      - `x byte 'P'`
      - `y byte 'Q'`
    - d
      - `amount sdword ?`
    - e
      - `count sdword 0`
    - f
      - `numer sdword -359`

  - Questão 3

> Correção: 0,4

    - a
      - errado, move não esta correto, o correto é mov
    - b
      - errado, não posso mover um contudo da memoria direto para outro endereço de memoria
    - c
      - correto
    - d
      - correto
    - e
      - errado, não posso mover um conteudo da memoria para uma constante
    - f
      - correto
    - g
      - errado, -eax não existe
    - h
      - correto

  - Questão 4

> Correção: 0,4

    - a
    ```asm
        mov i,1
    ```
    - b
    ```asm
        mov eax,y
        mov x, eax
    ```           
    - c
    ```asm
        mov c,2
        mov eax, c
        mov b, eax
        mov a, eax
    ```
    - d
    ```asm
        mov y, 1
        mov eax, y
        mov x, eax 
    ```
    - e
    ```asm
        mov a, 1
        mov b, 2
        mov eax, a
        mov c, eax
        mov eax, b
        move a, eax
        mov eax, c
        mov b, eax
    ```
  - Questão 5

> Correção: 0,4

    - a
    ```asm
        mov a, 'B'
    ```  
    - b
    ```asm
        mov al, c
        mov b, al
    ```
    - c
    ```asm
        mov d, 'E'
        mov al, d
        mov e, al
    ```
    - d
    ```asm
        mov d, 'Z'
        mov al, d
        mov a, al
        mov b, al
    ```
    - e
    ```asm
        mov a, '2' 
        mov b, '?'
        mov al, b
        mov a, al
    ```

    


