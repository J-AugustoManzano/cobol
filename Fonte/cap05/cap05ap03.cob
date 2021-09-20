       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAP05AP03.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-E-NUMERO PIC 9(4).
       77  WS-C-FAT    PIC 9(8) VALUE 1.
       77  WS-S-FAT    PIC Z(7)9.
       77  WS-ENTER    PIC X.
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre um numero: " WITH NO ADVANCING.
           ACCEPT WS-E-NUMERO.
           CALL "FAT3" USING WS-C-FAT, BY CONTENT WS-E-NUMERO.
           MOVE WS-C-FAT TO WS-S-FAT.
           DISPLAY "Fatorial = " FUNCTION TRIM(WS-S-FAT).
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
