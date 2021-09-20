       IDENTIFICATION DIVISION.
       PROGRAM-ID. BASE.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-ENTER PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Estou no programa principal".
           DISPLAY "Tecle <ENTER> para avancar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
      *
           CALL "ROTINA" USING WS-ENTER.
      *
           DISPLAY X"0D".
           DISPLAY "Voltei ao programa principal".
           DISPLAY "Tecle <ENTER> para encerrar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
