# Sticky Sprites
### Written/designed by binavik, co-written/SA-1 support by Fén
Please credit if used

<br/>

This patch allows you to enable "sticky sprites" on certain levels or all levels.
"Sticky sprites" means that once the player is holding a sprite (key, throw block,
koopa shell, etc.), they will not be able to let go until and unless something
destroys the sprite, the sprite becomes uncarryable (eg galoombas), or Mario dies.

This is similar to Darolac's Sticky Hands UberASM. However, when using that patch,
once the player is holding an item, they cannot walk. This patch addresses that
potential drawback, however it is slightly more involved to use. This patch also
allows for writing code to change whether Sticky Sprites is enabled dynamically
within a level. Simply set the FreeRAM value to a nonzero value to enable it,
and clear the value to disable it.

Info:
* FreeRAM Needed: 1 byte
* Default FreeRAM Address: $1864
* SA-1 Compatible

Usage:

0. Back up your ROM! Always create a backup before applying any patch. I also highly
   recommend using Lunar Helper, which allows for safe unpatching/repatching in case
   something goes wrong.
1. Set !AlwaysEnabled to 1 if you would like sticky keys mechanics to apply to all
   levels. Note: If this is set, behavior cannot be overridden.
2. If needed, change !FreeRAM to a different address. You should only need to do
   this if another patch you are using already uses the default provided address.
3. Apply this patch with ASAR.
4. If !AlwaysEnabled is 0, enable it in a level by setting the !FreeRAM address:
   - Option 1 - Copy library\StickySprites.asm into UberASM's library folder. To 
                enable, call `jsl StickySprites_Enable`. To disable, call 
                `jsl StickySprites_Disable` (only needed if it has been enabled).
   - Option 2 - Set the !FreeRAM address to a nonzero value in your level code where
                you want to enable it.
