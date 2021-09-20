       IDENTIFICATION DIVISION.
       PROGRAM-ID. C02EX02 AS "Capitulo 2 – Exemplo 2".
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  HT   PIC 9(4)V99.
       77  VH   PIC 9(4)V99.
       77  PD   PIC    9V9(4).
       77  SB   PIC 9(5)V99.
       77  TD   PIC 9(5)V99.
       77  SL   PIC 9(5)V99.
       77  S-SB PIC $BZZ.ZZ9,99.
       77  S-TD PIC $BZZ.ZZ9,99.
       77  S-SL PIC $BZZ.ZZ9,99.
       77  EN   PIC X.
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre horas trabalhadas ........: "
             WITH NO ADVANCING.
           ACCEPT HT.
           DISPLAY "Entre valor da hora ............: "
             WITH NO ADVANCING.
           ACCEPT VH.
           DISPLAY "Entre percentual de desconto ...: "
             WITH NO ADVANCING.
           ACCEPT PD.
           COMPUTE SB = HT * VH.
           COMPUTE TD = (PD / 100) * SB.
           COMPUTE SL = SB - TD.
           MOVE SB TO S-SB.
           MOVE TD TO S-TD.
           MOVE SL TO S-SL.
           DISPLAY X"0D".
           DISPLAY "Salario bruto ....: " S-SB.
           DISPLAY "Desconto .........: " S-TD.
           DISPLAY "Salario liquido ..: " S-SL.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
             WITH NO ADVANCING.
           ACCEPT EN.
           STOP RUN.
