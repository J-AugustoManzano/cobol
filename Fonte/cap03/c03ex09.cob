       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX09 AS "Capitulo 3 – Exemplo 9".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  AC-CI    PIC 99.
       77  AC-SI    PIC Z9.
       77  WS-ENTER PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.       
           PERFORM VARYING AC-CI FROM 10 BY -1 UNTIL AC-CI < 1
              MOVE AC-CI TO AC-SI
              DISPLAY AC-SI
           END-PERFORM.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
