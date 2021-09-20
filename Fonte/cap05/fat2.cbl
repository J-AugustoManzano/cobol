       PROGRAM-ID. FAT2.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  AC-CI       PIC 9(4).
       77  WS-S-FAT    PIC Z(7)9.
       LINKAGE SECTION.
       77  LK-E-NUMERO PIC 9(4).
       77  LK-C-FAT    PIC 9(8).
       PROCEDURE DIVISION USING LK-E-NUMERO, LK-C-FAT.
       PROG-PRINCIPAL-PARA.
           PERFORM VARYING AC-CI FROM 1 BY 1 UNTIL AC-CI > LK-E-NUMERO
              COMPUTE LK-C-FAT = LK-C-FAT * AC-CI
           END-PERFORM.
           MOVE LK-C-FAT TO WS-S-FAT.
           DISPLAY "Fatorial = " FUNCTION TRIM(WS-S-FAT).
           EXIT PROGRAM.
