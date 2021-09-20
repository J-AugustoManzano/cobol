       IDENTIFICATION DIVISION.
       PROGRAM-ID. C03EX04 AS "Capitulo 3 – Exemplo 4".
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-A     PIC S9(2)V9(2).
       77  WS-B     PIC S9(2)V9(2).
       77  WS-R     PIC S9(3)V9(2).
       77  WS-DSP-R PIC --9.9(2).
       77  WS-OPCAO PIC 9.
       77  WS-ENTER PIC X.
      *
       PROCEDURE DIVISION.
       PROG-PRINCIPAL-PARA.
           DISPLAY "Entre o valor <A>: " WITH NO ADVANCING.
           ACCEPT WS-A.
           DISPLAY "Entre o valor <B>: " WITH NO ADVANCING.
           ACCEPT WS-B.
           DISPLAY X"0D".
           DISPLAY "[1] - Adicao"
           DISPLAY "[2] - Subtracao"
           DISPLAY "[3] - Multiplicacao"
           DISPLAY "[4] - Divisao"
           DISPLAY X"0D".
           DISPLAY "Escolha uma opcao: " WITH NO ADVANCING.
           ACCEPT WS-OPCAO.
           DISPLAY X"0D"
           IF WS-B = 0
              DISPLAY "Erro na divisao."
           ELSE
              IF WS-OPCAO >= 1 AND WS-OPCAO <= 4
                 EVALUATE WS-OPCAO
                    WHEN 1
                       COMPUTE WS-R = WS-A + WS-B
                    WHEN 2
                       COMPUTE WS-R = WS-A - WS-B
                    WHEN 3
                       COMPUTE WS-R = WS-A * WS-B
                    WHEN 4
                       COMPUTE WS-R = WS-A / WS-B
                 END-EVALUATE
                 MOVE WS-R TO WS-DSP-R
                 DISPLAY "O resultado equivale a: " WS-DSP-R
              ELSE
                 DISPLAY "Opcao Invalida."
              END-IF
           END-IF.
           DISPLAY X"0D".
           DISPLAY "Tecle <ENTER> para encerrar... "
              WITH NO ADVANCING.
           ACCEPT WS-ENTER.
           STOP RUN.
