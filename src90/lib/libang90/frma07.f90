!
!     -----------------------------------------------------------------
!      F R M A 0 7
!     -----------------------------------------------------------------
!
!      JT7 = 40 -- 46                                              *
!
      SUBROUTINE FRMA07(J1, J2, ISKA, IVAR) 
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
      INTEGER , DIMENSION(11) :: IS40A 
      INTEGER , DIMENSION(45) :: IS40B 
      INTEGER , DIMENSION(11) :: IS41A 
      INTEGER , DIMENSION(45) :: IS41B 
      INTEGER , DIMENSION(10) :: IS42A 
      INTEGER , DIMENSION(26) :: IS42B 
      INTEGER , DIMENSION(7) :: IS43A 
      INTEGER , DIMENSION(31) :: IS43B 
      INTEGER , DIMENSION(7) :: IS44A 
      INTEGER , DIMENSION(27) :: IS44B 
      INTEGER , DIMENSION(22) :: IS45 
      INTEGER , DIMENSION(20) :: IS46 
      INTEGER :: I2 
!-----------------------------------------------
!
      DATA IS40A/ -582400, -260000, -95040, 0, 450450, 479160, 0, 618800, &
         276250, -42075, 799425/  
      DATA IS40B/ -206668800, 186531840, -25833600, 6624000, 4*0, -124001280, &
         189876960, 102241440, 4*0, 552552000, -940431360, 566720, 0, 6906900, &
         -33396000, 2*0, -867790, -66385935, 30682575, 219585600, -203320000, &
         27448200, 311333750, -121046562, 25316928, 82579200, 587769600, &
         2932500, -900022200, 125685000, -131947200, -1569004800, -55717500, &
         73570560, -299956800, 459308850, -643032390, 638197560/  
      DATA IS41A/ -154700, 44200, -100980, 2*0, -67320, 0, -145600, 41600, &
         299475, 47025/  
      DATA IS41B/ 233309700, -210576960, 0, -58626540, 4*0, -248863680, &
         -31107960, 150753960, 5*0, -140384640, -655128320, 2*0, -39084360, 2*0&
         , -81891040, 265543740, 149557500, 219585600, 1594028800, 0, 199253600&
         , 17566848, 1162512, 624505200, -59505600, 173867925, -7438200, &
         -12414600, 689356800, 98062800, 27301575, 694040640, -1199827200, &
         -149978400, -839879040, -638197560/  
      DATA IS42A/ -387504000, 43718400, 0, 207207000, -220413600, 2*0, &
         411723000, 19354500, -367735500/  
      DATA IS42B/ 186486300, -324609120, 2*0, 478170, -22128645, 10227525, 2*0&
         , -82344600, -171551250, -40348854, 8438976, 2*0, 28503900, 495930600&
         , 41895000, -43982400, 0, -541574100, 24523520, 0, -253088550, &
         -214344130, 212732520/  
      DATA IS43A/ 46410, -10200, 0, -123760, -55250, -72675, 62985/  
      DATA IS43B/ 125245120, 44042240, -28902720, 0, 1565564, 1564000, 2*0, &
         44257290, 11715165, -3050973, -96617664, -32205888, -12077208, &
         49315266, -8386950, -15787200, 313800960, -18458880, 11143500, &
         28265160, 35381880, 10232640, -271960832, -9657700, -58556160, &
         195971776, -300081782, -39369330, -58017960, 203339136/  
      DATA IS44A/ 15470, 3400, 2*0, -59670, 24225, -20995/  
      DATA IS44B/ 42270228, 15202080, 2*0, -24386670, 3905055, -1016991, 2*0, &
         36231624, -27173718, -2795650, -5262400, 2*0, 108314820, -15574680, &
         11793960, 3410880, 0, -93872844, -19518720, 0, 165351186, -13123110, &
         -19339320, 67779712/  
      DATA IS45/ -115079580, 127035900, 4*0, -645906976, 18997264, 2*0, &
         -147428505, 0, -310026240, 144109680, 0, -65189475, -1025952720, 2*0, &
         209969760, 947626680, 105905800/  
      DATA IS46/ 35302608, -11767536, 0, -1470942, -490314, -27919056, &
         -19612560, -73835520, -5460315, -9229440, 4320, 15988500, -64067696, &
         -17837029, 3448620, -207277840, -25909730, 6662502, 82117728, &
         132952512/  
!
      SELECT CASE (J1)  
      CASE (40)  
         IF (J2 < 126) RETURN  
         IF (J2 < 137) THEN 
            I2 = J2 - 125 
            ISKA = IS40A(I2) 
            IVAR = 4004 
         ELSE IF (J2 < 192) THEN 
            IF (J2 < 147) RETURN  
            I2 = J2 - 146 
            ISKA = IS40B(I2) 
            IVAR = 5525520 
         ENDIF 
      CASE (41)  
         IF (J2 < 126) RETURN  
         IF (J2 < 137) THEN 
            I2 = J2 - 125 
            ISKA = IS41A(I2) 
            IVAR = 1001 
         ELSE IF (J2 < 192) THEN 
            IF (J2 < 147) RETURN  
            I2 = J2 - 146 
            ISKA = IS41B(I2) 
            IVAR = 5870865 
         ENDIF 
      CASE (42)  
         IF (J2 < 127) RETURN  
         IVAR = 5525520 
         IF (J2 < 137) THEN 
            I2 = J2 - 126 
            ISKA = IS42A(I2) 
         ELSE IF (J2 == 149) THEN 
            ISKA = 77500800 
         ELSE IF (J2 == 150) THEN 
            ISKA = 64385280 
         ELSE IF (J2 == 156) THEN 
            ISKA = -104626080 
         ELSE IF (J2 == 157) THEN 
            ISKA = 34080480 
         ELSE IF (J2 < 192) THEN 
            IF (J2 < 166) RETURN  
            I2 = J2 - 165 
            ISKA = IS42B(I2) 
         ENDIF 
      CASE (43)  
         IF (J2 < 130) RETURN  
         IF (J2 < 137) THEN 
            I2 = J2 - 129 
            ISKA = IS43A(I2) 
            IVAR = 364 
         ELSE IF (J2 < 193) THEN 
            IF (J2 < 162) RETURN  
            I2 = J2 - 161 
            ISKA = IS43B(I2) 
            IVAR = 1105104 
         ENDIF 
      CASE (44)  
         IF (J2 < 130) RETURN  
         IF (J2 < 137) THEN 
            I2 = J2 - 129 
            ISKA = IS44A(I2) 
            IVAR = 364 
         ELSE IF (J2 < 193) THEN 
            IF (J2 < 166) RETURN  
            I2 = J2 - 165 
            ISKA = IS44B(I2) 
            IVAR = 1105104 
         ENDIF 
      CASE (45)  
         IF (J2 < 131) RETURN  
         IVAR = 6561555 
         IF (J2 == 131) THEN 
            ISKA = -931596600 
         ELSE IF (J2 == 135) THEN 
            ISKA = 900951975 
         ELSE IF (J2 == 136) THEN 
            ISKA = 398380125 
         ELSE IF (J2 == 167) THEN 
            ISKA = 152443080 
         ELSE IF (J2 < 193) THEN 
            IF (J2 < 171) RETURN  
            I2 = J2 - 170 
            ISKA = IS45(I2) 
         ENDIF 
      CASE (46)  
         IF (J2 < 133) RETURN  
         IVAR = 361284 
         IF (J2 == 133) THEN 
            ISKA = -137287920 
         ELSE IF (J2 == 134) THEN 
            ISKA = 39225120 
         ELSE IF (J2 == 135) THEN 
            ISKA = -55160325 
         ELSE IF (J2 == 136) THEN 
            ISKA = -180190395 
         ELSE IF (J2 < 193) THEN 
            IF (J2 < 173) RETURN  
            I2 = J2 - 172 
            ISKA = IS46(I2) 
         ENDIF 
      END SELECT 
      RETURN  
      END SUBROUTINE FRMA07 
