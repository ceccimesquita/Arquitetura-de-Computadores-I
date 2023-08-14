;   Correção: 1,0
;   Building Instructions:
;   ml /Cx /coff questao3.asm /link /SUBSYSTEM:console  /out:questao3.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;   
          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
scanf     PROTO   arg2:Ptr Byte, inputlist:VARARG
          .data
msg1fmt   byte    "%s",0Ah, 0
msg2fmt   byte    0Ah, "%s", 0Ah, 0Ah, 0
in1fmt    byte    "%s", 0
msg1      byte    "Escreva uma palavra de 10 letras: ", 0
msg3      byte    "E um palindromo.", 0
msg4      byte    "Nao e um palindromo.", 0
name1     byte    11 dup(" ")
aux       byte    5 dup(" ")
          .code 
main      proc
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR name1
          
          mov     esi, offset name1+9
          mov     edi, offset aux
          mov     ecx, 5
          .repeat
            mov  al, [esi]
            mov  [edi], al
            inc  edi 
            dec  esi
          .untilcxz


          mov   edi, offset name1+0
          mov   esi, offset aux+0
          mov   ecx, 5
          .repeat
            cld
            cmpsb
            jne  nao
          .untilcxz
          INVOKE printf, ADDR msg2fmt, ADDR msg3
            jmp  fim
          
    nao:  INVOKE printf, ADDR msg2fmt, ADDR msg4
          
    fim:  nop

          ret
          
main      endp
          end