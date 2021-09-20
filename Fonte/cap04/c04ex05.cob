       IDENTIFICATION DIVISION.
       PROGRAM-ID. C04EX05 AS "Capitulo 4 – Exemplo 5".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  TB-ESTUDANTES.
           05  FILLER OCCURS 1 TO 100 TIMES
                      DEPENDING ON WS-NUM-ESTUD.
               15  FILLER OCCURS 4 TIMES.
                   20 WS-NOTA PIC 99V99.
      *
       77  WS-NUM-ESTUD           PIC 9(3).
       77  AC-CI                  PIC 999.
       77  AC-CJ                  PIC 9.
       77  WS-S-CI                PIC ZZ9.
       77  WS-S-NOTA              PIC Z9.99.
       77  WS-ENTER               PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           PERFORM FOREVER
              DISPLAY "Informe quantidade de estudantes: "
              WITH NO ADVANCING
              ACCEPT WS-NUM-ESTUD
              DISPLAY X"0D"
              IF WS-NUM-ESTUD >= 1 AND WS-NUM-ESTUD <= 100
                 EXIT PERFORM
              END-IF
              IF WS-NUM-ESTUD < 1 OR WS-NUM-ESTUD > 10
                 DISPLAY "Por favor, valores entre 1 e 100."
              END-IF
              DISPLAY X"0D"
           END-PERFORM.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > WS-NUM-ESTUD
              MOVE AC-CI TO WS-S-CI
              DISPLAY "Informe notas do " WS-S-CI "o. estudante:"
              DISPLAY X"0D"
              PERFORM VARYING AC-CJ FROM 1 BY 1 UNTIL AC-CJ > 4
                 DISPLAY "Nota: " AC-CJ " = " WITH NO ADVANCING
                 ACCEPT WS-NOTA(AC-CI, AC-CJ)
              END-PERFORM
              DISPLAY X"0D"
           END-PERFORM.
      *
           DISPLAY X"0D".
           DISPLAY "--------------------------------------------------".
           DISPLAY "|                |   1   |   2   |   3   |   4   |".
           DISPLAY "--------------------------------------------------".
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > WS-NUM-ESTUD
              MOVE AC-CI TO WS-S-CI
              DISPLAY "| Estudante #" WS-S-CI " | " WITH NO ADVANCING
              PERFORM VARYING AC-CJ FROM 1 BY 1 UNTIL AC-CJ > 4
                 MOVE WS-NOTA(AC-CI, AC-CJ) TO WS-S-NOTA
                 DISPLAY WS-S-NOTA " | " WITH NO ADVANCING
              END-PERFORM
              DISPLAY X"0D"
           END-PERFORM.
           DISPLAY "--------------------------------------------------".
      *
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
             WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
