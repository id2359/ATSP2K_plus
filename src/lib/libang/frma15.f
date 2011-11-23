*
*     -----------------------------------------------------------------
*      F R M A 1 5
*     -----------------------------------------------------------------
*
*      JT7 = 91 -- 95                                              *
*
      SUBROUTINE FRMA15(J1,J2,ISKA,IVAR)
      DIMENSION IS91A(52),IS91B(32),IS92(90),IS93A(81),IS93B(14),
     :IS94(97),IS95A(36),IS95B(15),IS95C(42)
*
      DATA IS91A/1513512,-448448,6*0,-238875,0,-336960,185625,3*0,
     :19600,2*0,140400,5*0,432432,-2050048,27500,184800,8*0,-898560,
     :168480,4*0,573750,345600,4*0,1262250,2*0,902880/
      DATA IS91B/-9555,-19656,-9984,7425,8*0,1100,5*0,-52416,0,-26624,
     :7*0,22950,2*0,50490/
*
      DATA IS92/-1911,-70070,-29952,1485,11466,3*0,-1960,2*0,-14040,
     :5*0,160160,220,2*0,72072,3*0,-18480,2*0,-79872,0,30576,-16848,
     :2*0,4590,2*0,-34560,2*0,10098,3*0,-90288,3*0,-14014,-980,4*0,
     :5733,0,-37440,-4455,0,18018,0,-7020,4*0,-660,2*0,-9240,4*0,
     :-99840,2*0,48048,-8424,3*0,-13770,-17280,0,-30294,3*0,-45144/
*
      DATA IS93A/46883200,4688320,4*0,252700448,2*0,545468000,
     :363737088,101200000,0,95208960,360008880,991760,8419840,
     :31837520,1275120,5*0,261824640,-99742720,2*0,48576000,2*0,
     :-377152160,0,24628032,0,-30942912,-136401408,-117002886,
     :10005138,-8051472,421498000,253890560,78200000,960023680,
     :-4623840,-17065620,-333826416,-61934400,-14709420,-30457152,
     :-115166106,-33312510,3*0,-53555040,53555040,3*0,-139243104,0,
     :404152320,-300564000,0,25718784,0,-4736160,22952160,40538880,
     :2*0,-144270720,2*0,56105280,12022560,3*0,-151557120/
      DATA IS93B/-1083264,1954953,0,23108085,-159120,-26086500,
     :-16040640,-1242945,20660508,0,2499255,39395664,1924263,
     :-35278155/
*
      DATA IS94/-9172800,-917280,4*0,25225200,2*0,-4268880,0,
     :1552320,0,-912764160,28523880,-871045560,1029600000,-32175000,
     :42162120,5*0,879215040,19514880,2*0,-319714560,2*0,-609840,
     :-82938240,28591200,0,-522007200,0,16312725,-505957023,266223672,
     :-267193080,36495360,97161120,-1140480,-34473771,1491291,
     :92565000,-33660000,486370170,-16552800,517275,-788637465,3*0,
     :-57047760,-68431440,3*0,8408400,2*0,-1422960,3*0,64350000,
     :243942160,-131648000,0,-473088000,293071680,48322560,0,1219680,
     :468386160,4*0,392071680,2*0,-32625450,0,1316263,-4641,-89064360,
     :2280960,472826970,30855000,1200629760,4913,-969,-1034550,
     :-6828030/
*
      DATA IS95A/-5197920,-519792,4*0,14294280,2*0,-2419032,0,879648,
     :0,2638944,-82467,27489,5834400,-182325,-12758823,5*0,-592416,
     :11058432,2*0,215424,2*0,-345576,-5376756,-549780,0,7001280/
      DATA IS95B/-71289075,1445742441,328653,303478560,13115520,
     :-110355840,-409860,-6323580,-1867563,946220000,-344080000,
     :-360380790,-9196,159952925,-16656255/
      DATA IS95C/11852757,-1316973,3*0,342412980,2*0,-57946812,3*0,
     :26205075,33175177,35071850,0,301022400,-14191056,1967826432,0,
     :49668696,-75685632,4*0,220985856,2*0,31446090,0,-8994258,
     :134424576,22311072,180792,726986394,69564000,-42294912,
     :899694774,241746120,-70556310,311730606/
*
      IF(J1.EQ.91) THEN
        IF(J2.LT.137) RETURN
        IF(J2.LT.189) THEN
          I2=J2-136
          ISKA=IS91A(I2)
          IVAR=8316
        ELSEIF(J2.LT.231) THEN
          IF(J2.LT.199) RETURN
          I2=J2-198
          ISKA=IS91B(I2)
          IVAR=308
        ENDIF
      ELSEIF(J1.EQ.92) THEN
        IF(J2.LT.145) RETURN
        IF(J2.GT.234) RETURN
        I2=J2-144
        ISKA=IS92(I2)
        IVAR=924
      ELSEIF(J1.EQ.93) THEN
        IF(J2.LT.139) RETURN
        IF(J2.LT.220) THEN
          I2=J2-138
          ISKA=IS93A(I2)
          IVAR=7480704
        ELSEIF(J2.LT.236) THEN
          IF(J2.LT.222) RETURN
          I2=J2-221
          ISKA=IS93B(I2)
          IVAR=840224
        ENDIF
      ELSEIF(J1.EQ.94) THEN
        IF(J2.LT.139) RETURN
        IF(J2.GT.235) RETURN
        I2=J2-138
        ISKA=IS94(I2)
          IF(I2.EQ.45) THEN
            IVAR=389620
          ELSEIF(I2.EQ.46) THEN
            IVAR=283360
          ELSEIF(I2.EQ.87) THEN
            IVAR=54560
          ELSEIF(I2.EQ.88) THEN
            IVAR=310
          ELSEIF(I2.EQ.94) THEN
            IVAR=34720
          ELSEIF(I2.EQ.95) THEN
            IVAR=62
          ELSE
            IVAR=12196800
          ENDIF
      ELSEIF(J1.EQ.95) THEN
        IF(J2.LT.139) RETURN
        IF(J2.LT.175) THEN
          I2=J2-138
          ISKA=IS95A(I2)
          IVAR=203280
        ELSEIF(J2.LT.191) THEN
          IF(J2.LT.176) RETURN
          I2=J2-175
          ISKA=IS95B(I2)
          IF(I2.EQ.3) THEN
            IVAR=1925
          ELSEIF(I2.EQ.9) THEN
            IVAR=35420
          ELSEIF(I2.EQ.13) THEN
            IVAR=119
          ELSE
            IVAR=66235400
          ENDIF
        ELSEIF(J2.LT.236) THEN
          IF(J2.LT.194) RETURN
          I2=J2-193
          ISKA=IS95C(I2)
          IVAR=14608440
        ENDIF
      ENDIF
      RETURN
      END