!
!     ------------------------------------------------------------------
!     O R T H
!
!     ------------------------------------------------------------------
!
      SUBROUTINE ORTH 
!-----------------------------------------------
!   M o d u l e s 
!-----------------------------------------------
      USE NOR_C 
      use ndims_C
      use non30_C
      use ovrlap_C
!
!
!     Determine the orthogonality between initial and final state
!
!...Translated by Pacific-Sierra Research 77to90  4.3E  00:00:10  11/17/01  
!...Switches:                     
 
      IMPLICIT NONE
!-----------------------------------------------
!   L o c a l   P a r a m e t e r s
!-----------------------------------------------
      INTEGER, PARAMETER :: NWD = 128 
!-----------------------------------------------
!   L o c a l   V a r i a b l e s
!-----------------------------------------------
      INTEGER :: M1, I, NCOM1, NOR1, NOR11, NOR2, J, IJ 
!-----------------------------------------------
!      POINTER(QNOC,NOCCSH(1)),(QNELCSH,NELCSH(8,1)),
!     :       (QNOCORB,NOCORB(8,1)),(QJ1,J1QNRD(15,1))
!      POINTER(QIAJCMP,IAJCMP(1)),(QLJCOMP,LJCOMP(1)),
!     :       (QNJCOMP,NJCOMP(1)),(QIAJCLD,IAJCLD(1)),
!     :       (QLJCLSD,LJCLSD(1))
!      COMMON /NDIMS/ QNOC,QNELCSH,QNOCORB,QJ1,NCFG
!      COMMON /NON30/ QIAJCMP,QNJCOMP,QLJCOMP,QIAJCLD,QLJCLSD,MAXORB
!      POINTER (QIORTH,IORTH(1))
!      COMMON/OVRLAP/MU,NU,MUP,NUP,NONORT,NOVLPS,IROWMU,IROWNU,ICOLMU,
!     1 ICOLNU,NORTH,IORDER,NCALLS,LMU,LNU,LMUP,LNUP,JMU,JNU,JMUP,JNUP,
!     2 QIORTH
!
!
!   SET UP OF IORTH VECTOR
!   THE COMMON SET (NCOM) IS ASSUMED TO BE ORTHOGONAL TO BOTH
!   NORBI AND NORBF SETS
!
      IF (NORBI == 0) RETURN  
      M1 = NORBI*NORBF 
      IORTH(:M1) = 0 
      NORTH = 0 
!
!  | 1....NCOM | NCOM1.....NOR1 | NOR11.....NOR2|
!  |   NCOM    |     NORBI      |     NORBF     |
!  |   <= NWD  |     <= NWD     |     <=NWD     |
!
!  THIS LIMITATION IS LINKED TO THE DIMENSION OF BUFFER(NWD) IN
!  ANALYSE SUBROUTINE, where <= stands for LESS THAN or EQUAL.
!
      NCOM1 = NCOM + 1 
      NOR1 = NCOM + NORBI 
      NOR11 = NOR1 + 1 
      NOR2 = NOR1 + NORBF 
      DO J = NCOM1, NOR1 
         DO I = NOR11, NOR2 
            IJ = NORBF*(J - NCOM1) + I - NOR1 
            IF (LJCOMP(I) /= LJCOMP(J)) CYCLE  
            NORTH = NORTH + 1 
            IORTH(IJ) = 1 
         END DO 
      END DO 
      RETURN  
      END SUBROUTINE ORTH 
