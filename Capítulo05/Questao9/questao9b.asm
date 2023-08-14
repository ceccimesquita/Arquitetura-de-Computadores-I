;
;   Building Instructions:
;   ml /Cx /coff questao9b.asm /link /SUBSYSTEM:console /out:questao9b.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;
        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte   0Ah, "%s", 0Ah,0 
msg2fmt byte   0Ah, "%d%s%s%d",0Ah,0
in1fmt  byte    "%d", 0
msg1    byte    "Defina n:", 0
msg2    byte    "!", 0
msg3    byte    " e igual a: ", 0
n       sdword ?
result  sdword ?
        .code
main    proc
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR n
          mov eax, 1
          mov ecx, n
          .if ecx == 0
          jmp toresult
          .endif
          .repeat
          imul ecx
          dec ecx
          .until (ecx == 0)
toresult: mov result, eax
          INVOKE printf, ADDR msg2fmt, n, ADDR msg2, ADDR msg3, result
          ret
main    endp
        end