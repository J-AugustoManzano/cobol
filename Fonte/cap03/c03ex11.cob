       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX11 AS "Capitulo 3 – Exemplo 11".
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variaveis de entrada e processamento de dados.
       77  WS-EN-TEXTO PIC XX.
       77  WS-EN-NUMER PIC 9(2).
       77  AC-CI       PIC 99.
       77  WS-CR       PIC 9(3).
      * Variaveis de saida de dados.
       77  WS-SN       PIC Z9.
       77  AC-SI       PIC Z9.
       77  WS-SR       PIC ZZ9.
      * Variaveis de interacao.
       77  WS-RESP     PIC A.
       77  WS-ENTER    PIC X.
      * Definicao de constante para salto de linha.
       78  CR          VALUE X"0D".
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.       
           DISPLAY "=============================="
           DISPLAY "|     PROGRAMA TABUADA       |"
           DISPLAY "| Entre valores entre 1 e 10 |"
           DISPLAY "=============================="
           DISPLAY CR.
           MOVE "S" TO WS-RESP.
           PERFORM UNTIL UPPER-CASE(WS-RESP) NOT = "S"
              PERFORM UNTIL EXIT
                 DISPLAY "Entre valor: " WITH NO ADVANCING
                 ACCEPT WS-EN-TEXTO
                 IF WS-EN-TEXTO IS ALPHABETIC
                    DISPLAY "Por favor, entre valor numerico."
                 ELSE
                    MOVE WS-EN-TEXTO TO WS-EN-NUMER
                    IF WS-EN-NUMER >= 1 AND WS-EN-NUMER <= 10
                       EXIT PERFORM
                    END-IF
                    IF WS-EN-NUMER < 1 OR WS-EN-NUMER > 10
                       DISPLAY "Por favor, valores entre 1 e 10."
                    END-IF
                 END-IF
                 DISPLAY CR
              END-PERFORM
              DISPLAY CR
              PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > 10
                 COMPUTE WS-CR = WS-EN-NUMER * AC-CI
                 MOVE WS-EN-NUMER TO WS-SN
                 MOVE AC-CI TO AC-SI
                 MOVE WS-CR TO WS-SR
                 DISPLAY WS-SN " X " AC-SI " = " WS-SR
              END-PERFORM
              DISPLAY CR
              PERFORM WITH TEST AFTER UNTIL UPPER-CASE(WS-RESP) = "S" OR
                 UPPER-CASE(WS-RESP) = "N"
                 DISPLAY "Continua (S/N): " WITH NO ADVANCING
                 ACCEPT WS-RESP
                 IF UPPER-CASE(WS-RESP) NOT = "S" AND
                    UPPER-CASE(WS-RESP) NOT = "N"
                    DISPLAY 'Entrada invalida! Entre apenas "S" ou "N".'
                 END-IF
                 DISPLAY CR
              END-PERFORM
           END-PERFORM.
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
