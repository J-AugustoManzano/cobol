       IDENTIFICATION DIVISION.
       PROGRAM-ID. C04EX01 AS "Capitulo 4 – Exemplo 1".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-C-SOMA  PIC 9(3)V99 VALUE ZERO.
       77  WS-E-MEDIA PIC 99V99.
       77  WS-S-MEDIA PIC Z9.99.
       77  AC-CI      PIC 9.
       77  WS-S-CI    PIC 9.
       77  WS-ENTER   PIC X.
      *
       01  TB-MEDIAS.
           05 TB-MEDIA PIC 99V99 OCCURS 8 TIMES.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 8
              MOVE AC-CI TO WS-S-CI
              DISPLAY "Informe a " WS-S-CI "a. media: "
              WITH NO ADVANCING
              ACCEPT TB-MEDIA(AC-CI)
              ADD TB-MEDIA(AC-CI) TO WS-C-SOMA
           END-PERFORM.
           DISPLAY X"0D".
           COMPUTE WS-E-MEDIA = WS-C-SOMA / 8.
           MOVE WS-E-MEDIA TO WS-S-MEDIA.
           DISPLAY "Media da sala = " FUNCTION TRIM(WS-S-MEDIA).
      *
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
             WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
