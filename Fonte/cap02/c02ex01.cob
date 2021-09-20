       IDENTIFICATION DIVISION.
       PROGRAM-ID. C02EX01 AS "Capitulo 2 – Exemplo 1".
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  EA PIC S9(3).
       77  EB PIC S9(3).
       77  RC PIC S9(4).
       77  SR PIC  Z(4).
       78  CR VALUE X"0D".
       77  EN PIC X.
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre valor <A>: " WITH NO ADVANCING.
           ACCEPT EA.
           DISPLAY "Entre valor <B>: " WITH NO ADVANCING.
           ACCEPT EB.
           COMPUTE RC = EA + EB.
           MOVE RC TO SR.
           DISPLAY CR.
           DISPLAY "Resultado = " SR.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
             WITH NO ADVANCING.
           ACCEPT EN.
           STOP RUN.
