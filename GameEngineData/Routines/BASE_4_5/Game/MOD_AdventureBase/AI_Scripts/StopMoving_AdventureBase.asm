;;; Full stop: Clears movement bits and physics velocity.
    TXA
    STA tempA
    
    ;; 1. Clear the movement/intent bits (High Nibble) 
    ;; while keeping the facing direction (Low Nibble).
    LDA Object_direction,x
    AND #%00000111 ;; Using 0111 ensures ONLY facing is kept.
    STA Object_direction,x

    ;; 2. Zero out the actual physics speed in RAM.
    ;; This stops the "sliding" toward the player.
    LDA #$00
    STA Object_h_speed_lo,x
    STA Object_h_speed_hi,x
    STA Object_v_speed_lo,x
    STA Object_v_speed_hi,x

    ;; 3. Clear the movement bits in the status byte 
    ;; This is often what prevents the "homing" behavior.
    LDA Object_status,x
    AND #%11111100 ;; Clears the bottom bits usually reserved for movement status
    STA Object_status,x