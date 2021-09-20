       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAP05AP01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-E-NUMERO PIC 9(4).
       77  WS-S-FAT    PIC Z(7)9.
       77  WS-ENTER    PIC X.
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre um numero: " WITH NO ADVANCING.
           ACCEPT WS-E-NUMERO.
           CALL "FAT1" USING WS-E-NUMERO, WS-S-FAT.
           DISPLAY "Fatorial = " FUNCTION TRIM(WS-S-FAT).
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
