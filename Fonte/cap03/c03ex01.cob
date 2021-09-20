       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX01 AS "Capitulo 3 – Exemplo 1".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-A     PIC 9(3).
       77  WS-B     PIC 9(3).
       77  WS-R     PIC 9(4).
       77  WS-DSP-R PIC Z.
       77  WS-ENTER PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre valor <A>: " WITH NO ADVANCING.
           ACCEPT WS-A.
           DISPLAY "Entre valor <B>: " WITH NO ADVANCING.
           ACCEPT WS-B.
           COMPUTE WS-R = WS-A + WS-B.
           IF WS-R >= 10
              DISPLAY "Resultado = " WS-R
           END-IF.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
              WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
