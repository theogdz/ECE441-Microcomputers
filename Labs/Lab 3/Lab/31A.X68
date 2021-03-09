*-----------------------------------------------------------
* Title      : 3.1A
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $2000
START:                  ; first instruction of program
    MOVE.W  D0,A1		
    MOVE.W  D1,(A1)+	
    BRA     $2000		

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
