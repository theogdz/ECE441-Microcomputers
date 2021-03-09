*-----------------------------------------------------------
* Title      : 3.1D
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $2000
START:                  ; first instruction of program

* Put program code here
    ANDI.W  #$0700,SR
    BRA     $2000  	

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
