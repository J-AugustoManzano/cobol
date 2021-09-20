       IDENTIFICATION DIVISION.
       FUNCTION-ID. FIB1.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       77  LS-NF1 PIC 9(3).
       77  LS-NF2 PIC 9(3).
       77  LS-NUM PIC 9(38).
       LINKAGE SECTION.
       77  LK-NUM PIC 9(3).
       77  LK-FIB PIC 9(38).
       PROCEDURE DIVISION USING BY VALUE LK-NUM RETURNING LK-FIB.
       PROG-PRINCIPAL-PARA.
           MOVE LK-NUM TO LS-NUM.
           EVALUATE LS-NUM
              WHEN 0
                 COMPUTE LK-FIB = 0
              WHEN 1
                 COMPUTE LK-FIB = 1
              WHEN 2
                 COMPUTE LK-FIB = 1
              WHEN OTHER
                 COMPUTE LS-NF1 = LS-NUM - 1
                 COMPUTE LS-NF2 = LS-NUM - 2
                 COMPUTE LK-FIB = NUMVAL(FIB1(LS-NF1)) +
                                  NUMVAL(FIB1(LS-NF2))
           END-EVALUATE.
           GOBACK.
       END FUNCTION FIB1.
