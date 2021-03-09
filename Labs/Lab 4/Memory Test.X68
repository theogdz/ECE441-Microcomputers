*-----------------------------------------------------------
* Title      : Memory Test
* Written by : Theo Guidroz
* Date       : 02/26/2020
* Description: 
*-----------------------------------------------------------
    ORG    $800

MSGPASS     DC.B    'MEMORY TEST PASSES!'  
ENDPASS     DS.B    1

MSGFAIL     DC.B    'Location of memory failure: '          
ENDFAIL     DS.B    1    

READ        DC.B    ' Value that was read: '
READEND     DS.B    1

WRITE       DC.B    ' Value that was written: '
WRITEEND    DS.B    1     

    ORG    $1000

START:                  ; first instruction of program

    LEA $8B800, A3      ; First address of 2 KB RAM
    MOVE.L A3,D1        ; Move first address to D0
    LEA $8BFFF, A4      ; Last address of 2 KB RAM

MEM_START:
    MOVE.B #$AA,(A3)+   ; Write $AA to the contents of (A3)
    CMPA.L A3,A4        ; See if the two addresses are equal
    BEQ MEM_NEXT        ; If they're equal, go to MEM_NEXT to restore original address
    BRA MEM_START       ; Otherwise go back to MEM_START
    
MEM_NEXT:
    MOVE.L D0,A3        ; Restore original address

MEM_READ:    
    CMP.B #$AA,(A3)     ; See if value is $AA
    BEQ MEM_WRITE       ; If so, write to memory
    BRA MEM_READ_FAIL_AA ; If not, error
    
MEM_WRITE:
    MOVE.B #$55,(A3)+   ; Write $55 to memory
    CMPA.L A3,A4        ; Make sure we haven't reached our last address
    BEQ MEM_RESTORE     ; If so, we need to move on to next step
    BRA MEM_READ        ; Otherwise keep reading/writing
    
MEM_READ_FAIL_AA
    LEA MSGFAIL,A5      ; Load error message
    LEA ENDFAIL,A6      ; See above
    MOVE.B #243,D7      ; Print string command
    TRAP #14            ; TRAP handler
    MOVE.L  #$2000,A5   ; Load output buffer
    MOVE.L  #$2004,A6   ; See above
    MOVE.L A3,D0        ; Move 6-digit hex address to D0 to be converted
    MOVE.B #231,D7      ; Convert 6-digit hex address in D0 to ASCII
    TRAP #14            ; TRAP handler
    MOVE.B #243,D7      ; Output string
    TRAP #14            ; TRAP handler
    
    LEA WRITE,A5        ; Load value written message
    LEA WRITEEND,A6     ; See above
    MOVE.B #243,D7      ; Print string command
    TRAP #14            ; TRAP handler
    MOVE.L  #$2000,A5   ; Load output buffer
    MOVE.L  #$2002,A6   ; See above
    MOVE.L #$55,D0      ; Move 2-digit hex num to D0 to be converted
    MOVE.B #233,D7      ; Convert 2-digit hex num in D0 to ASCII
    TRAP #14            ; TRAP handler
    MOVE.B #243,D7      ; Output string
    TRAP #14            ; TRAP handler
    
    LEA READ,A5         ; Load read value message
    LEA READEND,A6      ; See above
    MOVE.B #243,D7      ; Print string command
    TRAP #14            ; TRAP handler
    MOVE.L  #$2000,A5   ; Load output buffer
    MOVE.L  #$2002,A6   ; See above
    MOVE.L (A3),D0      ; Move 2-digit hex num to D0 to be converted
    MOVE.B #233,D7      ; Convert 2-digit hex num in D0 to ASCII
    TRAP #14            ; TRAP handler
    MOVE.B #243,D7      ; Output string
    TRAP #14            ; TRAP handler
    
    BRA EXIT
    
MEM_RESTORE:
    MOVE.L D1,A3        ; Restore our original address to A3
    
MEM_READ_2:
    CMP.B #$55,(A3)     ; See if value is %55
    BEQ MEM_WRITE_2     ; If so, write to memory
    BRA MEM_READ_FAIL_55 ; If not, error
    
MEM_WRITE_2:
    MOVE.B #$AA,(A3)+   ; Write $AA to memory
    CMPA.L A3,A4        ; Make sure we haven't reached our last address
    BEQ MEM_END         ; If so, branch to end to print success message
    BRA MEM_READ_2      ; Otherwise, keeping reading/writing
    
MEM_READ_FAIL_55
    LEA MSGFAIL,A5      ; Load error message
    LEA ENDFAIL,A6      ; See above
    MOVE.B #243,D7      ; Print string command
    TRAP #14            ; TRAP handler
    MOVE.L  #$2000,A5   ; Load output buffer
    MOVE.L  #$2004,A6   ; See above
    MOVE.L A3,D0        ; Move 6-digit hex address to D0 to be converted
    MOVE.B #231,D7      ; Convert 6-digit hex address in D0 to ASCII
    TRAP #14            ; TRAP handler
    MOVE.B #243,D7      ; Output string
    TRAP #14            ; TRAP handler
    
    LEA WRITE,A5        ; Load value written message
    LEA WRITEEND,A6     ; See above
    MOVE.B #243,D7      ; Print string command
    TRAP #14            ; TRAP handler
    MOVE.L  #$2000,A5   ; Load output buffer
    MOVE.L  #$2002,A6   ; See above
    MOVE.L #$AA,D0      ; Move 2-digit hex num to D0 to be converted
    MOVE.B #233,D7      ; Convert 2-digit hex num in D0 to ASCII
    TRAP #14            ; TRAP handler
    MOVE.B #243,D7      ; Output string
    TRAP #14            ; TRAP handler
    
    LEA READ,A5         ; Load read value message
    LEA READEND,A6      ; See above
    MOVE.B #243,D7      ; Print string command
    TRAP #14            ; TRAP handler
    MOVE.L  #$2000,A5   ; Load output buffer
    MOVE.L  #$2002,A6   ; See above
    MOVE.L (A3),D0      ; Move 2-digit hex num to D0 to be converted
    MOVE.B #233,D7      ; Convert 2-digit hex num in D0 to ASCII
    TRAP #14            ; TRAP handler
    MOVE.B #243,D7      ; Output string
    TRAP #14            ; TRAP handler
    
    BRA EXIT

    
MEM_END:
    LEA MSGPASS,A5      ; Load success message
    LEA ENDPASS,A6      ; See above
    MOVE.B #243,D7      ; Print string command
    TRAP #14            ; TRAP handler

EXIT:
    MOVE.B #228,D7      ; Go back to TUTOR
    TRAP #14
    

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
