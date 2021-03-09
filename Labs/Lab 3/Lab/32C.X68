*-----------------------------------------------------------
* Title      : 3.2C
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $950
START:                  ; first instruction of program

    MOVE.L  #$2000,A5	; Move address $2000 to A5
    MOVE.L  #$201A,A6	; Move address $201A to A6
    MOVE.B  #227,D7     ; Syscall for printing a string to terminal
    TRAP    #14		    ; TRAP function
    MOVE.W  (SP)+,D0    ; Move SSW to D0
    MOVE.W  #232,D7     ; Syscall to convert 4 hex digits (word) to ASCII
    TRAP    #14         ; TRAP function
    MOVE.B  #$20,(A6)+  ; Hex for space character
    MOVE.L  (SP)+,D0    ; Move BA from SP to D0
    MOVE.W  #230,D7     ; Syscall to convert 8 hex digits (long) to ASCII
    TRAP    #14         ; TRAP function
    MOVE.B  #$20,(A6)+  ; Adding another space
    MOVE.W  (SP)+,D0    ; Move IR from SP to D0
    MOVE.W  #232,D7     ; Syscall to convert 4 hex digits (word) to ASCII
    TRAP    #14         ; TRAP function
    MOVE.W  #227,D7     ; Syscall to print registers
    TRAP    #14 		; Trap function
    MOVE.W  #228,D7     ; go to TUTOR
    TRAP    #14		    ; Trap function


* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
