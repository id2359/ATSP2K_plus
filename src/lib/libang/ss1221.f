*
*     -------------------------------------------------------------
*      S S 1 2 2 1
*     -------------------------------------------------------------
*                                                                  *
*                                                                  *
*     THIS PACKAGE DETERMINES THE VALUES OF MATRIX ELEMENTS        *
*     OF ONE PARTICLE OPERATOR IN CASE :           N'1 = N1        *
*                                                                  *
*                                                                  *
*                                                                  *
*     Written by G. Gaigalas,                                      * 
*     Vanderbilt University,  Nashville             October 1996   * 
*
*
CGG elektrostatine
C      CALL COULOMBLS(LJ(IA),LJ(IB),LJ(IB),LJ(IA),KL1,A1)
C      A1=A1*TWO*DSQRT(DBLE(2*KL1+1))
CGG elektrostatine
      SUBROUTINE SS1221(IG,KL,IA,IB)
      IMPLICIT DOUBLEPRECISION (A-H,O-Z)
      COMMON/CONSTS/ZERO,TENTH,HALF,ONE,TWO,THREE,FOUR,SEVEN,ELEVEN,EPS
      COMMON/MEDEFN/IHSH,NJ(16),LJ(16),NOSH1(16),NOSH2(16),J1QN1(31,3),
     :     J1QN2(31,3),IJFUL(16)
      COMMON/DIAGNL/IDIAG,JA,JB
      KLP=KL+2
      IF(IG-1.LT.KLP) RETURN
      LA=IJFUL(IA)
      LB=IJFUL(IB)
      CALL SSA(LJ(IA),LJ(IB),LJ(IB),LJ(IA),KLP,KL,A1)
      IF(DABS(A1).LT.EPS) RETURN
      INE3=0
      CALL TWO13(KLP,1,KL,1,2,IA,IB,IB,IA,INE3,C,CC)
      C=C*A1*TWO
      IF(DABS(C).GT.EPS)CALL SAVENON(8,C,KL,LA,LB,LB,LA,JA,JB,0)
      RETURN
      END
