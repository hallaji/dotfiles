/* https://docs.qmk.fm/keycodes */

#include QMK_KEYBOARD_H

enum custom_keycodes {
    LED_LEVEL = SAFE_RANGE,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT(
        /*------------------------------------*/
        KC_MPLY, KC_0, KC_NO, KC_NO,
        /*------------------------------------*/
        KC_NO, KC_NO, KC_NO, HYPR(KC_ENTER),
        /*------------------------------------*/
        KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------*/
        RGB_TOG, HYPR(KC_V), HYPR(KC_M), TO(1)
        /*------------------------------------*/
    ),
    [1] = LAYOUT(
        /*------------------------------------*/
        KC_NO, KC_1, KC_NO, KC_NO,
        /*------------------------------------*/
        KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------*/
        KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------*/
        KC_TRNS, KC_NO, KC_NO, TO(2)
        /*------------------------------------*/
    ),
    [2] = LAYOUT(
        /*------------------------------------*/
        KC_NO, KC_2, KC_NO, KC_NO,
        /*------------------------------------*/
        KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------*/
        KC_NO, KC_NO, KC_NO, KC_NO,
        /*------------------------------------*/
        KC_TRNS, KC_NO, KC_NO, TO(3)
        /*------------------------------------*/
    ),
    [3] = LAYOUT(
        /*------------------------------------*/
        KC_NO, QK_BACKLIGHT_TOGGLE, QK_BACKLIGHT_STEP, KC_NO,
        /*------------------------------------*/
        QK_BACKLIGHT_UP, KC_NO, KC_NO, KC_NO,
        /*------------------------------------*/
        QK_BACKLIGHT_DOWN, KC_NO, KC_NO, KC_NO,
        /*------------------------------------*/
        KC_TRNS, KC_NO, KC_NO, TO(0)
        /*------------------------------------*/
    )
};

#if defined(ENCODER_MAP_ENABLE)
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
    { ENCODER_CCW_CW(KC_VOLD, KC_VOLU),           ENCODER_CCW_CW(C(KC_Z), C(KC_Y))  },
    { ENCODER_CCW_CW(KC_TRNS, KC_TRNS),           ENCODER_CCW_CW(KC_TRNS, KC_TRNS)  },
    { ENCODER_CCW_CW(KC_TRNS, KC_TRNS),           ENCODER_CCW_CW(KC_TRNS, KC_TRNS)  },
    { ENCODER_CCW_CW(KC_TRNS, KC_TRNS),           ENCODER_CCW_CW(KC_TRNS, KC_TRNS)  }
};
#endif

typedef union {
    uint32_t raw;
    struct {
        uint8_t led_level : 3;
    };
} work_louder_config_t;

work_louder_config_t work_louder_config;

#define WL_LED_MAX_BRIGHT 75

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case LED_LEVEL:
            if (record->event.pressed) {
                work_louder_config.led_level++;
                if (work_louder_config.led_level > 4) {
                    work_louder_config.led_level = 0;
                }
                work_louder_micro_led_all_set((uint8_t)(work_louder_config.led_level * WL_LED_MAX_BRIGHT / 4));
                eeconfig_update_user(work_louder_config.raw);
                layer_state_set_kb(layer_state);
            }
            break;
    }
    return true;
}

layer_state_t layer_state_set_user(layer_state_t state) {
    layer_state_cmp(state, 1) ? work_louder_micro_led_1_on(): work_louder_micro_led_1_off();
    layer_state_cmp(state, 2) ? work_louder_micro_led_2_on(): work_louder_micro_led_2_off();
    layer_state_cmp(state, 3) ? work_louder_micro_led_3_on(): work_louder_micro_led_3_off();

    return state;
}

/* void eeconfig_init_user(void) { */
/*     work_louder_config.raw = 0; */
/*     work_louder_config.led_level = 1; */
/*     eeconfig_update_user(work_louder_config.raw); */
/* } */

void matrix_init_user(void) {
    work_louder_config.raw = eeconfig_read_user();
    work_louder_micro_led_all_set((uint8_t)(work_louder_config.led_level * WL_LED_MAX_BRIGHT / 4));
}
