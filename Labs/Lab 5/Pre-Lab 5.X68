*-----------------------------------------------------------
* Title      : Interrupt Service Routine
* Written by : Theo Gudiroz
* Date       : 03/11/2020
* Description: Read data from DIP switch, write data to two 7-segment displays
*-----------------------------------------------------------
    ORG    $900
    
START:                 ; first instruction of program
    MOVEA.L #$6E000,A1      ;initialize the address
    MOVE.B (A1),D0          ;Read the value
    MOVE.L  #$1,D1          ;Initialize min
    MOVE.L  #$99,D2         ;Initialize max
    MOVE.W  #0,D3           ;Initialize delay
    MOVE.W  #$FFFF,D4       ;Initialize delay max
    
CHECK:
    CMP.B   D2,D0           ;Is counter max?
    BEQ     DONE            ;If yes, branch to done
    MOVE.B  D0,$6E000       ;Write to LED
    
WAIT:
    ADDI.W  #1,D3           ;Increment counter
    CMP.W   D3,D4           ;Is the delay done?
    BEQ     COUNT           ;If yes, branch to count
    BRA     WAIT            ;Else loop
    
COUNT:
    ABCD    D1,D0           ;Increment counter by 1
    MOVE.W  #0,D3           ;Reinitialize delay
    BRA     CHECK           ;Branch to check
    
DONE:
    MOVE.B  D0,$6E000       ;Write last value to LED
    MOVE.B  #228,D6         ;Exit to TUTOR
    
    END     START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
