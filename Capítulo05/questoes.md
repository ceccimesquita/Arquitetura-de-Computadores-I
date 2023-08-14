# Capítulo 5

 ### Questão 1

> Correção: 0,1

  - a - incorreta, não existe essas diretivas em MASM
  - b - incorreta, falta o . na frente do while
  - c - correta
  - d - incorreta, a diretiva é .until ou .untilcxz
  - e - incorreta, as diretivas estão erradas

 ### Questão 2

> Correção: 0,1

   ```asm
            mov ans, 0
    if01:   cmp x,0
            je endif01
            mov ecx, 1
    while01: cmp ecx, y
            jg endw01
            mov eax, ans
            add eax, x
            mov ans, eax
            inc ecx
            jmp while01
    endw01: nop
            mov i, ecx
    endif01:nop
```

 ### Questão 3

> Correção: 0,1

   - a - 3 vezes 
   - b - 1 vez
   - c - Nenhuma vez

 ### Questão 4
 
> Correção: 0,1

   ```asm
        mov ans,0
    if01:   cmp y, 0
        je endif01
        mov ecx,1
    repeat01: nop
        mov eax, ans
        add eax, x
        mov ans, eax
        inc ecx
        cmp ecx,y
        jle repeat01
    endrpt01:nop
        mov i, ecx
    endif01: nop
   ```
   ### Questão 5 (tem o os arquivos .asm de cada item na pasta do capítulo)
   
   > Correção: 0,1

   - a 
   ```asm
   ;com diretiva

            mov edx,eax
            mov eax,0
            .while( edx >= ebx)
            sub edx, ebx
            inc eax
            .endw

   ;sem diretiva

            mov edx, eax
            mov eax, 0
    while01: cmp edx, ebx
            jl endw01
            sub edx, ebx
            inc eax
            jmp while01
    endw01: nop
   ```
   - b 
   ```asm
   ;com diretiva
            mov edx, eax
            mov eax, 0
            .repeat
            sub edx, ebx
            inc eax
            .until edx < ebx

    ;sem diretiva
            mov edx, eax
            mov eax, 0
    repeat01: nop
            sub edx, ebx
            inc eax
            cmp edx, ebx
            jge repeat01
    endrpt01:nop
   ```
   - c
   ```asm
   ;com diretiva
            mov edx, eax
            mov eax, 0
            mov ecx, 1
      .repeat
      .if edx >= ebx
            sub edx, ebx
            inc eax
            inc ecx
      .endif
      .untilcxz

   ```
 ### Questão 6 (tem o o arquivo .asm na pasta do capítulo)

> Correção: 0,1

 ```asm
        mov sum, 0
        mov eax, 1
        mov ecx, 1
        .repeat
        .if eax <= n
        add sum, eax
        inc eax
        .endif
        .untilcxz
        mov i, eax
 ```
 Dessa forma n ser menor ou igual a 0 não acontecerá nada, vai ser como se não tivesse entrado no loop, que é exatamente o que aconteceria no código em C.
 ### Questão 7

> Correção: 0,2

 - Com diretiva
  ```asm
        mov eax, 10
        mov sum, 0
        .repeat
        add sum, eax
        sub eax, 2
        .until eax <= 0
        mov i, eax
 ```
  - Sem diretiva
 ```asm
            mov eax, 10
            mov sum, 0
  repeat01: nop
            add sum, eax
            sub eax, 2
            cmp eax,0
            jg repeat01
  endrpt01: nop
            mov i, eax  

  ```
 ### Questão 8

> Correção: 0,0. É um laço dentro do outro, mas você só está retornando para o primeiro.

  ```asm
        mov ecx, 2
  for01:  nop
        mov tempecx, ecx
        mov ecx, 3
  for02:  nop
        ; body of nested loop
        loop for1
  endfor02: nop
        mov ecx, tempecx
  endfor01: nop

  ```