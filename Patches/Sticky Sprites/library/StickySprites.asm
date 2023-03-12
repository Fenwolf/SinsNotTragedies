; Optional UberASM library for turning on/off Sticky Sprites.
; If you changed !FreeRAM in the main patch, make sure to change
; it here too.
;
; Usage:
;
; To enable Sticky Sprites, add the following to your UberASM code:
;     jsl StickySprites_Enable
; To disable:
;     jsl StickySprites_Disable

; Must match main StickySprites.asm value
!FreeRAM = $1864


if !FreeRAM >= $0100
	!FreeRAMRemapped = !FreeRAM|!addr
else
	!FreeRAMRemapped = !FreeRAM
endif

Enable:
    lda #$01
    sta !FreeRAMRemapped
    rtl

Disable:
    stz !FreeRAMRemapped
    rtl