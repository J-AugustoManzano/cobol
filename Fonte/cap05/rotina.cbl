       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROTINA.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
       77  WS-ENTER PIC X.
      *
       LINKAGE SECTION.
       77  LK-ENTER PIC X.
      *
       PROCEDURE DIVISION USING LK-ENTER.
       PROG-PRINCIPAL-PARA.
           DISPLAY X"0D".
           DISPLAY "Estou na sub-rotina".
           DISPLAY "Tecle <ENTER> para continuar... " WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           EXIT PROGRAM.
