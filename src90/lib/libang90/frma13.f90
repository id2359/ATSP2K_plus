!
!     -----------------------------------------------------------------
!      F R M A 1 3
!     -----------------------------------------------------------------
!
!      JT7 = 79 -- 85                                              *
!
      SUBROUTINE FRMA13(J1, J2, ISKA, IVAR) 
!...Translated by Pacific-Sierra Research 77to90  4.3E  10:10:49  11/16/01  
!...Switches:                     
      IMPLICIT NONE
!-----------------------------------------------
!   D u m m y   A r g u m e n t s
!-----------------------------------------------
      INTEGER , INTENT(IN) :: J1 
      INTEGER , INTENT(IN) :: J2 
      INTEGER , INTENT(OUT) :: ISKA 
      INTEGER , INTENT(OUT) :: IVAR 
!-----------------------------------------------
!   L o c a l   V a r i a b l e s
!-----------------------------------------------
      INTEGER , DIMENSION(19) :: IS79A 
      INTEGER , DIMENSION(63) :: IS79B 
      INTEGER , DIMENSION(7) :: IS80A 
      INTEGER , DIMENSION(62) :: IS80B 
      INTEGER , DIMENSION(7) :: IS81A 
      INTEGER , DIMENSION(5) :: IS81B 
      INTEGER , DIMENSION(3) :: IS81C, IS81D 
      INTEGER , DIMENSION(36) :: IS81E 
      INTEGER , DIMENSION(12) :: IS82A 
      INTEGER , DIMENSION(58) :: IS82B 
      INTEGER , DIMENSION(45) :: IS83A 
      INTEGER , DIMENSION(36) :: IS83B 
      INTEGER , DIMENSION(13) :: IS84A 
      INTEGER , DIMENSION(68) :: IS84B 
      INTEGER , DIMENSION(91) :: IS85 
      INTEGER :: I2 
!-----------------------------------------------
!
      DATA IS79A/ 5644800, -392000, 2*0, 2874960, 3168000, 4*0, 285120, &
         -1976832, -30030, 0, 945945, 35035, 0, -713097, 243243/  
      DATA IS79B/ 171376128, 15779610, -22792770, -126587538, 40072417, &
         -3037265, 2*0, -71042400, -5920200, 49335000, 16773900, 2*0, 171694080&
         , 27870480, -39302640, 3041280, 9*0, -87026940, -9669660, 7*0, &
         -84157920, -8346240, 15195180, 65604924, 46690644, -5977608, 4*0, &
         -31559220, 253175076, 3272808, 6*0, 45208800, 11840400, 0, 247, 907647&
         , 0, -55740960, -74321280/  
      DATA IS80A/ 3630, 0, -76545, -1197875, 0, 3737097, -5203467/  
      DATA IS80B/ 37644750, -101943270, -5789718, -11969683, -25109315, 3*0, &
         13267800, 86488584, 9820356, 3*0, 19278000, 8075, -53824, 9*0, -442260&
         , 64870260, 9*0, 24101220, 21592116, -4247100, 91891800, 4*0, 8365500&
         , -1286604, 46200, 7*0, 2948400, 0, 1463, 23273, 0, 4284000, 18506880&
         /  
      DATA IS81A/ -3023790, 0, 1301265, -1799875, 0, -375921, -2721411/  
      DATA IS81B/ 2327130, 2406690, 4188834, 165649, -6545/  
      DATA IS81C/ 1156680, -2303840, 512435/  
      DATA IS81D/ 874575, -18188225, -5973528/  
      DATA IS81E/ 17542980, 26206180, 9*0, -41181140, -5067972, 168468300, &
         12612600, 4*0, 13273260, 23891868, 221744600, 7*0, 9547200, 0, -5168, &
         -25, 0, 2028000, 25090560/  
      DATA IS82A/ 116424, 77616, 2*0, -17600, 12150, 2*0, -6615, 0, -46800, &
         13365/  
      DATA IS82B/ 101920, 5*0, -66150, 5*0, 74970, 10*0, -12320, 14080, 4050, &
         -2205, -32760, 37440, 4455, 8*0, -16170, 5*0, 71344, 0, -81536, 7*0, &
         -22050, 2*0, 24990/  
      DATA IS83A/ 148720, 182520, 4*0, -149760, -76032, 3*0, -458640, 2*0, &
         275184, 5*0, 864864, 36036, 228888, -673596, 8*0, -10400, 280800, 4*0&
         , -522720, 293760, 4*0, -122400/  
      DATA IS83B/ -416416, 1859, -60840, 0, 419328, -1872, 25344, 6*0, -12285, &
         363888, -76296, -20592, 4*0, 29120, 0, -130, 139230, 6*0, 174240, 2*0&
         , 40800, -620160/  
      DATA IS84A/ 1552320, -58212, 0, 126720, 2430, 142560, 106920, -1323, &
         194040, 336960, 2673, 379080, 117612/  
      DATA IS84B/ -9702, 3*0, -426888, 5*0, -733824, 0, -825552, 3*0, -13230, 0&
         , -582120, 3*0, 14994, 659736, 6*0, -349272, 3*0, -70400, 65610, &
         -35721, 0, -187200, 72171, -135520, -360360, 6*0, -261954, 7*0, 407680&
         , 2*0, 784784, 4*0, -357210, 2*0, 404838/  
      DATA IS85/ -197946320, -5577000, 0, -63598080, 2*0, 199330560, 2323200, 0&
         , 26492928, 6552000, -27467440, 28028000, -30270240, 16480464, &
         -16816800, -66528, 4*0, 133233100, -6993800, -40340916, 0, -106586480&
         , -79754752, 2*0, 41164200, -8466612, -4119060, 13842400, 16816800, 0&
         , -17160000, 69271488, -2800512, 15972000, 17592960, 182138880, &
         -17952000, 46512, -21600, 3740000, 42649600, 66977280, 6*0, 80720640, &
         2*0, 7865, -54208440, 2*0, -6921200, 22581504, -286, 28188160, 0, &
         -48432384, 2*0, 1216215, -36024912, -67979736, 2038608, 0, 118552896, &
         4*0, -275, -13783770, 0, 20, -49420800, 3*0, 155247840, -51701760, 0, &
         36352800, 61395840/  
!
      SELECT CASE (J1)  
      CASE (79)  
         IF (J2 < 139) RETURN  
         IF (J2 < 158) THEN 
            I2 = J2 - 138 
            ISKA = IS79A(I2) 
            IVAR = 203280 
         ELSE IF (J2 < 230) THEN 
            IF (J2 < 167) RETURN  
            I2 = J2 - 166 
            ISKA = IS79B(I2) 
            IF (I2 == 59) THEN 
               IVAR = 682 
            ELSE IF (I2 == 60) THEN 
               IVAR = 210056 
            ELSE 
               IVAR = 9350880 
            ENDIF 
         ENDIF 
      CASE (80)  
         IF (J2 == 140) THEN 
            ISKA = 208 
            IVAR = 27 
         ELSE IF (J2 < 158) THEN 
            IF (J2 < 151) RETURN  
            I2 = J2 - 150 
            ISKA = IS80A(I2) 
            IVAR = 166320 
         ELSE IF (J2 < 230) THEN 
            IF (J2 < 168) RETURN  
            I2 = J2 - 167 
            ISKA = IS80B(I2) 
            SELECT CASE (I2)  
            CASE (16)  
               IVAR = 1794 
            CASE (17)  
               IVAR = 3289 
            CASE (58)  
               IVAR = 558 
            CASE (59)  
               IVAR = 744 
            CASE DEFAULT 
               IVAR = 4324320 
            END SELECT 
         ENDIF 
      CASE (81)  
         IF (J2 == 140) THEN 
            ISKA = -3094 
            IVAR = 297 
         ELSE IF (J2 < 158) THEN 
            IF (J2 < 151) RETURN  
            I2 = J2 - 150 
            ISKA = IS81A(I2) 
            IVAR = 130680 
         ELSE IF (J2 < 173) THEN 
            IF (J2 < 168) RETURN  
            I2 = J2 - 167 
            ISKA = IS81B(I2) 
            IVAR = 308880 
         ELSE IF (J2 < 179) THEN 
            IF (J2 < 176) RETURN  
            I2 = J2 - 175 
            ISKA = IS81C(I2) 
            IVAR = 213444 
         ELSE IF (J2 < 185) THEN 
            IF (J2 < 182) RETURN  
            I2 = J2 - 181 
            ISKA = IS81D(I2) 
            IVAR = 759759 
         ELSE IF (J2 < 230) THEN 
            IF (J2 < 194) RETURN  
            I2 = J2 - 193 
            ISKA = IS81E(I2) 
            IF (I2 == 32) THEN 
               IVAR = 279 
            ELSE IF (I2 == 33) THEN 
               IVAR = 28644 
            ELSE 
               IVAR = 7927920 
            ENDIF 
         ENDIF 
      CASE (82)  
         IF (J2 < 137) RETURN  
         IVAR = 588 
         IF (J2 < 149) THEN 
            I2 = J2 - 136 
            ISKA = IS82A(I2) 
         ELSE IF (J2 == 163) THEN 
            ISKA = -48510 
         ELSE IF (J2 < 231) THEN 
            IF (J2 < 173) RETURN  
            I2 = J2 - 172 
            ISKA = IS82B(I2) 
         ENDIF 
      CASE (83)  
         IF (J2 < 141) RETURN  
         IVAR = 4368 
         IF (J2 < 186) THEN 
            I2 = J2 - 140 
            ISKA = IS83A(I2) 
         ELSE IF (J2 < 232) THEN 
            IF (J2 < 196) RETURN  
            I2 = J2 - 195 
            ISKA = IS83B(I2) 
         ENDIF 
      CASE (84)  
         IF (J2 < 138) RETURN  
         IVAR = 10584 
         IF (J2 < 151) THEN 
            I2 = J2 - 137 
            ISKA = IS84A(I2) 
         ELSE IF (J2 < 231) THEN 
            IF (J2 < 163) RETURN  
            I2 = J2 - 162 
            ISKA = IS84B(I2) 
         ENDIF 
      CASE (85)  
         IF (J2 < 141) RETURN  
         IF (J2 < 232) THEN 
            I2 = J2 - 140 
            ISKA = IS85(I2) 
            SELECT CASE (I2)  
            CASE (43)  
               IVAR = 2093 
            CASE (44)  
               IVAR = 23023 
            CASE (57)  
               IVAR = 3024 
            CASE (63)  
               IVAR = 27 
            CASE (79)  
               IVAR = 1512 
            CASE (82)  
               IVAR = 27 
            CASE DEFAULT 
               IVAR = 2642640 
            END SELECT 
         ENDIF 
      END SELECT 
      RETURN  
      END SUBROUTINE FRMA13 