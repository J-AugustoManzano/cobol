       IDENTIFICATION DIVISION.
       PROGRAM-ID. C0502SAI.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       COPY "c05ex02.cpy".
       LINKAGE SECTION.
       77  LK-C-RST PIC S9(8)V99.
       PROCEDURE DIVISION USING LK-C-RST.
       PROG-PRINCIPAL-PARA.
           MOVE LK-C-RST TO LS-S-RST.
           IF LK-C-RST = 0
              DISPLAY "Resultado = " FUNCTION TRIM(LS-S-RST)
           ELSE
              IF LK-C-RST < 0
                 DISPLAY "Resultado = -" FUNCTION TRIM(LS-S-RST)
              ELSE
                 DISPLAY "Resultado = +" FUNCTION TRIM(LS-S-RST)
              END-IF
           END-IF
           CALL "C0502PSA".
           EXIT.
