      *=================================================================
       IDENTIFICATION DIVISION.
      *=================================================================
      *
       PROGRAM-ID. C02EX04 AS "Capitulo 2 – Exemplo 4".
      *
      ******************************************************************
      **                                                              **
      **                   AUGUSTO MANZANO – TECNOLOGIA DA INFORMACAO **
      **                                                              **
      ** ANALISTA:    JOSE AUGUSTO MANZANO                            **
      ** PROGRAMADOR: JOSE AUGUSTO MANZANO                            **
      **                                                              **
      ** DATA:        23/05/2020                                      **
      ** MODIFICACAO: 15/04/2021                                      **
      **                                                              **
      ** FINALIDADE:  PROGRAMA DESTINADO A APRESENTAR A DATA E HORA   **
      **              RETORNA A PARTIR DO SISTEMA OPERACIONAL EM USO. **
      **                                                              **
      ******************************************************************
      *
      *=================================================================
       ENVIRONMENT DIVISION.
      *=================================================================
      *
      *-----------------------------------------------------------------
       CONFIGURATION SECTION.
      *-----------------------------------------------------------------
      *
           SOURCE-COMPUTER. IBM-PC COMPATIVEL.
           OBJECT-COMPUTER. IBM-PC COMPATIVEL.
      *
      *=================================================================
       DATA DIVISION.
      *=================================================================
      *
      *-----------------------------------------------------------------
       FILE SECTION.
      *-----------------------------------------------------------------
      *
      * DADOS OBTIDOS PARA A DATA E HORA DO SISTEMA
       WORKING-STORAGE SECTION.
       01  WS-DATA-CORRENTE-SISTEMA.
           05  WS-DATA-CORRENTE.
               10  WS-DATA-CORRENTE-ANO PIC 9(04).
               10  WS-DATA-CORRENTE-MES PIC 9(02).
               10  WS-DATA-CORRENTE-DIA PIC 9(02).
           05  WS-HORA-CORRENTE.
               10  WS-HORA-CORRENTE-HRA PIC 9(02).
               10  WS-HORA-CORRENTE-MIN PIC 9(02).
               10  WS-HORA-CORRENTE-SEG PIC 9(02).
               10  WS-HORA-CORRENTE-CEN PIC 9(02).
      *
      *=================================================================
       PROCEDURE DIVISION.
      *=================================================================
      *
      *.................................................................
      * Este trecho de codigo apresenta as informacoes de data e hora
      * obtidas a partir do sistema operacional.
      *.................................................................
      *
       PROG-PRINCIPAL-PARA.
           MOVE FUNCTION CURRENT-DATE TO WS-DATA-CORRENTE-SISTEMA.
           DISPLAY "Data e hora total .....: " WS-DATA-CORRENTE-SISTEMA.
           DISPLAY "Somente a data ........: " WS-DATA-CORRENTE.
           DISPLAY "Dia ...................: " WS-DATA-CORRENTE-DIA.
           DISPLAY "Mes ...................: " WS-DATA-CORRENTE-MES.
           DISPLAY "Ano ...................: " WS-DATA-CORRENTE-ANO.
           DISPLAY "Somente a hora ........: " WS-HORA-CORRENTE.
           DISPLAY "Horas .................: " WS-HORA-CORRENTE-HRA.
           DISPLAY "Minutos ...............: " WS-HORA-CORRENTE-MIN.
           DISPLAY "Segundos ..............: " WS-HORA-CORRENTE-SEG.
           DISPLAY "Centesimos  ...........: " WS-HORA-CORRENTE-CEN.
           STOP RUN.
