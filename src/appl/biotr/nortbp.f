*
*     ------------------------------------------------------------------
*	N O R T B P
*     ------------------------------------------------------------------
*
      SUBROUTINE nortbp(JA,JB)
      IMPLICIT DOUBLE PRECISION(A-H,O-Z)
*
      DIMENSION ILNO(2),IRNO(2)
      COMMON /INOUT/IREAD,IWRITE,ISCW,iuc(2),iuw(2),iul(2),iuj(2),iut(2)
      POINTER (QIORTH,IORTH(1))
      COMMON/OVRLAP/MU,NU,MUP,NUP,NONORT,NOVLPS,IROWMU,IROWNU,ICOLMU,
     : ICOLNU,NORTH,IORDER,NCALLS,LMU,LNU,LMUP,LNUP,JMU,JNU,JMUP,JNUP,
     : QIORTH
      POINTER(QNOC,NOCCSH(1)),(QNELCSH,NELCSH(8,1)),
     :       (QNOCORB,NOCORB(8,1)),(QJ1,J1QNRD(15,1))
      POINTER(QIAJCMP,IAJCMP(1)),(QLJCOMP,LJCOMP(1)),
     :       (QNJCOMP,NJCOMP(1)),(QIAJCLD,IAJCLD(1)),
     :       (QLJCLSD,LJCLSD(1))
      COMMON /NDIMS/ QNOC,QNELCSH,QNOCORB,QJ1,NCFG
      COMMON /NON30/ QIAJCMP,QNJCOMP,QLJCOMP,QIAJCLD,QLJCLSD,MAXORB
      COMMON /NOR/NCOM,NCLOSI,NCLOSF,NORBI,NORBF,IWAR
*
  101 FORMAT(/63H INCORRECT NON-ORTHOGONALITY SET UP IN THE MATRIX ELEME
     1NT  -  (,I2,3H/V/,I2,1H))
*
      N1=NOCCSH(JA)
      N2=NOCCSH(JB)
      IWAR=0
      JMU=0
      JNU=0
      JMUP=0
      JNUP=0
      IL=0
      IR=0
*
* --- BEGIN SEARCH FOR NON-ORTHOGONAL SUBSHELLS IN THIS MATRIX ELEMENT
*
      DO 1 I=1,N1
      NI=NOCORB(I,JA)
      DO 2 J=1,N2
      NJ=NOCORB(J,JB)
      IF(NI.EQ.NJ) GO TO 2
      NA=MIN0(NI,NJ)
      IF (NA .LE. NCOM) GO TO 2
      NB=MAX0(NI,NJ)
*
*   THE FOLLOWING CARD IS NOT THE SAME THAN IN NORTBP OF NON
*
      NC = NORBF*(NA-NCOM-1) + NB - NCOM - NORBI
      IF(IORTH(NC).NE.1) GO TO 2
      IF (IL .EQ. 0) GO TO 4
      IF (ILNO(IL) .EQ. I) GO TO 14
      IF (IL .EQ. 2) GO TO 100
    4 IL = IL+1
      ILNO(IL) = I
   14 IF ( IR .EQ. 0) GO TO 7
      DO 15 K = 1,IR
      IF (IRNO(K) .EQ. J) GO TO 2
   15 CONTINUE
      IF (IR .EQ. 2) GO TO 100
    7 IR = IR+1
      IRNO(IR) = J
    2 CONTINUE
    1 CONTINUE
      IF(IL.EQ.0) GO TO 8
      IF(IR.EQ.1) GO TO 11
      IF(IRNO(1).LE.IRNO(2)) GO TO 11
      ISTO=IRNO(1)
      IRNO(1)=IRNO(2)
      IRNO(2)=ISTO
   11 JMU=ILNO(1)
    3 IF(IL.EQ.1) GO TO 5
      JNU=ILNO(2)
    5 JMUP=IRNO(1)
    6 IF (IR .EQ. 1) GO TO 10
      JNUP=IRNO(2)
      GO TO 10
    8 NOVLPS=0
      RETURN
  100 WRITE(IWRITE,101) JA,JB
      IWAR = 1
      RETURN
   10 NMU=NOCORB(JMU,JA)
      NMUP=NOCORB(JMUP,JB)
      LMU=LJCOMP(NMU)
      LMUP=LJCOMP(NMUP)
      IF (JNU .EQ. 0 .AND. JNUP .EQ. 0) GO TO 9
      IF (JNU .EQ. 0) JNU = JMU
      IF (JNUP .EQ. 0) JNUP = JMUP
      NNU=NOCORB(JNU,JA)
      NNUP=NOCORB(JNUP,JB)
      LNU=LJCOMP(NNU)
      LNUP=LJCOMP(NNUP)
      NOVLPS=2
      RETURN
    9 NOVLPS=1
      RETURN
      END