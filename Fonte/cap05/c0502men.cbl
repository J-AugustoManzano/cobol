       IDENTIFICATION DIVISION.
       PROGRAM-ID. C0502MEN.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       77  LS-OPCAO PIC 9.
       78  CR VALUE X"0D".
       LINKAGE SECTION.
       77  LK-OPCAO PIC 9.
       PROCEDURE DIVISION USING LK-OPCAO.
       PROG-PRINCIPAL-PARA.
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
                       CALL "C0502ADC"
                    WHEN 2
                       CALL "C0502SUB"
                    WHEN 3
                       CALL "C0502MUL"
                    WHEN 4
                       CALL "C0502DIV"
                    WHEN OTHER
                       DISPLAY "Opcao invalida." WITH NO ADVANCING
                       CALL "C0502PSA"
                 END-EVALUATE
              ELSE
                  EXIT PERFORM
              END-IF
           END-PERFORM.
           EXIT.
