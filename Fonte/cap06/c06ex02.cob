       IDENTIFICATION DIVISION.
       PROGRAM-ID. C06EX02 AS "Capitulo 6 – Exemplo 2".
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ENTRA-DATA.
           05 DIA        PIC XX.
           05 FILLER     PIC X VALUE "/".
           05 MES        PIC XX.
           05 FILLER     PIC X VALUE "/".
           05 ANO        PIC X(4).
       66  WS-SAIDA-DATA RENAMES DIA THRU ANO.
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre data DD/MM/AAAA: " WITH NO ADVANCING.
           ACCEPT WS-ENTRA-DATA.
           CALL "C0602DAT" USING BY CONTENT   WS-ENTRA-DATA,
                                 BY REFERENCE WS-SAIDA-DATA.
           DISPLAY "Data informada: " WS-SAIDA-DATA.
           STOP RUN.
       END PROGRAM C06EX02.
