## Capítulo 4 ##
> Correção: 1,1


### Questão 1

> Correção: 0,2. Não podemos usar duas posições de memória em _cmp_.

  - a ) errado, usa == para comparar duas coisas.
  - b ) errado, o uso do them esta errado, não precisa usando diretivas 
  - c ) correto sintaticamente, mas não vai fazer o esperado.
  - d ) correto.

### Questão 2

> Correção: 0,3

  ```asm
    mov eax, b
    mov ebx, c
    .if  a > eax
    dec a
    .else
    .if eax >= ebx
    sub eax, 2
    mov b, eax
    .else 
    .if ebx > d
    add ebx,d
    mov c, ebx
    .else
    mov eax, d
    cdq
    mov ebx, 2
    idiv ebx
    mov d, eax
    .endif
    .endif
    .endif
  ```

### Questão 3

> Correção: 0,3

  - A)
  ```asm
  if01: cmp w,1
      jne endif01
      cmp x, 2
      jne endif01
  then01: dec y
  endif01: nop
  ```
  - B)
  ```asm
  if01: cmp num,0
      jle then01
      cmp num, 3
      jle endif01
  then01: sub count,2
  endif01: nop
  ```

  - C)
  ```asm
  if01: cmp w,1
      je and01
      cmp x,2
      jne endif01
  and01:cmp y,3
      jne endif01
  then01: inc z
  endif01: nop
  ```

  - D)
  ```asm
  if01: cmp b,2
        jne or01
        cmp c,3
        jg then01
  or01: cmp a, 1
        je then01
        cmp d, 4
        jg endif01
  then01: dec e
  endif01: nop
  ``` 

### Questão 4

> Correção: 0,3

```
if (a<=b)
  if(b<c)
    if(c>d)
      c = c + d
    else
      d = d/2
  else
    b = b - 2
else
  a = a - 1
```

- A)

  ```asm
  mov eax, b
  mov ebx, c
  if. a <= eax
  if. eax < ebx
  if. ebx > c
  add ebx, d
  mov c, ebx
  else.
  mov eax, d
  cdq
  mov ebx, 2
  idiv ebx
  mov d, eax
  endif.
  else.
  sub b, 2
  endif.
  else.
  dec a
  endif.
  ```
- B)
  ```asm
          mov eax, b
          mov ebx, c
  if01:   cmp a, eax
          jg else01
  than01: nop
  if02:   cmp eax, ebx
          jge else02
  than02: nop
  if03:   cmp ebx, d
          jle else03
  than03: add ebx, d
          mov c, ebx
          jmp endif01
  else03: mov eax, d
          cdq
          mov ebx, 2
          idiv ebx
          mov d, eax
          jmp endif01      
  else02: sub b,2
          jmp endif01
  else01: dec a
  endif01:  nop

