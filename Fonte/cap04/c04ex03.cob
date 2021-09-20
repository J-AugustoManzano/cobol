       IDENTIFICATION DIVISION.
       PROGRAM-ID. C04EX03 AS "Capitulo 4 – Exemplo 3".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-C-SOMA PIC 9(3) VALUE ZERO.
       77  WS-S-SOMA PIC Z(3).
       77  AC-CI     PIC 9.
       77  WS-ENTER  PIC X.

       01  TB-A.
           05 A PIC 9(3) OCCURS 5 TIMES.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 5
              DISPLAY "Informe a " AC-CI "a. media: "
              WITH NO ADVANCING
              ACCEPT A(AC-CI)
           END-PERFORM.
      *
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 5
              IF FUNCTION REM(AC-CI, 2) NOT = 0
                 ADD A(AC-CI) TO WS-C-SOMA
              END-IF
           END-PERFORM.
      *
           DISPLAY X"0D".
           MOVE WS-C-SOMA TO WS-S-SOMA
           DISPLAY "A soma dos elementos equivale a: "
           FUNCTION TRIM(WS-S-SOMA)
      *
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
             WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
