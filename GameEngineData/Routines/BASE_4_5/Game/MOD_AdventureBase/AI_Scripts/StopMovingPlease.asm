;;; Safe Stop: Stops movement without despawning the enemy.
    TXA
    STA tempA
    
    ;; 1. Clear movement intent (High Nibble) 
    ;; Preserve ONLY the facing direction (Low 3 bits: 0-7)
    LDA Object_direction,x
    AND #%00000111 
    STA Object_direction,x

    ;; 2. Kill the speed variables.
    ;; This stops the "drifting" towards the player.
    LDA #$00
    STA Object_h_speed_lo,x
    STA Object_h_speed_hi,x
    STA Object_v_speed_lo,x
    STA Object_v_speed_hi,x