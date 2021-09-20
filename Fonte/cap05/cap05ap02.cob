       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAP05AP02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-E-NUMERO PIC 9(4).
       77  WS-C-FAT    PIC 9(8) VALUE 1.
       77  WS-ENTER    PIC X.
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre um numero: " WITH NO ADVANCING.
           ACCEPT WS-E-NUMERO.
           CALL "FAT2" USING BY CONTENT WS-E-NUMERO, WS-C-FAT.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
