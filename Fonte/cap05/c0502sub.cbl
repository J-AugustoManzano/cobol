       IDENTIFICATION DIVISION.
       PROGRAM-ID. C0502SUB.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       78  CR VALUE X"0D".
       COPY "c05ex02.cpy".
       LINKAGE SECTION.
       77  LK-VLR-1 PIC S9(4)V99.
       77  LK-VLR-2 PIC S9(4)V99.
       77  LK-C-RST PIC S9(8)V99.
       PROCEDURE DIVISION USING LK-VLR-1, LK-VLR-2, LK-C-RST.
       PROG-PRINCIPAL-PARA.
           CALL "SYSTEM" USING "cls".
           DISPLAY "-------------------".
           DISPLAY "Rotina de Subtracao".
           DISPLAY "-------------------".
           DISPLAY CR.
           CALL "C0502ENT" USING BY REFERENCE LS-VLR-1, LS-VLR-2.
           COMPUTE LS-C-RST = LS-VLR-1 - LS-VLR-2.
           DISPLAY CR.
           CALL "C0502SAI" USING BY CONTENT LS-C-RST.
           EXIT.
