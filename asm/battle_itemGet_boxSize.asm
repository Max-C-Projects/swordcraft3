; **********************
; * battle_itemGet.asm *
; *      by teod       *
; **********************

; ---------
; changelog
; ---------
; 22-01-23
;   * initial implementation
;   * patch specific variables
;     within code

; ----------
; adjustment
; ----------
; adjust the window placement and size here

@WindowX equ (7-1)
@WindowY equ 4
@Width   equ (16+2)
@Height  equ 12

@ItemY   equ (@WindowY+3)
@ItemTextX equ (@WindowX+3)
@ItemIconX equ (@WindowX+1)

@TitleY  equ (@WindowY+1)
@TitleX  equ 11

; ------------
; patched code
; ------------
; some notes on how to find these variables
; * I first tried to find where the code could be...
; * There are 3 parts to adjust: window, title, and icons
; * My first lead (and best lead) was to see which script
;   code was running. In this case it was 0x0101
;
; * The script code can be found at 0x30065BE (half)
;   (other script variables can be found nearby)
; * The function table is at 0x8B716B4...
;   (it's a bunch of function pointers)
; * Specificially, code 0101 is sub_802B95C
;
; * In sub_802B95C, you will see state variables for
;   the switch statements, you can break on those to
;   see what state it is while running the game
; * Once the game displays the graphics, you can
;   narrow your scope by seeing what state it is...
;
; * Patching is not easy... Having a debugger is
;   necessary (ie mGBA)
; * There will be a lot of red herrings...
;
; * some functions interesting functions:
;   - mapFill_801BD70 (part of main loop)
;   - items_805D7C0 (the menu we're patching)
;   - itemIcons_805FB50 (lookups "CG4" tile data)

; window
.org 0x805D876
mov r0, @WindowX
strb r0, [r1,2]
mov r0, @WindowY
strb r0, [r1,3]
mov r0, @Width
strb r0, [r1,4]
mov r0, @Height
strb r0, [r1,5]

; title y (item get string)
.org 0x805D8E2
mov r1, @TitleY

; title x
.org 0x805D8F6
mov r3, @TitleX

; text/icon y
.org 0x805D900
mov r1, @ItemY
lsl r1, 16

; text x
.org 0x805D9AA
mov r3, @ItemTextX

; icon x
.org 0x805D9BC
mov r0, @ItemIconX


