       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX08 AS "Capitulo 3 – Exemplo 8".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *
       77  WS-EN    PIC 9(2).
       77  AC-CI    PIC 9(2).
       77  WS-CR    PIC 9(3).
       77  WS-SN    PIC Z9.
       77  AC-SI    PIC Z9.
       77  WS-SR    PIC ZZ9.
       77  WS-ENTER PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.       
           DISPLAY "Entre o valor da tabuada: " WITH NO ADVANCING.
           ACCEPT WS-EN.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 10
               COMPUTE WS-CR = WS-EN * AC-CI
               MOVE WS-EN TO WS-SN
               MOVE AC-CI TO AC-SI
               MOVE WS-CR TO WS-SR
               DISPLAY WS-SN " X " AC-SI " = " WS-SR
           END-PERFORM.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
