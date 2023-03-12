; Sticky Sprites
; Written/designed by binavik, co-written and SA-1 support by Fén
; Please credit if using this patch
;
; This patch allows you to enable "sticky sprites" on certain levels or all levels.
; "Sticky sprites" means that once the player is holding a sprite (key, throw block,
; koopa shell, etc.), they will not be able to let go until and unless something
; destroys the sprite, the sprite becomes uncarryable (eg galoombas), or Mario dies.

; Set to 1 to enable sticky sprites for all levels
!AlwaysEnabled = 0

; Set this address to a non-zero value in level UberASM to enable sticky sprites for that level.
; Note: Unused with !AlwaysEnabled = 1
!FreeRAM = $1864


if read1($00FFD5) == $23
	sa1rom
	!addr = $6000
else
	lorom
	!addr = $0000
endif

if !FreeRAM >= $0100
	!FreeRAMRemapped = !FreeRAM|!addr
else
	!FreeRAMRemapped = !FreeRAM
endif

org $01A01A
if !AlwaysEnabled == 0
    lda !FreeRAMRemapped
    beq +
endif
    jsr.w $A0B1
    rts : nop : nop : nop
+
