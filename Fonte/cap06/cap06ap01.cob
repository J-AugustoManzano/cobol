       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAP06AP01.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION RMVCHAR
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-TAM      PIC 9(3).
       77  AC-CI       PIC 9(3).
       77  WS-SOMA     PIC 9(4) VALUE ZERO.
       77  WS-DV       PIC 9.
       77  WS-POS      PIC 9.
       77  WS-COD-CPTO PIC X(7).
       77  WS-COD-SPTO PIC X(6).
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre codigo (999.999): " WITH NO ADVANCING.
           ACCEPT WS-COD-CPTO.
      *    >>> Calculo do DV (inicio) **********************************
           COMPUTE WS-TAM = LENGTH(WS-COD-CPTO).
           MOVE RMVCHAR(WS-COD-CPTO, WS-TAM, ".") TO WS-COD-SPTO.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > WS-TAM - 1
              MOVE WS-COD-SPTO(AC-CI:1) TO WS-POS
              IF REM(AC-CI, 2) = 0 AND WS-POS * 2 > 9
                 COMPUTE WS-SOMA = WS-SOMA + WS-POS * 2 - 9
              ELSE
                 IF REM(AC-CI, 2) = 0 AND WS-POS * 2 <= 9
                    COMPUTE WS-SOMA = WS-SOMA + WS-POS * 2
                 END-IF
              END-IF
              IF REM(AC-CI, 2) NOT = 0
                 COMPUTE WS-SOMA = WS-SOMA + WS-POS
              END-IF
           END-PERFORM.
           COMPUTE WS-DV = INTEGER(WS-SOMA / 10 + 1) * 10 - WS-SOMA.
      *    >>> Calculo do DV (fim) *************************************
           DISPLAY "Matricula com DV = " WS-COD-CPTO "-" WS-DV.
           STOP RUN.
       END PROGRAM CAP06AP01.
