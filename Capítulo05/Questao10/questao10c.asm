;
;   Building Instructions:
;   ml /Cx /coff questao10c.asm /link /SUBSYSTEM:console /out:questao10c.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte   0Ah, "%s", 0Ah,0 
msg2fmt byte   0Ah, "%s%d%s%d" ,0Ah,0
in1fmt  byte    "%d", 0
msg1    byte    "Defina n:", 0
msg2    byte    "Para n = ", 0
msg3    byte    " o resutado de acordo com a sequencia de fibonacci e: ", 0

n       sdword ?

a       sdword ?
b       sdword ?
result  sdword ?
        .code
main    proc
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR n
          .if (n == 0 || n == 1)
          mov eax, n
          jmp toresult
          .endif
          mov a, 0
          mov b, 1
          mov eax, 0
          mov ecx, n
          dec ecx
          .repeat
          mov ebx, b
          add ebx, a     ; soma a + b
          mov eax, ebx
          mov ebx, b     
          mov a, ebx    ; a = b
          mov b, eax   
          .untilcxz
toresult: mov result, eax
          INVOKE printf, ADDR msg2fmt, ADDR msg2, n, ADDR msg3, result
          ret
main    endp
        end