; Sticky Sprites
; Designed by binavik, implementation and SA-1 support by Fén
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
!FreeRAM = $7C


if read1($00FFD5) == $23
	sa1rom
	!addr = $6000
	!bank = $000000
	!9E = $3200
else
	lorom
	!addr = $0000
	!bank = $800000
	!9E = $9E
endif

if !FreeRAM >= $0100
	!FreeRAMRemapped = !FreeRAM|!addr
else
	!FreeRAMRemapped = !FreeRAM
endif

org $01A01A
	autoclean jml StickySpriteCarry

freecode

StickySpriteCarry:
	lda #$69
	sta $7E0DDD|!addr
if !AlwaysEnabled == 0
    lda !FreeRAMRemapped
    beq +
endif
    jml $01A0B1|!bank ; remove ability to release the held item by skipping carry-handling code
+
; Original goomba handling code
	lda !9E,x
	cmp #$0F
	bne +
	lda $72
	bne +
	ldy #$EC
+
jml $01A026|!bank ; back to vanilla carry code