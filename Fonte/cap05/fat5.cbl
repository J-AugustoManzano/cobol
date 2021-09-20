       IDENTIFICATION DIVISION.
       FUNCTION-ID. FAT5.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY.
           FUNCTION FATBASE
           FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       77  LS-NUM PIC 99.
       77  LS-PAR PIC 9(38).
       LINKAGE SECTION.
       77  LK-NUM PIC 99.
       77  LK-FAT PIC 9(38).
       PROCEDURE DIVISION USING LK-NUM RETURNING LK-FAT.
       PROG-PRINCIPAL-PARA.
           MOVE LK-NUM TO LS-NUM
           MOVE 1 TO LS-PAR
           COMPUTE LK-FAT = NUMVAL(FATBASE(LS-NUM, LS-PAR))
           GOBACK.
       END FUNCTION FAT5.
