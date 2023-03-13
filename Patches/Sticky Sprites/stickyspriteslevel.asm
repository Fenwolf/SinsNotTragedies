; Simple example UberASM to enable Sticky Sprites that could be for a level or GM14

; If you changed !FreeRAM in StickySprites.asm, make sure to change this too
!FreeRAM = $1864

if !FreeRAM >= $0100
	!FreeRAMRemapped = !FreeRAM|!addr
else
	!FreeRAMRemapped = !FreeRAM
endif

init:
	lda #$01
	sta !FreeRAMRemapped
	rtl
