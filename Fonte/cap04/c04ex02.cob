       IDENTIFICATION DIVISION.
       PROGRAM-ID. C04EX02 AS "Capitulo 4 – Exemplo 2".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  AC-CI    PIC 9.
       77  WS-S-A   PIC Z(3).
       77  WS-S-B   PIC Z(3).
       77  WS-ENTER PIC X.
      *
       01  TB-A.
           05 A PIC 9(3) OCCURS 5 TIMES.
      *
       01  TB-B.
           05 B PIC 9(3) OCCURS 5 TIMES.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "EXEMPLO DE CHECAGEM DE INDICE"
           DISPLAY X"0D"
      *
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 5
              DISPLAY "Informe um valor para o elemento nr. "
              AC-CI ": " WITH NO ADVANCING
              ACCEPT A(AC-CI)
           END-PERFORM.
      *
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 5
              IF FUNCTION REM(AC-CI, 2) = 0
                 COMPUTE B(AC-CI) = A(AC-CI) * 5
              ELSE
                 COMPUTE B(AC-CI) = A(AC-CI) + 5
              END-IF
           END-PERFORM.
      *
           DISPLAY X"0D"
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 5
              MOVE A(AC-CI) TO WS-S-A
              MOVE B(AC-CI) TO WS-S-B
              DISPLAY "A[" AC-CI "] = " WS-S-A " | " WITH NO ADVANCING
              DISPLAY "B[" AC-CI "] = " WS-S-B
           END-PERFORM.
      *
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
             WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
