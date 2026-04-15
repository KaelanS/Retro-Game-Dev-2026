;;;; Choose out of 4 directions, UDLR.
    TXA 
    STA tempA
    JSR doGetRandomNumber
    
    ;; CHANGE: Mask for 4 values (0-3) instead of 8 (0-7)
    AND #%00000011 
    
    TAY
    LDA DirectionTable,y
    STA tempB
    LDA FacingTable,y
    STA tempC
    StartMoving tempA, tempB, #$00
    ChangeFacingDirection tempA, tempC