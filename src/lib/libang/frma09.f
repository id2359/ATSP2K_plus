*
*     -----------------------------------------------------------------
*      F R M A 0 9
*     -----------------------------------------------------------------
*
*      JT7 = 57 -- 62                                              *
*
      SUBROUTINE FRMA09(J1,J2,ISKA)
      DIMENSION IS57A(30),IS57B(22),IS58A(34),IS58B(21),IS59A(34),
     :IS59B(22),IS60A(32),IS60B(22),IS61A(7),IS61B(4),IS61C(22)
*
      DATA IS57A/61440,8910,-23520,0,8085,-120050,-126720,351,48510,
     :3*0,-56056,2*0,116424,2*0,-151200,2*0,-123200,-14014,0,-68040,
     :-55440,0,-33264,0,-96096/
      DATA IS57B/-24010,-28028,2*0,76800,-26730,-24255,0,-158400,-1053,
     :-36960,76230,0,58212,4*0,42042,0,-16632,-48048/
      DATA IS58A/49172480,4917248,-94873680,825000,0,9408000,4312000,0,
     :-45999360,-2516800,0,-28700672,-12841920,-16480464,16816800,
     :10986976,-10564400,10780000,-14126112,0,-20497400,8723176,0,
     :25155900,4204200,-4904900,16397920,-20124720,47943168,-8901200,
     :7063056,5005000,30017988,-5618340/
      DATA IS58B/48432384,2*0,3294225,8019000,41912640,0,1597200,
     :-24463296,-13416480,-6504960,0,31046400,2*0,6621615,-21189168,
     :40864824,11409552,-25635456,14414400/
      DATA IS59A/131040,13104,0,2162160,0,-786240,-360360,2*0,1524600,
     :0,-554400,-116640,-3259872,101871,5489253,-288288,9009,3764475,
     :2*0,-2965248,2*0,831600,3244032,2*0,-302400,92664,-2573208,
     :-101376,1346400,2913120/
      DATA IS59B/-203742,1397550,2*0,720720,-120120,2*0,508200,2*0,
     :-1916640,-18018,2662,-2822204,3041280,3552384,277200,1537536,
     :-185328,202752,-1788864/
      DATA IS60A/-16170,3*0,-23760,-17820,0,13475,2*0,49005,-702,2*0,
     :-2548,2*0,5292,8*0,41580,33880,28028,-1512,0,-4368/
      DATA IS60B/-24255,11466,8*0,-15120,31185,0,-23814,6*0,6804,19656/
      DATA IS61A/-15840,0,-1701,11767,0,7371,-4761/
      DATA IS61B/8424,-72,5184,-19584/
      DATA IS61C/-378,-9450,9*0,12960,1638,5618,-5236,4*0,1872,1152,
     :-12096/
*
      IF(J1.EQ.57) THEN
        IF(J2.LT.141) RETURN
        IF(J2.LT.171) THEN
          I2=J2-140
          ISKA=IS57A(I2)
        ELSEIF(J2.LT.215) THEN
          IF(J2.LT.193) RETURN
          I2=J2-192
          ISKA=IS57B(I2)
        ENDIF
      ELSEIF(J1.EQ.58) THEN
        IF(J2.LT.139) RETURN
        IF(J2.LT.173) THEN
          I2=J2-138
          ISKA=IS58A(I2)
        ELSEIF(J2.LT.215) THEN
          IF(J2.LT.194) RETURN
          I2=J2-193
          ISKA=IS58B(I2)
        ENDIF
      ELSEIF(J1.EQ.59) THEN
        IF(J2.LT.139) RETURN
        IF(J2.LT.173) THEN
          I2=J2-138
          ISKA=IS59A(I2)
        ELSEIF(J2.LT.216) THEN
          IF(J2.LT.194) RETURN
          I2=J2-193
          ISKA=IS59B(I2)
        ENDIF
      ELSEIF(J1.EQ.60) THEN
        IF(J2.LT.139) RETURN
        IF(J2.LT.171) THEN
          I2=J2-138
          ISKA=IS60A(I2)
        ELSEIF(J2.LT.215) THEN
          IF(J2.LT.193) RETURN
          I2=J2-192
          ISKA=IS60B(I2)
        ENDIF
      ELSEIF(J1.EQ.61) THEN
        IF(J2.EQ.140) THEN
          ISKA=-16016
        ELSEIF(J2.LT.158) THEN
          IF(J2.LT.151) RETURN
          I2=J2-150
          ISKA=IS61A(I2)
        ELSEIF(J2.LT.172) THEN
          IF(J2.LT.168) RETURN
          I2=J2-167
          ISKA=IS61B(I2)
        ELSEIF(J2.LT.216) THEN
          IF(J2.LT.194) RETURN
          I2=J2-193
          ISKA=IS61C(I2)
        ENDIF
      ELSEIF(J1.EQ.62) THEN
        IF(J2.EQ.137) THEN
          ISKA=-294
        ELSEIF(J2.EQ.158) THEN
          ISKA=-126
        ELSEIF(J2.EQ.161) THEN
          ISKA=-462
        ELSEIF(J2.EQ.196) THEN
          ISKA=-70
        ELSEIF(J2.EQ.200) THEN
          ISKA=-126
        ELSEIF(J2.EQ.216) THEN
          ISKA=-112
        ELSEIF(J2.EQ.217) THEN
          ISKA=-182
        ENDIF
      ENDIF
      RETURN
      END
