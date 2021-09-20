       IDENTIFICATION DIVISION.
       PROGRAM-ID. C05EX01 AS "Capitulo 5 – Exemplo 1".
      *
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       77  LS-VLR-1 PIC S9(4)V99.
       77  LS-VLR-2 PIC S9(4)V99.
       77  LS-C-RST PIC S9(8)V99.
       77  LS-S-RST PIC Z(8)9.99.
       77  LS-OPCAO PIC 9.
       77  LS-ENTER PIC X.
       78  CR VALUE X"0D".
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           PERFORM 100-MENU.
           PERFORM 500-FIM.
      ******************************************************************
      * APRESENTACAO DO MENU DE OPCOES DO PROGRAMA                     *
      ******************************************************************
       100-MENU                        SECTION.
           PERFORM FOREVER
              CALL "SYSTEM" USING "cls"
              DISPLAY "--------------------"
              DISPLAY "Programa Calculadora"
              DISPLAY "   Menu Principal   "
              DISPLAY "--------------------"
              DISPLAY CR
              DISPLAY "[1] - Adicao"
              DISPLAY "[2] - Subtracao"
              DISPLAY "[3] - Multiplicacao"
              DISPLAY "[4] - Divisao"
              DISPLAY "[5] - Fim de programa"
              DISPLAY CR
              DISPLAY "Escolha uma opcao: " WITH NO ADVANCING
              ACCEPT LS-OPCAO
              IF LS-OPCAO NOT = 5
                 EVALUATE LS-OPCAO
                    WHEN 1
                       PERFORM 110-CALCULO-ADC
                    WHEN 2
                       PERFORM 120-CALCULO-SUB
                    WHEN 3
                       PERFORM 130-CALCULO-MUL
                    WHEN 4
                       PERFORM 140-CALCULO-DIV
                    WHEN OTHER
                       DISPLAY "Opcao invalida." WITH NO ADVANCING
                       PERFORM 400-PAUSA
                 END-EVALUATE
              ELSE
                  EXIT PERFORM
              END-IF
           END-PERFORM.
           EXIT.
      ******************************************************************
      * ROTINA PARA CALCULO DA ADICAO                                  *
      ******************************************************************
       110-CALCULO-ADC                 SECTION.
           CALL "SYSTEM" USING "cls"
           DISPLAY "----------------"
           DISPLAY "Rotina de Adicao"
           DISPLAY "----------------"
           PERFORM 200-ENTRADA
           COMPUTE LS-C-RST = LS-VLR-1 + LS-VLR-2.
           PERFORM 300-SAIDA
           EXIT.
      ******************************************************************
      * ROTINA PARA CALCULO DA SUBTRACAO                               *
      ******************************************************************
       120-CALCULO-SUB                 SECTION.
           CALL "SYSTEM" USING "cls"
           DISPLAY "-------------------"
           DISPLAY "Rotina de Subtracao"
           DISPLAY "-------------------"
           PERFORM 200-ENTRADA
           COMPUTE LS-C-RST = LS-VLR-1 - LS-VLR-2.
           PERFORM 300-SAIDA
           EXIT.
      ******************************************************************
      * ROTINA PARA CALCULO DA MULTIPLICAO                             *
      ******************************************************************
       130-CALCULO-MUL                 SECTION.
           CALL "SYSTEM" USING "cls"
           DISPLAY "-----------------------"
           DISPLAY "Rotina de Multiplicacao"
           DISPLAY "-----------------------"
           PERFORM 200-ENTRADA
           COMPUTE LS-C-RST = LS-VLR-1 * LS-VLR-2.
           PERFORM 300-SAIDA
           EXIT.
      ******************************************************************
      * ROTINA PARA CALCULO DA DIVISAO                                 *
      ******************************************************************
       140-CALCULO-DIV                 SECTION.
           CALL "SYSTEM" USING "cls"
           DISPLAY "-----------------"
           DISPLAY "Rotina de Divisao"
           DISPLAY "-----------------"
           PERFORM 200-ENTRADA
           IF LS-VLR-2 = 0
              DISPLAY CR
              DISPLAY "Resultado = ERRO"
              PERFORM 400-PAUSA
           ELSE
              COMPUTE LS-C-RST = LS-VLR-1 / LS-VLR-2
              PERFORM 300-SAIDA
           END-IF
           EXIT.
      ******************************************************************
      * ROTINA PARA A ENTRADA DE DADOS NA CALCULADORA                  *
      ******************************************************************
       200-ENTRADA                     SECTION.
           DISPLAY CR
           DISPLAY "Entre valor 1: " WITH NO ADVANCING
           ACCEPT LS-VLR-1
           DISPLAY "Entre valor 2: " WITH NO ADVANCING
           ACCEPT LS-VLR-2
           EXIT.
      ******************************************************************
      * ROTINA DE SAIDA DE DADOS DA CALCULADORA                        *
      ******************************************************************
       300-SAIDA                       SECTION.
           MOVE LS-C-RST TO LS-S-RST
           DISPLAY CR
           IF LS-C-RST = 0
              DISPLAY "Resultado = " FUNCTION TRIM(LS-S-RST)
           ELSE
              IF LS-C-RST < 0
                 DISPLAY "Resultado = -" FUNCTION TRIM(LS-S-RST)
              ELSE
                 DISPLAY "Resultado = +" FUNCTION TRIM(LS-S-RST)
              END-IF
           END-IF
           PERFORM 400-PAUSA
           EXIT.
      ******************************************************************
      * EXECUCAO DA SECAO DE PAUSA PARA PARADA DE TELA                 *
      ******************************************************************
       400-PAUSA                   SECTION.
           DISPLAY CR
           DISPLAY "Tecle <ENTER> para continuar... " WITH NO ADVANCING
           ACCEPT LS-ENTER.
           EXIT.
      ******************************************************************
      * ENCERRAMENTO DA EXECUCAO DO PROGRAMA CALCULADORA               *
      ******************************************************************
       500-FIM                     SECTION.
           STOP RUN.
