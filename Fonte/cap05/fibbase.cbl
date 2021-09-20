       IDENTIFICATION DIVISION.
       FUNCTION-ID. FIBBASE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       77  LS-NUM PIC 9(38).
       77  LS-ATU PIC 9(38).
       77  LS-PRX PIC 9(38).
       LINKAGE SECTION.
       77  LK-NUM PIC 9(38).
       77  LK-ANT PIC 9(38).
       77  LK-ATU PIC 9(38).
       77  LK-FIB PIC 9(38).
       PROCEDURE DIVISION USING BY VALUE LK-NUM, LK-ANT, LK-ATU
       RETURNING LK-FIB.
       PROG-PRINCIPAL-PARA.       
           EVALUATE LK-NUM
              WHEN 0
                 COMPUTE LK-FIB = LK-ANT
              WHEN 1
                 COMPUTE LK-FIB = LK-ATU
              WHEN 2
                 COMPUTE LS-PRX = LK-ANT + LK-ATU
                 COMPUTE LK-FIB = LS-PRX
              WHEN OTHER
                 MOVE LK-ATU TO LS-ATU
                 COMPUTE LS-NUM = LK-NUM - 1
                 COMPUTE LS-PRX = LK-ANT + LK-ATU
                 COMPUTE LK-FIB =
                         NUMVAL(FIBBASE(LS-NUM, LS-ATU, LS-PRX))
           END-EVALUATE.
           GOBACK.
       END FUNCTION FIBBASE.
