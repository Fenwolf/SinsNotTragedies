# Sticky Sprites
### Written/designed by binavik, co-written/SA-1 support by Fén
Please credit if used

<br/>

This patch allows you to enable "Sticky Sprites" on certain levels or all levels.
"Sticky Sprites" means that once the player is holding a sprite (key, throw block,
koopa shell, etc.), they will not be able to let go until and unless something
destroys the sprite, the sprite becomes uncarryable (eg galoombas), or Mario dies.

This is similar to Darolac's Sticky Hands UberASM. However, when using that patch,
once the player is holding an item, they cannot walk. This patch addresses that
potential drawback, however it is slightly more involved to use. This patch also
allows for writing code to change whether Sticky Sprites is enabled dynamically
within a level. Simply set the FreeRAM value to a nonzero value to enable it,
and clear the value to disable it. Level UberASM to enable it can be found in `stickyspriteslevel.asm`.

## Usage:

0. Back up your ROM! Always create a backup before applying any patch. It is also 
   highly recommend to use Lunar Helper, which allows for safe unpatching/repatching
   in case something goes wrong.
1. Set `!AlwaysEnabled` to `1` if you would like Sticky Sprites to apply to all
   levels. Note: If this is set, behavior cannot be overridden.
2. Apply `StickySprites.asm` with ASAR.
3. To enable Sticky Sprites for a level, you can use the provided level UberASM: `stickyspriteslevel.asm`. This does not apply if `!AlwaysEnabled` is `1`.

### Advanced:

Sticky Sprites will be enabled when any non-zero value is stored in `!FreeRAM`. You can modify this value from your code to dynamically enable/disable it.

If using this with another patch, it's possible the FreeRAM address used by Sticky Sprites conflicts with the FreeRAM used by other patches.
If needed, change `!FreeRAM` to a different address. Ideally, use an address that is cleared on level load. If it isn't, you will need to clear it manually
for levels that should not have it enabled. This value must be changed both in the main patch and any UberASM that uses it.

## Info:
* FreeRAM Needed: 1 byte
* Default FreeRAM Address: `$1864`
* SA-1 Compatible
