*
*     ------------------------------------------------------------------
*	G S T A T E
*     ------------------------------------------------------------------
*
      SUBROUTINE GSTATE(NFIRST,NLAST)
      PARAMETER (NWD=30,NCD=2000,NWD2=2*NWD,NCD4=4*NCD)
*
      COMMON/INFORM/ IREADI,IWRITE,IOUT,IREADF,ISC(7)
      COMMON/STATES/NCFG,MAXORB,IAJCMP(NWD2),LJCOMP(NWD2),NJCOMP(NWD2),
     :NOCCSH(NCD4),NELCSH(5,NCD4),NOCORB(5,NCD4),J1QNRD(9,NCD4)
      COMMON/NOR/NCOM,NORBI,NORBF,IWAR
      CHARACTER*1 JCQN(9)
      DIMENSION J1QN(9),J2QN(9),J3QN(9)
      CHARACTER*8 LABEL(2)
      DATA LABEL/'INITIAL','FINAL'/
*
*      DATA DEFINING THE STATE IS READ IN AND PRINTED OUT.
*
    5 FORMAT(5(1X,A3,1H(,I2,1H)))
    6 FORMAT(9(1X,4X,I1,A1,I1))
   24 FORMAT(//31H INITIAL STATE CONFIGURATIONS:-)
   25 FORMAT(/5H     ,I3,3H.  ,10(1X,A3,1H(,I2,1H)))
   26 FORMAT(11X,10(1X,4X,I1,A1,I1))
   27 FORMAT(22X,9(1X,4X,I1,A1,I1))
   28 FORMAT(  31H ----------------------------  /)
   29 FORMAT(//29H FINAL STATE CONFIGURATIONS:-)
   30 FORMAT(2X,'ELECTRON ',A3,' NOT FOUND IN THE LIST OF ELECTRONS',
     :   ' FOR THE ',A8,' STATE')
      IF (NFIRST .EQ. 1) THEN
         WRITE(IWRITE,24)
         IREAD =IREADI
        ELSE
         WRITE(IWRITE,29)
         IREAD = IREADF
      END IF
      WRITE(IWRITE,28)
      DO 2 I=NFIRST,NLAST
      N=NOCCSH(I)
      READ(IREAD,5)        (NOCORB(J,I),NELCSH(J,I),J=1,N)
      K=I
      IF(NFIRST.NE.1) K=I-NFIRST+1
      WRITE(IWRITE,25) K,(NOCORB(J,I),NELCSH(J,I),J=1,N)
      NCOM1 = NCOM + 1
      NOR11 = NCOM1 + NORBI
      DO 61 J=1,N
      DO 63 JJ = 1,MAXORB
      IF (NFIRST .EQ. 1 .AND. JJ .GE. NOR11) GO TO 65
      IF(NFIRST .NE. 1 .AND. JJ .GE. NCOM1 .AND. JJ .LT. NOR11) GO TO 63
      IF(NOCORB(J,I).EQ.IAJCMP(JJ)) THEN
         NOCORB(J,I) = JJ
         GO TO 61
      END IF
   63    CONTINUE
*
*        ELECTRON NOT FOUND IN THE LIST
*
   65 WRITE(IWRITE,30) NOCORB(J,I),LABEL(NFIRST)
      STOP
   61 CONTINUE
      M=2*N-1
      N1=N+1
      READ(IREAD,6)    (J3QN(J),JCQN(J),J1QN(J),J=1,M)
      WRITE(IWRITE,26) (J3QN(J),JCQN(J),J1QN(J),J=1,N)
      IF(N.EQ.1) GO TO 64
      WRITE(IWRITE,27) (J3QN(J),JCQN(J),J1QN(J),J=N1,M)
   64 CONTINUE
      DO 62 J=1,M
      J2QN(J) = 2*LVAL(JCQN(J)) + 1
   62 J1QNRD(J,I)= (J3QN(J)*64 + J2QN(J))*64 + J1QN(J)
    2 CONTINUE
      RETURN
      END
