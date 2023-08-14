# Capítulo 10

### Questão 1

> Correção: 0,5

     a) 8
     b) 8
     c) 4
     d) 14

### Questão 2

> Correção: 0,3

a)
```asm
     fld x
     fld y
     fsub
     fld z
     fadd
     fstp answer
```
b)
```asm
     fld w
     fld x
     fadd
     fld y
     fld z
     fsub
     fdiv
     fstp result
```
c)
```asm
     fld a
     fld b
     fld c
     fmul ; em C a multiplicação é feita antes da divisão
     fdiv
     fld d
     fsub
     ftst info
```
d)

> Correção: Aqui, pela ordem de avaliação, o _i_ e _j_ seria multiplicados primeiro. 

```asm
     fld k
     fld m
     fld n
     fsub
     fdiv 
     fld i
     fld j
     fmul
     fadd
     fstp data
```
### Questão 6

> Correção: 0,5

```asm
if01:     fld y
          fld x
          fcomip st(0), st(0)
          jbe else01                             ; msg1fmt: 0Ah, "%s", 0Ah, 0
then01:   INVOKE printf, ADDR msg1fmt, ADDR msg1 ; considere msg1: x is greater than y
          jmp endif01
else01:   INVOKE printf, ADDR msg1fmt, ADDR msg2 ; considere msg2: x is less than or equal to y
endif01:  nop
```
### Questão 7

> Correção: 0,5

```asm
if01:     fld y
          fld x
          fcomip st(0), st(1)
          jbe else01                             ; msg1fmt: 0Ah, "%s", 0Ah, 0
then01:   INVOKE printf, ADDR msg1fmt, ADDR msg1 ; considere msg1: x is greater than y
          jmp endif01
else01:   nop
if02:     fld y
          fld x
          fcomip st(0), st(1)
          jae else02                            
then02:   INVOKE printf, ADDR msg1fmt, ADDR msg2 ; considere msg2: x is less than y
          jmp endif02
else02:   INVOKE printf, ADDR msg1fmt, ADDR msg3 ; considere msg3: x and y are equal
endif02:  nop
endif01:  nop
```

# Questão 08

> Correção: 0,0


# Questão 08

> Correção: 0,0