#include QMK_KEYBOARD_H

enum layers
{
    _BASE,
    _STANDARD,
    _SECOND,
    _THIRD,
};

/* https://github.com/qmk/qmk_firmware/blob/master/docs/keycodes.md */

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_BASE] = LAYOUT_ansi_61(
        /*------------------------------------------------------------------------------------------------------------*/
        KC_GRV, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_EQL, KC_BSPC,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_LBRC, KC_RBRC, KC_BSLS,
        /*------------------------------------------------------------------------------------------------------------*/
        LT(_SECOND, KC_ESC), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, LCAG_T(KC_SCLN), KC_QUOT, KC_ENT,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_LSFT, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSFT,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_LCTL, KC_LOPT, KC_LCMD, KC_SPC, RGUI(KC_SPC), KC_ROPT, HYPR(KC_D), HYPR(KC_M)
        /*------------------------------------------------------------------------------------------------------------*/
        ),

    [_STANDARD] = LAYOUT_ansi_61(
        /*------------------------------------------------------------------------------------------------------------*/
        KC_GRV, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
        KC_TRNS, KC_TRNS,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
        KC_TRNS, KC_TRNS,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_ESC, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_SCLN, KC_TRNS,
        KC_TRNS,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT
        /*------------------------------------------------------------------------------------------------------------*/
        ),

    [_SECOND] = LAYOUT_ansi_61(
        /*------------------------------------------------------------------------------------------------------------*/
        HYPR(KC_GRV), KC_NO, KC_NO, KC_NO, KC_NO, KC_MPRV, KC_MPLY, KC_MNXT, KC_NO, KC_NO, KC_MUTE, KC_VOLD,
        KC_VOLU, KC_DEL,
        /*------------------------------------------------------------------------------------------------------------*/
        LT(_THIRD, KC_NO), HYPR(KC_Q), HYPR(KC_W), HYPR(KC_E), HYPR(KC_R), HYPR(KC_T), HYPR(KC_Y), HYPR(KC_U), HYPR(KC_I),
        HYPR(KC_O), HYPR(KC_P), HYPR(KC_LBRC), HYPR(KC_RBRC), HYPR(KC_BACKSLASH),
        /*------------------------------------------------------------------------------------------------------------*/
        KC_NO, HYPR(KC_A), KC_HOME, KC_PGUP, KC_PGDN, KC_END, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, LCAG_T(KC_NO),
        HYPR(KC_QUOT), HYPR(KC_ENTER),
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, HYPR(KC_Z), HYPR(KC_X), HYPR(KC_C), HYPR(KC_V), HYPR(KC_B), HYPR(KC_N), HYPR(KC_M), KC_NO,
        KC_NO, KC_NO, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, HYPR(KC_L), HYPR(KC_V)
        /*------------------------------------------------------------------------------------------------------------*/
        ),

    [_THIRD] = LAYOUT_ansi_61(
        /*------------------------------------------------------------------------------------------------------------*/
        RGB_TOG, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_NO, RGB_MOD, RGB_VAI, RGB_HUI, RGB_SAI, RGB_SPI, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_NO, RGB_RMOD, RGB_VAD, RGB_HUD, RGB_SAD, RGB_SPD, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_NO, KC_NO
        /*------------------------------------------------------------------------------------------------------------*/
        )};
