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
and clear the value to disable it. Level UberASM to do this can be found in `stickyspriteslevel.asm`.

## Info:
* FreeRAM Needed: 1 byte
* Default FreeRAM Address: `$1864`
* SA-1 Compatible

## Usage:

0. Back up your ROM! Always create a backup before applying any patch. It is also 
   highly recommend to use Lunar Helper, which allows for safe unpatching/repatching
   in case something goes wrong.
1. Set `!AlwaysEnabled` to `1` if you would like sticky keys mechanics to apply to all
   levels. Note: If this is set, behavior cannot be overridden.
2. If needed, change `!FreeRAM` to a different address. You should only need to do
   this if another patch you are using already uses the default provided address.
3. Apply this patch with ASAR.

UberASM that will enable Sticky Sprites for a level is provided with `stickyspriteslevel.asm`. This is only useful if `!AlwaysEnabled` is `0`.

### Advanced:

Sticky Sprites will be enabled when any non-zero value is stored in `!FreeRAM`. You can modify this value from your code to dynamically enable/disable it.
