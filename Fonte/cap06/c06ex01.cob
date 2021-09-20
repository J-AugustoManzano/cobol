       IDENTIFICATION DIVISION.
       PROGRAM-ID. C06EX01 AS "Capitulo 6 – Exemplo 1".
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variaveis diretas de acao do programa
       01  WS-ENTRA-DATA.
           05 DIA        PIC XX.
           05 FILLER     PIC X VALUE "/".
           05 MES        PIC XX.
           05 FILLER     PIC X VALUE "/".
           05 ANO        PIC X(4).
       77  WS-DIA-SEMANA PIC X(21) VALUE "DomSegTerQuaQuiSexSab".
       77  WS-DIA-NUMERO PIC 9(1) value 0.
       77  WS-DATA-ANSI  PIC X(8).
       77  WS-DT-ANSI-N  PIC 9(8).
      * Variaveis indiretas de apoio ao programa
       77  WS-SOMA       PIC 99 VALUE ZERO.
       77  WS-DESLOC     PIC 99.
       77  AC-CI         PIC 9.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           PERFORM 100-ENTRADA       THRU 100-ENTRADA-FIM.
           PERFORM 200-PROCESSAMENTO THRU 200-PROCESSAMENTO-FIM.
           PERFORM 300-SAIDA         THRU 300-SAIDA-FIM.
           STOP RUN.
      * Entrada de dado (data formato DD/MM/AAAA)
       100-ENTRADA                    SECTION.
           DISPLAY "Entre data DD/MM/AAAA: " WITH NO ADVANCING.
           ACCEPT WS-ENTRA-DATA.
           EXIT.
       100-ENTRADA-FIM                 SECTION.
      * Processamento da data
       200-PROCESSAMENTO               SECTION.
      *    Transforma data (DD/MM/AAAA) em data ANSI (AAAAMMDD)
           STRING ANO DELIMITED BY " " MES DELIMITED BY " " DIA INTO
             WS-DATA-ANSI.
           MOVE WS-DATA-ANSI TO WS-DT-ANSI-N.
      *    Calcula o dia da semana a partir da data ANSI
           COMPUTE
              WS-DIA-NUMERO = MOD(INTEGER-OF-DATE(WS-DT-ANSI-N), 7) + 1.
      *    Prepara indice de localização do nome do dia da semana
           PERFORM VARYING AC-CI FROM 0 BY 2 UNTIL AC-CI > WS-DIA-NUMERO
              COMPUTE WS-SOMA = WS-SOMA + AC-CI
           END-PERFORM.
           COMPUTE WS-DESLOC = WS-SOMA + WS-DIA-NUMERO.
           EXIT.
       200-PROCESSAMENTO-FIM           SECTION.
      * Apresentacao dos dados a partir da entrada da data DD/MM/AAAA
       300-SAIDA                       SECTION.
           DISPLAY "Data informada ......: " WS-ENTRA-DATA.
           DISPLAY "Dia da data .........: " DIA.
           DISPLAY "Mes da data .........: " MES.
           DISPLAY "Ano da data .........: " ANO.
           DISPLAY "Data modo ANSI ......: " WS-DATA-ANSI.
           DISPLAY "Dia da semana (#) ...: " WS-DIA-NUMERO.
           DISPLAY "Dia da semana (ext) .: " WS-DIA-SEMANA(WS-DESLOC:3).
           EXIT.
       300-SAIDA-FIM                   SECTION.
      *
       END PROGRAM C06EX01.
