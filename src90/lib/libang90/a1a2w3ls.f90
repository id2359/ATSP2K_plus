!
!     -------------------------------------------------------------
!      A 1 A 2 W 3 L S
!     -------------------------------------------------------------
!                                                                  *
!     THIS PACKAGE DETERMINES THE VALUES OF FOLLOWING MATRIX       *
!     ELEMENTS:                                                    *
!                                                                  *
!        N1       (l1,s)   N1'         N2       (l2,s)   N2'       *
!     (nl Q L S:: A(1) ::nl Q'L'S')*(nl Q L S:: A(2) ::nl Q'L'S')* *
!        1 1 1 1           1 1 1 1     2 2 2 2           2 2 2 2   *
!                                                                  *
!         N3        (k1,k2)    N3'                              +- *
!     *(nl Q L S :: W(33) :: nl Q'L'S')                         -+ *
!        3 3 3  3              3 3 3 3                          ++ *
!                                                               -- *
!                                                                  *
!     Written by G. Gaigalas,                                      *
!     Vanderbilt University,  Nashville            February 1994   *
!
      SUBROUTINE A1A2W3LS(IK1, IK2, IK3, BK1, BK2, BK3, ID1, ID2, ID3, BD1, BD2&
         , BD3, K1, K2, QM1, QM2, QM3, QM4, WW) 
!-----------------------------------------------
!   M o d u l e s 
!-----------------------------------------------
      USE vast_kind_param, ONLY:  DOUBLE 
      USE CONSTS_C 
!...Translated by Pacific-Sierra Research 77to90  4.3E  07:33:24  11/16/01  
!...Switches:                     
!-----------------------------------------------
!   I n t e r f a c e   B l o c k s
!-----------------------------------------------
      USE mes_I 
      USE c0t5s_I 
      USE sls_I 
      USE w1_I 
      IMPLICIT NONE
!-----------------------------------------------
!   D u m m y   A r g u m e n t s
!-----------------------------------------------
      INTEGER  :: K1 
      INTEGER  :: K2 
      REAL(DOUBLE)  :: QM1 
      REAL(DOUBLE)  :: QM2 
      REAL(DOUBLE)  :: QM3 
      REAL(DOUBLE)  :: QM4 
      REAL(DOUBLE) , INTENT(OUT) :: WW 
      INTEGER  :: IK1(7) 
      INTEGER  :: IK2(7) 
      INTEGER  :: IK3(7) 
      INTEGER  :: ID1(7) 
      INTEGER  :: ID2(7) 
      INTEGER  :: ID3(7) 
      REAL(DOUBLE)  :: BK1(3) 
      REAL(DOUBLE)  :: BK2(3) 
      REAL(DOUBLE)  :: BK3(3) 
      REAL(DOUBLE)  :: BD1(3) 
      REAL(DOUBLE)  :: BD2(3) 
      REAL(DOUBLE)  :: BD3(3) 
!-----------------------------------------------
!   L o c a l   V a r i a b l e s
!-----------------------------------------------
      INTEGER :: IQMM1, IQMM2, IQMM3, IQMM4, IQMM34 
      REAL(DOUBLE) :: A1, C1, S, C, W 
!-----------------------------------------------
      WW = ZERO 
      IF (IK1(3) > 3) THEN 
         IF (IK1(4) > 2) CALL MES (32) 
         IF (ID1(4) > 2) CALL MES (32) 
      ENDIF 
      IF (IK2(3) > 3) THEN 
         IF (IK2(4) > 2) CALL MES (32) 
         IF (ID2(4) > 2) CALL MES (32) 
      ENDIF 
      IF (IK3(3) > 3) THEN 
         IF (IK3(4) > 2) CALL MES (32) 
         IF (ID3(4) > 2) CALL MES (32) 
      ENDIF 
      IQMM1 = QM1 + QM1 + TENTH*QM1 
      IF (IK1(4) /= ID1(4) + IQMM1) RETURN  
      IQMM2 = QM2 + QM2 + TENTH*QM2 
      IF (IK2(4) /= ID2(4) + IQMM2) RETURN  
      IQMM3 = QM3 + QM3 + TENTH*QM3 
      IQMM4 = QM4 + QM4 + TENTH*QM4 
      IQMM34 = IQMM3 + IQMM4 
      IF (IK3(4) /= ID3(4) + IQMM34) RETURN  
      CALL C0T5S (BD1(1), BD1(3), QM1, BK1(1), BK1(3), A1) 
      IF (ABS(A1) < EPS) RETURN  
      CALL C0T5S (BD2(1), BD2(3), QM2, BK2(1), BK2(3), C1) 
      IF (ABS(C1) < EPS) RETURN  
      A1 = A1*C1 
      CALL SLS (IK1(3), IK1(1), IK1(7), IK1(5), IK1(6), ID1(1), ID1(7), ID1(5)&
         , ID1(6), S) 
      IF (ABS(S) < EPS) RETURN  
      CALL SLS (IK2(3), IK2(1), IK2(7), IK2(5), IK2(6), ID2(1), ID2(7), ID2(5)&
         , ID2(6), C) 
      IF (ABS(C) < EPS) RETURN  
      CALL W1 (IK3, BK3, ID3, BD3, K1, K2, QM3, QM4, W) 
      IF (ABS(W) < EPS) RETURN  
      WW = A1*W*S*C/SQRT(DBLE((IK1(7)+1)*(IK2(7)+1))) 
      RETURN  
      END SUBROUTINE A1A2W3LS 
