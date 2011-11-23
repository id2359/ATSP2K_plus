*
*     -----------------------------------------------------------------
*      F R M A 1 1
*     -----------------------------------------------------------------
*
*      JT7 = 70 -- 74                                              *
*
      SUBROUTINE FRMA11(J1,J2,ISKA)
      DIMENSION IS70A(36),IS70B(24),IS71A(28),IS71B(22),IS72A(44),
     :IS72B(24),IS73A(40),IS73B(25),IS74A(42),IS74B(36)
*
      DATA IS70A/85822880,-306408960,4*0,-127670400,188559360,21053340,
     :0,16541910,49625730,0,-58648590,-31580010,9*0,384975360,
     :-92162070,-7089390,7089390,-6695535,31329375,2*0,13367200,
     :90228600,58949352,-10225908/
      DATA IS70B/-54614560,81244800,4726260,117297180,1288980,
     :-27888840,4*0,184324140,-14178780,66167640,6*0,-8506400,
     :-180457200,12603360,26334000,-36435420/
      DATA IS71A/-5626500,0,5800410,-10526670,0,2285010,3819510,10*0,
     :-3590730,-3713490,276210,-3507185,16410625,3*0,-3515400,2755032,
     :44268/
      DATA IS71B/4603500,507780,-7366220,-1623160,4*0,-797940,61380,
     :2577960,7*0,-781200,4419360,-6935760,2120580/
      DATA IS72A/1426194,-422576,2*0,-435600,165000,2*0,73500,0,270000,
     :643500,3*0,-254800,2*0,-35280,2*0,137214,-650496,92400,-270270,
     :1281280,539000,166320,8*0,-458640,-611520,4*0,-735000,499800/
      DATA IS72B/-686070,-348480,178200,79380,425250,216000,694980,8*0,
     :582120,5*0,-722358,0,-366912/
      DATA IS73A/121680,3569280,2*0,-9937200,0,5840640,-10893168,3*0,
     :7338240,2*0,4769856,2*0,15331680,638820,7027020,7783776,324324,
     :2483712,333564,8*0,2293200,-19110000,4*0,-3386880,-14394240/
      DATA IS73B/-340704,1521,-1189760,3312400,-16353792,73008,3631056,
     :6*0,6621615,-214032,-827904,-5493488,4*0,-6420960,0,28665,
     :18571735/
      DATA IS74A/-232320,7920,88935,0,3528,-396165,144000,30888,-55125,
     :3*0,152880,2*0,21168,2*0,304920,2*0,-600600,25872,0,137214,
     :-270270,0,-55440,0,-99792,2*0,-244608,0,93639,366912,2*0,-35280,
     :2*0,-299880/
      DATA IS74B/-79233,76440,2*0,-290400,-23760,-10584,0,180000,
     :-92664,139755,-86625,0,10584,4*0,-77616,0,-27720,-49896,4*0,
     :-305760,2*0,147147,183456,3*0,105840,-149940/
*
      IF(J1.EQ.70) THEN
        IF(J2.LT.143) RETURN
        IF(J2.LT.179) THEN
          I2=J2-142
          ISKA=IS70A(I2)
        ELSEIF(J2.EQ.194) THEN
          ISKA=-33083820
        ELSEIF(J2.EQ.195) THEN
          ISKA=33083820
        ELSEIF(J2.LT.227) THEN
          IF(J2.LT.203) RETURN
          I2=J2-202
          ISKA=IS70B(I2)
        ENDIF
      ELSEIF(J1.EQ.71) THEN
        IF(J2.LT.151) RETURN
        IF(J2.LT.179) THEN
          I2=J2-150
          ISKA=IS71A(I2)
        ELSEIF(J2.EQ.194) THEN
          ISKA=1288980
        ELSEIF(J2.EQ.195) THEN
          ISKA=-1288980
        ELSEIF(J2.LT.227) THEN
          IF(J2.LT.205) RETURN
          I2=J2-204
          ISKA=IS71B(I2)
        ENDIF
      ELSEIF(J1.EQ.72) THEN
        IF(J2.LT.137) RETURN
        IF(J2.LT.181) THEN
          I2=J2-136
          ISKA=IS72A(I2)
        ELSEIF(J2.LT.220) THEN
          IF(J2.LT.196) RETURN
          I2=J2-195
          ISKA=IS72B(I2)
        ELSEIF(J2.EQ.227) THEN
          ISKA=-793800
        ENDIF
      ELSEIF(J1.EQ.73) THEN
        IF(J2.LT.141) RETURN
        IF(J2.LT.181) THEN
          I2=J2-140
          ISKA=IS73A(I2)
        ELSEIF(J2.LT.221) THEN
          IF(J2.LT.196) RETURN
          I2=J2-195
          ISKA=IS73B(I2)
        ELSEIF(J2.EQ.227) THEN
          ISKA=1128960
        ENDIF
      ELSEIF(J1.EQ.74) THEN
        IF(J2.LT.141) RETURN
        IF(J2.LT.183) THEN
          I2=J2-140
          ISKA=IS74A(I2)
        ELSEIF(J2.LT.229) THEN
          IF(J2.LT.193) RETURN
          I2=J2-192
          ISKA=IS74B(I2)
        ENDIF
      ENDIF
      RETURN
      END