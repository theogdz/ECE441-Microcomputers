*-----------------------------------------------------------
* Title      : 3.1F
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $2000
START:                  ; first instruction of program

* Put program code here
    CHK.W   D6,D7	
    BRA     $2002   	

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
