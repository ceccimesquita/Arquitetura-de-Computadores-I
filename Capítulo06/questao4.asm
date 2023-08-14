;   Correção: 0,5
;   Building Instructions:
;   ml /Cx /coff questao4.asm /link /SUBSYSTEM:console /out:questao4.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;

          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
scanf     PROTO   arg2:Ptr Byte, inputlist:VARARG
          .data
msg1fmt   byte  "%s", 0Ah, 0
in1fmt    byte  "%d", 0

msg1      byte  0Ah, "Defina o numero no registrador: ", 0
msg2      byte  0Ah, "0: 00000 / 1: 00001 / 2: 00010 / 3: 00011 / 4: 00100 / 5: 00101 / 6: 00110 / 7: 00111" , 0
msg3      byte  "8: 01000 / 9: 01001 / 10: 01010 / 11: 01011 / 12: 01100 / 13: 01101 / 14: 01110 / 15: 01111", 0
msg4      byte  "16: 10000 / 17: 10001 / 18: 10010 / 19: 10011 / 20: 10100 / 21: 10101 / 22: 10110 / 23: 10111", 0
msg5      byte  "24: 11000 / 25: 11001 / 26: 11010 / 27: 11011 / 28: 11100 / 29: 11101 / 30: 11110 / 31: 11111 ", 0
msgb0  byte  "Paper jam", 0Ah, 0    
msgb1   byte  "Paper misfeed", 0Ah, 0    
msgb2 byte  "Paper tray empty", 0Ah, 0    
msgb3   byte  "Toner low", 0Ah, 0    
msgb4  byte  "Toner empty", 0Ah, 0  
msgfim  byte  "Sem erros", 0Ah, 0  

register       dword ?
          .code 
main      proc 
          INVOKE printf, ADDR msg1fmt, ADDR msg2
          INVOKE printf, ADDR msg1fmt, ADDR msg3
          INVOKE printf, ADDR msg1fmt, ADDR msg4
          INVOKE printf, ADDR msg1fmt, ADDR msg5
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR register
          .while register <= 31
          test register, 00000001b
          .if !ZERO?                ; if bit0 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb0
          jmp fim
          .endif

          test register, 00000010b
          .if !ZERO?                ; if bit1 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb1
          jmp fim
          .endif

          test register, 00000100b
          .if !ZERO?                ; if bit2 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb2
          jmp fim
          .endif

          test register, 00001000b
          .if !ZERO?                ; if bit3 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb3
          jmp fim
          .endif
  
          test register, 00010000b
          .if !ZERO?                ; if bit4 = 1 then
          INVOKE printf, ADDR msg1fmt, ADDR msgb4
          jmp fim
          .endif
          INVOKE printf, ADDR msg1fmt, ADDR msgfim
fim:      nop

          INVOKE printf, ADDR msg1fmt, ADDR msg2
          INVOKE printf, ADDR msg1fmt, ADDR msg3
          INVOKE printf, ADDR msg1fmt, ADDR msg4
          INVOKE printf, ADDR msg1fmt, ADDR msg5
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR register
          .endw

          ret
main      endp
          end