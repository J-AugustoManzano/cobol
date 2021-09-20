       IDENTIFICATION DIVISION.
       PROGRAM-ID. C06EX03 AS "Capitulo 6 – Exemplo 3".
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS CARACTERE IS "0" THRU "9" "/".
       REPOSITORY.
           FUNCTION LENGTH INTRINSIC
           FUNCTION TRIM   INTRINSIC.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01  LS-ENTRA-DATA.
           05 DIA        PIC XX.
           05 FILLER     PIC X VALUE "/".
           05 MES        PIC XX.
           05 FILLER     PIC X VALUE "/".
           05 ANO        PIC X(4).
       66  LS-SAIDA-DATA RENAMES DIA THRU ANO.
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           PERFORM UNTIL EXIT
              DISPLAY "Entre data DD/MM/AAAA: " WITH NO ADVANCING
              ACCEPT LS-ENTRA-DATA
              IF LENGTH(TRIM(LS-ENTRA-DATA)) < 10 OR
                 LS-ENTRA-DATA NOT CARACTERE      OR
                 LS-ENTRA-DATA(3:1) NOT = "/"     OR
                 LS-ENTRA-DATA(6:1) NOT = "/"
                 DISPLAY "Erro na entrada: " WITH NO ADVANCING
              ELSE
                 EXIT PERFORM
              END-IF
           END-PERFORM.
           CALL "C0602DAT"
           USING BY CONTENT LS-ENTRA-DATA, BY REFERENCE LS-SAIDA-DATA.
           DISPLAY "Data informada: " LS-SAIDA-DATA.
           STOP RUN.
       END PROGRAM C06EX03.
