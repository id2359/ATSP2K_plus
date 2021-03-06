!
!     --------------------------------------------------------------
!     R L S P 4 A
!     --------------------------------------------------------------
!                                                                  *
!
      SUBROUTINE RLSP4A(K, JA1, JA2, JA3, K1, K2, K3, IRE, IAT, REC) 
!-----------------------------------------------
!   M o d u l e s 
!-----------------------------------------------
      USE vast_kind_param, ONLY:  DOUBLE 
      USE CONSTS_C 
      USE MEDEFN_C 
!...Translated by Pacific-Sierra Research 77to90  4.3E  12:24:23  11/16/01  
!...Switches:                     
!-----------------------------------------------
!   I n t e r f a c e   B l o c k s
!-----------------------------------------------
      USE dlsa3_I 
      USE dlsa4_I 
      USE dlsa1_I 
      IMPLICIT NONE
!-----------------------------------------------
!   D u m m y   A r g u m e n t s
!-----------------------------------------------
      INTEGER  :: K 
      INTEGER  :: JA1 
      INTEGER  :: JA2 
      INTEGER  :: JA3 
      INTEGER  :: K1 
      INTEGER  :: K2 
      INTEGER  :: K3 
      INTEGER  :: IRE 
      INTEGER  :: IAT 
      REAL(DOUBLE) , INTENT(OUT) :: REC 
!-----------------------------------------------
!   L o c a l   V a r i a b l e s
!-----------------------------------------------
      INTEGER :: ISKR 
      REAL(DOUBLE) :: RE 
!-----------------------------------------------
!
      REC = ONE/DSQRT(DBLE(J1QN1(JA1,K)*J1QN1(JA2,K)*J1QN1(JA3,K))) 
      ISKR = JA3 - JA2 
      IF (ISKR > 1) THEN 
         IAT = 0 
         CALL DLSA3 (K, JA2, JA3, K3, IRE, IAT, RE) 
         IF (IAT == 0) RETURN  
         REC = RE*REC 
      ENDIF 
!
      IAT = 0 
      CALL DLSA4 (K, JA1, JA2, K1, K2, K3, IRE, IAT, RE) 
      IF (IAT == 0) RETURN  
      REC = RE*REC 
!
      IF (JA1==1 .AND. JA2==2) RETURN  
!
      IAT = 0 
      CALL DLSA1 (K, JA1, K1, IRE, IAT, RE) 
      IF (IAT == 0) RETURN  
      REC = RE*REC 
!
      ISKR = JA2 - JA1 
      IF (JA1 == 1) ISKR = JA2 - 1 - JA1 
      IF (ISKR <= 1) RETURN  
      IAT = 0 
      CALL DLSA3 (K, JA1, JA2, K1, IRE, IAT, RE) 
      REC = RE*REC 
      RETURN  
      END SUBROUTINE RLSP4A 
