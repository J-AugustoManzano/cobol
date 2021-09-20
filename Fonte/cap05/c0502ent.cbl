       IDENTIFICATION DIVISION.
       PROGRAM-ID. C0502ENT.
       DATA DIVISION.
       LINKAGE SECTION.
       77  LK-VLR-1 PIC S9(4)V99.
       77  LK-VLR-2 PIC S9(4)V99.
       PROCEDURE DIVISION USING LK-VLR-1, LK-VLR-2.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre valor 1: " WITH NO ADVANCING.
           ACCEPT LK-VLR-1.
           DISPLAY "Entre valor 2: " WITH NO ADVANCING.
           ACCEPT LK-VLR-2.
           EXIT.
