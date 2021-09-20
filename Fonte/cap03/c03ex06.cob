       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX06 AS "Capitulo 3 – Exemplo 6".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-EN    PIC 99.
       77  AC-CI    PIC 99.
       77  AC-CFAT  PIC 9(18) COMP.
       77  AC-SI    PIC Z9.
       77  AC-SFAT  PIC Z(18).
       77  WS-ENTER PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.       
           MOVE 19 TO WS-EN
           MOVE  1 TO AC-CFAT
           MOVE  0 TO AC-CI
           PERFORM UNTIL AC-CI GREATER THAN WS-EN
              MOVE AC-CI TO AC-SI
              MOVE AC-CFAT TO AC-SFAT
              DISPLAY AC-SI "! = " AC-SFAT
              ADD 1 TO AC-CI
              COMPUTE AC-CFAT = AC-CFAT * AC-CI
           END-PERFORM.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
