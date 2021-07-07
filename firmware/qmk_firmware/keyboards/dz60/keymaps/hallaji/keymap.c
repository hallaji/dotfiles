#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
 /** Layout 0
  * +---------------------------------------------------------------------------------------------------------------------+
  * |   `~  |   1!  |   2@  |   3#  |   4$  |   5%  |   6^  |   7&  |   8*  |   9(  |   0)  |   -_  |   =+  |  Back Space |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | Tab      |   Q   |   W   |   E   |   R   |   T   |   Y   |   U   |   I   |   O   |   P   |   [{  |   ]}  |    \|    |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | LT(1,ESC) |   A   |   S   |   D   |   F   |   G   |   H   |   J   |   K   |   L   |   ;:  |   '"  |           Enter |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | Shift         |   Z   |   X   |   C   |   V   |   B   |   N   |   M   |   ,<  |   .>  |   /?  |               Shift |
  * |---------------------------------------------------------------------------------------------------------------------|
  * |   Ctrl  |   Alt   |   Cmd   |                    Space                      |   Cmd   |   Alt   |  Ctrl  |  HYPR(A) |
  * +---------------------------------------------------------------------------------------------------------------------+
  */
	[0] = LAYOUT_60_ansi(
    KC_GRV, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_EQL, KC_BSPC,
    KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_LBRC, KC_RBRC, KC_BSLS,
    LT(1,KC_ESC), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, LCA_T(KC_SCLN), KC_QUOT, KC_ENT,
    KC_LSFT, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSFT,
    KC_LCTL, KC_LALT, KC_LGUI, KC_SPC, KC_RGUI, KC_RALT, KC_RCTL, HYPR(KC_A)
  ),

 /** Layout 1
  * +---------------------------------------------------------------------------------------------------------------------+
  * | Sleep |  N/A  |  N/A  | Prev  | Play  | Next  |  N/A  |  N/A  |  N/A  |  N/A  |  Mute  |  Vol-  | Vol+  |       Del |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A      |   F1  |   F2  |   F3  |   F4  |   F5  |   F6  |   F7  |   F8  |   F9  |  F10  |  F11  |  F12  |    N/A   |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A       |  N/A  | Home  | PgUp  | PgDn  |  End  |   ←   |   ↓   |   ↑   |   →   |  N/A  |  N/A  |           N/A   |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A           |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |             HYPR(Z) |
  * |---------------------------------------------------------------------------------------------------------------------|
  * |  Trans  |  Trans  |  Trans  |                    N/A                        |  Trans  |  Trans  |  Trans  | HYPR(V) |
  * +---------------------------------------------------------------------------------------------------------------------+
  */
	[1] = LAYOUT_60_ansi(
    KC_SLEP, RGB_RMOD, RGB_TOG, RGB_MOD, KC_NO, KC_MPRV, KC_MPLY, KC_MNXT, KC_NO, KC_NO, KC_MUTE, KC_VOLD, KC_VOLU, KC_DEL,
    KC_NO, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, KC_NO,
    KC_NO, KC_NO, KC_HOME, KC_PGUP, KC_PGDN, KC_END, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_NO, KC_NO, KC_NO,
    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, HYPR(KC_X), HYPR(KC_Z),
    KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, HYPR(KC_V)
  ),

 /** Layout 2
  * +---------------------------------------------------------------------------------------------------------------------+
  * |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |         N/A |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A      |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |    N/A   |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A       |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |             N/A |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A           |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |                 N/A |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A     | N/A     | N/A     |                    N/A                        |   N/A   |   N/A   |   N/A   |   N/A   |
  * +---------------------------------------------------------------------------------------------------------------------+
  */
	[2] = LAYOUT_60_ansi(
    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
    KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO
  )
};

 /** DZ60 Layout
  * +---------------------------------------------------------------------------------------------------------------------+
  * |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |         N/A |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A      |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |    N/A   |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A       |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |             N/A |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A           |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |  N/A  |                 N/A |
  * |---------------------------------------------------------------------------------------------------------------------|
  * | N/A     | N/A     | N/A     |                    N/A                        |   N/A   |   N/A   |   N/A   |   N/A   |
  * +---------------------------------------------------------------------------------------------------------------------+
  */
