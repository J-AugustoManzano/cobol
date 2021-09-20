       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX06 AS "Capitulo 3 – Exemplo 12".
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
           MOVE 1 TO AC-CFAT
           DISPLAY "Entre valor entre 1 e 19: " WITH NO ADVANCING.
           ACCEPT WS-EN.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > WS-EN
              MULTIPLY AC-CI BY AC-CFAT ON SIZE ERROR
                 DISPLAY "Erro, o valor informado e' muito grande - "
                 WITH NO ADVANCING
           END-PERFORM.
           SUBTRACT 1 FROM AC-CI.
           MOVE AC-CI TO AC-SI.
           MOVE AC-CFAT TO AC-SFAT.
           DISPLAY FUNCTION TRIM(AC-SI) "! = " FUNCTION TRIM(AC-SFAT)
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
