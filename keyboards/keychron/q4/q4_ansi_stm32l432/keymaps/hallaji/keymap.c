#include QMK_KEYBOARD_H
#include "test.h"

enum layers
{
    _BASE,
    _STANDARD,
    _SECOND,
    _THIRD,
};

enum custom_keycodes
{
    KC_MISSION_CONTROL = SAFE_RANGE,
    KC_LAUNCHPAD,
    KC_LOPTN,
    KC_ROPTN,
    KC_LCMMD,
    KC_RCMMD,
    KC_TASK_VIEW,
    KC_FILE_EXPLORER,
    KC_SCREEN_SHOT
};

#define KC_MCTL KC_MISSION_CONTROL
#define KC_LPAD KC_LAUNCHPAD
#define KC_TASK KC_TASK_VIEW
#define KC_FLXP KC_FILE_EXPLORER
#define KC_SNAP KC_SCREEN_SHOT

typedef struct PACKED
{
    uint8_t len;
    uint8_t keycode[3];
} key_combination_t;

key_combination_t key_comb_list[3] = {
    {2, {KC_LWIN, KC_TAB}},
    {2, {KC_LWIN, KC_E}},
    {3, {KC_LSFT, KC_LCMD, KC_4}}};

static uint8_t mac_keycode[4] = {KC_LOPT, KC_ROPT, KC_LCMD, KC_RCMD};

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
        KC_LCTL, KC_LOPTN, KC_LCMMD, KC_SPC, RGUI(KC_SPC), LT(_THIRD, KC_NO), HYPR(KC_D), HYPR(KC_A)
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
        HYPR(KC_GRV), KC_NO, KC_NO, KC_NO, KC_NO, KC_MPRV, KC_MPLY, KC_MNXT, KC_NO, HYPR(KC_E), KC_MUTE, KC_VOLD,
        KC_VOLU, KC_DEL,
        /*------------------------------------------------------------------------------------------------------------*/
        HYPR(KC_1), HYPR(KC_2), KC_NO, KC_NO, KC_NO, HYPR(KC_T), HYPR(KC_Y), HYPR(KC_U), HYPR(KC_I),
        HYPR(KC_O), HYPR(KC_P), HYPR(KC_LBRC), HYPR(KC_RBRC), HYPR(KC_C),
        /*------------------------------------------------------------------------------------------------------------*/
        KC_NO, HYPR(KC_N), KC_HOME, KC_PGUP, KC_PGDN, KC_END, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, LCAG_T(KC_NO),
        HYPR(KC_QUOT), HYPR(KC_M),
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, HYPR(KC_4), HYPR(KC_3), HYPR(KC_X), HYPR(KC_Z),
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, HYPR(KC_NO), HYPR(KC_L), HYPR(KC_V)
        /*------------------------------------------------------------------------------------------------------------*/
        ),

    [_THIRD] = LAYOUT_ansi_61(
        /*------------------------------------------------------------------------------------------------------------*/
        KC_NO, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        RGB_TOG, RGB_MOD, RGB_VAI, RGB_HUI, RGB_SAI, RGB_SPI, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_CAPS, RGB_RMOD, RGB_VAD, RGB_HUD, RGB_SAD, RGB_SPD, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------------------------------------------------------------------------------*/
        KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS, KC_NO, KC_NO, KC_NO
        /*------------------------------------------------------------------------------------------------------------*/
        )};

bool dip_switch_update_user(uint8_t index, bool active)
{
    system_switch_state_report(index, active);
    return true;
}

bool process_record_user(uint16_t keycode, keyrecord_t *record)
{
    switch (keycode)
    {
    case KC_MISSION_CONTROL:
        if (record->event.pressed)
        {
            host_consumer_send(0x29F);
        }
        else
        {
            host_consumer_send(0);
        }
        return false; // Skip all further processing of this key
    case KC_LAUNCHPAD:
        if (record->event.pressed)
        {
            host_consumer_send(0x2A0);
        }
        else
        {
            host_consumer_send(0);
        }
        return false; // Skip all further processing of this key
    case KC_LOPTN:
    case KC_ROPTN:
    case KC_LCMMD:
    case KC_RCMMD:
        if (record->event.pressed)
        {
            register_code(mac_keycode[keycode - KC_LOPTN]);
        }
        else
        {
            unregister_code(mac_keycode[keycode - KC_LOPTN]);
        }
        return false; // Skip all further processing of this key
    case KC_TASK:
    case KC_FLXP:
    case KC_SNAP:
        if (record->event.pressed)
        {
            for (uint8_t i = 0; i < key_comb_list[keycode - KC_TASK].len; i++)
            {
                register_code(key_comb_list[keycode - KC_TASK].keycode[i]);
            }
        }
        else
        {
            for (uint8_t i = 0; i < key_comb_list[keycode - KC_TASK].len; i++)
            {
                unregister_code(key_comb_list[keycode - KC_TASK].keycode[i]);
            }
        }
        return false; // Skip all further processing of this key
    default:
        return true; // Process all other keycodes normally
    }
}
