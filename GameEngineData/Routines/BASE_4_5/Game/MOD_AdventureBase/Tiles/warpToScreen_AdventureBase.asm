CPX player1_object
    BNE +notPlayerForWarpTile

    ;; === SMART RESET ===
    ;; We clear the trigger for the room we are LEAVING,
    ;; UNLESS that room is a Key Room (Type 1).
    
    LDA screenType
    AND #%11111110        ;; Isolate the Room Type
    CMP #$01              ;; Is it an NPC Room?
    BEQ +skipReset        ;; If yes, don't clear it! We want the NPC to stay triggered.

        ;; For all other rooms (Puzzles/Monsters):
        LDX camScreen
        LDA screenTriggers,x
        AND #%11111110    ;; Flip the "Triggered" bit to OFF
        STA screenTriggers,x

    +skipReset:
    
    WarpToScreen warpToMap, warpToScreen, #$01
+notPlayerForWarpTile: