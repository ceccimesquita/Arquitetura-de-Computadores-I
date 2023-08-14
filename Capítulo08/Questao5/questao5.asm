; Correção: 1,0
;   Building Instructions:
;   ml /Cx /coff questao5.asm /link /SUBSYSTEM:console  /out:questao5.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
;   
          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
          .data
msg1fmt   byte     "%s", 0Ah, 0
msg2fmt   byte     "%d ", 0
msg1      byte     "Array: ", 0
msg2      byte     "Copy: ", 0
msgbl     byte     0Ah, 0
n         sdword  20
array     sdword  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
copy      sdword  20 dup (?)          
          .code
main      proc
          mov ecx, n
          mov ebx, 0

          .repeat  ; copia array para copy
          mov eax, array[ebx]
          mov copy[ebx], eax
          add ebx, 4
          .untilcxz

          INVOKE printf, ADDR msg1fmt, ADDR msg1
          mov ecx, n ; tamanho do array
          mov ebx, 0 ; indice do array

          .repeat ; printa array
          push ecx ; salva ecx que sera usado por printf
          INVOKE printf, ADDR msg2fmt, array[ebx]
          add ebx, 4
          pop ecx
          .untilcxz

          INVOKE printf, ADDR msgbl

          INVOKE printf, ADDR msg1fmt, ADDR msg2
          mov ecx, n
          mov ebx, 0

          .repeat ; printa copy
          push ecx
          INVOKE printf, ADDR msg2fmt, copy[ebx]
          add ebx, 4
          pop ecx
          .untilcxz

          ret
main      endp
          end
