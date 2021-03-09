*-----------------------------------------------------------
* Title      : 3.2A
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $950
START:                  ; first instruction of program
    MOVE.L #$2000,A5
    MOVE.L #$201A,A6
    MOVE.B #227,D7
    TRAP #14
    MOVE.B #228,D7
    TRAP #14

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
