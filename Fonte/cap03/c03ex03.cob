       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX03 AS "Capitulo 3 – Exemplo 3".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-A     PIC S9(3)V9(2).
       77  WS-B     PIC S9(3)V9(2).
       77  WS-C     PIC S9(3)V9(2).
       77  WS-ENTER PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre lado <A>: " WITH NO ADVANCING.
           ACCEPT WS-A.
           DISPLAY "Entre lado <B>: " WITH NO ADVANCING.
           ACCEPT WS-B.
           DISPLAY "Entre lado <C>: " WITH NO ADVANCING.
           ACCEPT WS-C.
           IF WS-A < WS-B + WS-C AND
              WS-B < WS-A + WS-C AND
              WS-C < WS-A + WS-B
              IF WS-A = WS-B AND WS-B = WS-C
                 DISPLAY "Triangulo Equilatero."
              ELSE
                 IF WS-A = WS-B OR WS-A = WS-C OR WS-C = WS-B
                    DISPLAY "Triangulo Isosceles."
                 ELSE
                    DISPLAY "Triangulo Escaleno."
                 END-IF
              END-IF
           ELSE
              DISPLAY "Os valores fornecidos nao formam triangulo."
           END-IF.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
              WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
