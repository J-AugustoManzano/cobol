       IDENTIFICATION DIVISION.
       PROGRAM-ID. C02EX03 AS "Capitulo 2 – Exemplo 3".
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  EN PIC 9(3).
       77  ED PIC 9(3).
       77  QC PIC 9(3).
       77  RC PIC 9(3).
       77  SQ PIC Z(3).
       77  SR PIC Z(3).
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre o dividendo ..: "
             WITH NO ADVANCING.
           ACCEPT EN.
           DISPLAY "Entre o divisor ....: "
             WITH NO ADVANCING.
           ACCEPT ED.
           COMPUTE QC = EN / ED.
           COMPUTE RC = EN - ED * QC.
           MOVE QC TO SQ.
           MOVE RC TO SR
           DISPLAY X"0D".
           DISPLAY "Quociente ..........: " SQ.
           DISPLAY "Resto ..............: " SR.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
             WITH NO ADVANCING.
           ACCEPT EN.
           STOP RUN.
