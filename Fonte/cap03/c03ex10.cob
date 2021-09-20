       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX10 AS "Capitulo 3 – Exemplo 10".
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-VALOR   PIC 9(4).
       77  WS-PARES   PIC 9(2).
       77  WS-IMPARES PIC 9(2).
       77  WS-RESTO   PIC 99.
       77  WS-PERCT-P PIC 9(3)V99 VALUE ZERO.
       77  WS-PERCT-I PIC 9(3)V99 VALUE ZERO.
       77  AC-CI      PIC 99.
       77  WS-SPAR    PIC Z9.
       77  AC-SIMP    PIC Z9.
       77  AC-SI      PIC Z9.
       77  WS-PORCENT PIC ZZ9.99.
       77  WS-ENTER   PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.       
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 10
              MOVE AC-CI TO AC-SI
              DISPLAY "Entre o " AC-SI "o. valor: " WITH NO ADVANCING
              ACCEPT WS-VALOR
              COMPUTE WS-RESTO = WS-VALOR - 2 * INTEGER(WS-VALOR / 2)
              IF WS-RESTO = 0
                 ADD 1 TO WS-PARES
              ELSE
                 ADD 1 TO WS-IMPARES
              END-IF
           END-PERFORM.
           COMPUTE WS-PERCT-P = (WS-PARES / (AC-CI - 1)) * 100.
           COMPUTE WS-PERCT-I = (WS-IMPARES / (AC-CI - 1)) * 100.
           DISPLAY X"0D".
           MOVE WS-PARES TO WS-SPAR.
           DISPLAY "Quantidade de valores pares .....: " WS-SPAR.
           MOVE WS-IMPARES TO AC-SIMP.
           DISPLAY "Quantidade de valores impares ...: " AC-SIMP.
           DISPLAY X"0D".
           MOVE WS-PERCT-P TO WS-PORCENT.
           DISPLAY "Valores pares ...................: " WS-PORCENT "%".
           MOVE WS-PERCT-I TO WS-PORCENT.
           DISPLAY "Valores impares .................: " WS-PORCENT "%".
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
