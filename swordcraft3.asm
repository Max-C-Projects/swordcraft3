.gba
.open "swordcraft3.gba","swordcraft3-test.gba",0x08000000

; Patches to enable ASCII and the VWF.
.include "asm/vwf_font.asm"
.include "asm/vwf_main.asm"
.include "asm/vwf_sprites.asm"
.include "asm/vwf_dialog.asm"
.include "asm/vwf_extend_sprite_tables.asm"
.include "asm/vwf_sprite_renderer.asm"

; Reduces the size of scripts so we don't have to worry about space much.
.include "asm/script_expr.asm"

; Allow using the debug menu features.
.include "asm/debug_menu.asm"

; Text output; fixing SJIS to ASCII, text centering
.include "asm/prompt_itemObtained.asm"
.include "asm/prompt_moneyObtained.asm"

; Menus; GFX/Text position and box size
.include "asm/craft_boxSize.asm"
.include "asm/start_magic.asm"
.include "asm/shop_removeCounter.asm"
.include "asm/saving.asm"
.include "asm/battle_itemGet_boxSize.asm"

; Logic checks
.include "asm/name_portraitCheck.asm"

; Name Input
.include "asm/name_input.asm"
.include "asm/sjis2ascii.asm"

; Modify location string format
.include "asm/saving_location.asm"

.close
