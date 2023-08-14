;
;   Building Instructions:
;   ml /Cx /coff questao6.asm /link /SUBSYSTEM:console /out:questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte   0Ah, "%s",0Ah,0 
msg2fmt byte   0Ah, "%s%d%s%d",0Ah,0
in1fmt  byte    "%d", 0
msg1    byte    "Defina n:", 0
msg2    byte    "Sum = ", 0
msg3    byte    " e i = ", 0
sum      sdword ?
n       sdword ?
i       sdword ?
        .code

result  sdword 0
        .code
main    proc
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR n
          mov sum, 0
          mov eax, 1
          mov ecx, 1
          .repeat
          .if eax <= n
          add sum, eax
          inc eax
          inc ecx
          .endif
          .untilcxz
          mov i, eax
          INVOKE printf, ADDR msg2fmt, ADDR msg2, sum, ADDR msg3, i
main    endp
        end