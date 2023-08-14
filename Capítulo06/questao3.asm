;
;   Building Instructions:
;   ml /Cx /coff questao3.asm /link /SUBSYSTEM:console /out:questao3.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte   0Ah, "%s%d", 0Ah,0 
msg1    byte    "eax = ", 0
msg2    byte    "ebx = ", 0
msg3    byte    "ecx = ", 0
msg4   byte    "edx = ", 0
a       sdword 1
b       sdword 2
ca       sdword 3
d       sdword 4

        .code
main    proc
          INVOKE printf, ADDR msg1fmt, ADDR msg1, a
          INVOKE printf, ADDR msg1fmt, ADDR msg2, b
          INVOKE printf, ADDR msg1fmt, ADDR msg3, ca
          INVOKE printf, ADDR msg1fmt, ADDR msg4, d
          push a
          push b
          push ca
          push d
          pop a
          pop b
          pop ca
          pop d
          INVOKE printf, ADDR msg1fmt, ADDR msg1, a
          INVOKE printf, ADDR msg1fmt, ADDR msg2, b
          INVOKE printf, ADDR msg1fmt, ADDR msg3, ca
          INVOKE printf, ADDR msg1fmt, ADDR msg4, d
main    endp
        end