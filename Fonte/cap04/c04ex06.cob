       IDENTIFICATION DIVISION.
       PROGRAM-ID. C04EX05 AS "Capitulo 4 – Exemplo 6".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  TB-ESTUDANTES.
           05  TB-ESTUDANTE OCCURS 1 TO 50 TIMES DEPENDING ON WS-N-EST.
               10  WS-NOME  PIC X(25).
               10  TB-NOTAS OCCURS 4 TIMES.
                   15 WS-NT PIC 99V99.
      *
       77  WS-N-EST         PIC 9(3).
       77  AC-CI            PIC 999.
       77  AC-CJ            PIC 9.
       77  WS-C-MEDIA       PIC 99V99.
       77  WS-S-CI          PIC ZZ9.
       77  WS-S-NOTA        PIC Z9.99.
       77  WS-S-MEDIA       PIC Z9.99.
       77  WS-ENTER         PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           PERFORM FOREVER
              DISPLAY "Informe quantidade de estudantes: "
              WITH NO ADVANCING
              ACCEPT WS-N-EST
              DISPLAY X"0D"
              IF WS-N-EST >= 1 AND WS-N-EST <= 100
                 EXIT PERFORM
              END-IF
              IF WS-N-EST < 1 OR WS-N-EST > 10
                 DISPLAY "Por favor, valores entre 1 e 50."
              END-IF
              DISPLAY X"0D"
           END-PERFORM.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > WS-N-EST
              MOVE AC-CI TO WS-S-CI
              DISPLAY "Informe os dados do " WS-S-CI "o. estudante:"
              DISPLAY X"0D"
              DISPLAY "Nome ...: " WITH NO ADVANCING
              ACCEPT WS-NOME(AC-CI)
              PERFORM VARYING AC-CJ FROM 1 BY 1 UNTIL AC-CJ > 4
                 DISPLAY "Nota ...: " AC-CJ " = " WITH NO ADVANCING
                 ACCEPT WS-NT(AC-CI, AC-CJ)
              END-PERFORM
              DISPLAY X"0D"
           END-PERFORM.
      *
           SORT TB-ESTUDANTE ON ASCENDING KEY WS-NOME.
      *
           DISPLAY X"0D".
           DISPLAY "----------------------------------------------------
      -    "-------------------------".
           DISPLAY "| Estudante / Notas         |   1   |   2   |   3
      -    "|   4   | Media |  SIT  |".
           DISPLAY "----------------------------------------------------
      -    "-------------------------".
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > WS-N-EST
              MOVE AC-CI TO WS-S-CI
              DISPLAY "| "  WS-NOME(AC-CI) " | " WITH NO ADVANCING
              COMPUTE WS-C-MEDIA = (WS-NT(AC-CI, 1) + WS-NT(AC-CI, 2)
                      + WS-NT(AC-CI, 3) + WS-NT(AC-CI, 4)) / 4
              PERFORM VARYING AC-CJ FROM 1 BY 1 UNTIL AC-CJ > 4
                 MOVE WS-NT(AC-CI, AC-CJ) TO WS-S-NOTA
                 DISPLAY WS-S-NOTA " | " WITH NO ADVANCING
              END-PERFORM
              MOVE WS-C-MEDIA TO WS-S-MEDIA
              DISPLAY WS-S-MEDIA " | " WITH NO ADVANCING
              IF WS-C-MEDIA >= 5
                 DISPLAY "  A   |" WITH NO ADVANCING
              ELSE
                 DISPLAY "  R   |" WITH NO ADVANCING
              END-IF
              DISPLAY X"0D"
           END-PERFORM.
           DISPLAY "----------------------------------------------------
      -    "-------------------------".
      *
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
             WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
