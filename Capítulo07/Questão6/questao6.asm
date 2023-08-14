;   Correção: 1,0
;   Building Instructions:
;   ml /c /Fl"questao6.lst" /Cx /coff questao6.asm /link /SUBSYSTEM:console  /out:questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;   ml /Cx /coff questao6.asm /link /SUBSYSTEM:console /out:questao6.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib

        .686
        .model  flat, c
        .stack  100h
printf  PROTO   arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte   0Ah, "%s%d%s%d%s%d",0Ah,0 

msg1    byte    "Para x = ", 0
msg2    byte    " multiplicado por y = ", 0
msg3    byte    " o resultado e: ", 0
x      sdword 10

y      sdword 5

result  sdword 0

     .code
MULACC  MACRO   operand
          if operand EQ 0
               mov eax, 0
          elseif operand EQ 1
               nop
          else
               push ebx
               push ecx
               mov ebx, eax
               mov eax, 0
               mov ecx, operand
               if operand LT 0
                    neg ecx
               endif
               .while ecx > 0
                    add eax, ebx
                    dec ecx
               .endw
               if operand LT 0
                    neg eax
               endif
               pop ecx
               pop ebx
          endif
       ENDM
          
main    proc
          mov eax, x
          MULACC 7
          mov result, eax
          INVOKE  printf, ADDR msg1fmt, ADDR msg1, x, ADDR msg2, y, ADDR msg3, result
main    endp
        end