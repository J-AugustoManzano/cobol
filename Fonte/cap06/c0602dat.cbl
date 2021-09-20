       IDENTIFICATION DIVISION.
       PROGRAM-ID. C0602DAT.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01  TB-DATA.
           05  TB-DATA-DIA   PIC 99.
           05  TB-DATA-MES   PIC 99.
           05  TB-DATA-ANO   PIC 9(5).
           05  TB-ULTIMO-DIA PIC 99.
           05  TB-DATA-BISXT PIC 9.
               88 TB-DT-BISX VALUE 0 1. *> 0 = Falso | 1 = Verda-deiro
           05  TB-DATA-OK    PIC 9.
               88 TB-DT-OK   VALUE 0 1. *> 0 = Falso | 1 = Verda-deiro
           78  FEVEREIRO     VALUE 2.
           78  JULHO         VALUE 7.
       77  LS-DATA-ANSI      PIC X(8).
       77  LS-RESTO          PIC 9(4).
       77  LS-QUOCT          PIC 9(4).
       LINKAGE SECTION.
       77  LK-ENTRA-DATA     PIC X(10).
       77  LK-SAIDA-DATA     PIC X(10).
       PROCEDURE DIVISION USING LK-ENTRA-DATA, LK-SAIDA-DATA.
       PROG-PRINCIPAL-PARA.
           MOVE LK-ENTRA-DATA(1:2) TO TB-DATA-DIA.
           MOVE LK-ENTRA-DATA(4:2) TO TB-DATA-MES.
           MOVE LK-ENTRA-DATA(7:4) TO TB-DATA-ANO.
      *    Checa ano bissexto
           MOVE 0 TO TB-DATA-BISXT.
           COMPUTE LS-RESTO = REM(TB-DATA-ANO, 400).
           IF LS-RESTO = 0
              MOVE 1 TO TB-DATA-BISXT
           ELSE
              COMPUTE LS-RESTO = REM(TB-DATA-ANO, 100)
              IF LS-RESTO NOT = 0
                 COMPUTE LS-RESTO = REM(TB-DATA-ANO, 4)
                 IF LS-RESTO = 0
                    MOVE 1 TO TB-DATA-BISXT
                 END-IF
             END-IF
           END-IF.
      *    Detecta ultimo dia do MES
           IF TB-DATA-MES = FEVEREIRO
              IF TB-DATA-BISXT = 1
                MOVE 29 TO TB-ULTIMO-DIA
              ELSE
                MOVE 28 TO TB-ULTIMO-DIA
              END-IF
           ELSE
              IF TB-DATA-MES <= JULHO
                 COMPUTE LS-RESTO = REM(TB-DATA-MES, 2)
                 IF LS-RESTO = 0
                    MOVE 30 TO TB-ULTIMO-DIA
                 ELSE
                    MOVE 31 TO TB-ULTIMO-DIA
                 END-IF
              ELSE
                 COMPUTE LS-RESTO = REM(TB-DATA-MES, 2)
                 IF LS-RESTO = 0
                    MOVE 31 TO TB-ULTIMO-DIA
                 ELSE
                    MOVE 30 TO TB-ULTIMO-DIA
                 END-IF
              END-IF
           END-IF.
      *    Validacao da DATA
           MOVE 0 TO TB-DATA-OK.
           IF TB-DATA-ANO >= 1601 AND
              TB-DATA-ANO <= 9999 AND
              TB-DATA-MES >=    1 AND
              TB-DATA-MES <=   12 AND
              TB-DATA-DIA >=    1 AND
              TB-DATA-DIA <= TB-ULTIMO-DIA
              MOVE 1 TO TB-DATA-OK
           END-IF.
      *    Validacao do retorno para apresentacao de data
           IF TB-DATA-OK = 1
              MOVE LK-ENTRA-DATA TO LK-SAIDA-DATA
           ELSE
              MOVE "**/**/****"  TO LK-SAIDA-DATA
           END-IF.
           EXIT PROGRAM.
       END PROGRAM C0602DAT.
