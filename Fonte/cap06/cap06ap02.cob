       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAP06AP02.
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
       77  WS-DVC      PIC 9.
       77  WS-DVE      PIC 9.
       77  WS-POS      PIC 9.
       77  WS-COD-CPTO PIC X(9).
       77  WS-COD-SPTO PIC X(8).
       77  WS-COD-STRC PIC X(7).
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre codigo (999.999-9): " WITH NO ADVANCING.
           ACCEPT WS-COD-CPTO.
      *    >>> VALIDACAO DE DV
           COMPUTE WS-TAM = LENGTH(WS-COD-CPTO). *> EXTRAI O PONTO
           MOVE RMVCHAR(WS-COD-CPTO, WS-TAM, ".") TO WS-COD-SPTO.
           COMPUTE WS-TAM = LENGTH(WS-COD-SPTO). *> EXTRAI O TRACO
           MOVE RMVCHAR(WS-COD-SPTO, WS-TAM, "-") TO WS-COD-STRC.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > WS-TAM - 2
              MOVE WS-COD-STRC(AC-CI:1) TO WS-POS
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
           COMPUTE WS-DVC = INTEGER(WS-SOMA / 10 + 1) * 10 - WS-SOMA.
           MOVE WS-COD-STRC(7:1) TO WS-DVE.
           IF WS-DVC = WS-DVE
              DISPLAY "Numero de codigo valido."
           ELSE
              DISPLAY "Numero de codigo invalido."
           END-IF.
           STOP RUN.
       END PROGRAM CAP06AP02.
