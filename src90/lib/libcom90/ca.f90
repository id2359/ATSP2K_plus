!
!     -------------------------------------------------------------------
!          C A
!     ------------------------------------------------------------------
!
!
      REAL(KIND(0.0D0)) FUNCTION CA (L, K) 
!-----------------------------------------------
!   M o d u l e s 
!-----------------------------------------------
      USE vast_kind_param, ONLY:  DOUBLE 
      USE EAV_C 
!...Translated by Pacific-Sierra Research 77to90  4.3E  21:52:17  11/14/01  
!...Switches:                     
!-----------------------------------------------
!   I n t e r f a c e   B l o c k s
!-----------------------------------------------
      USE rme_I 
      IMPLICIT NONE
!-----------------------------------------------
!   D u m m y   A r g u m e n t s
!-----------------------------------------------
      INTEGER  :: L 
      INTEGER  :: K 
!-----------------------------------------------
!   L o c a l   V a r i a b l e s
!-----------------------------------------------
!-----------------------------------------------
!
      IF (K == 0) THEN 
         CA = 1.D0 
      ELSE IF (L <= 4) THEN 
         CA = CCA((L*(L-1)+K)/2) 
      ELSE 
         CA = RME(L,L,K)**2/((2*L + 1)*(4*L + 1)) 
      ENDIF 
      RETURN  
      END FUNCTION CA 