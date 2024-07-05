# Keyboards

## [Work Louder Creator Micro](https://github.com/qmk/qmk_firmware/tree/master/keyboards/work_louder/micro)

Hold down the horizontal encoder (top left) and plug in the keyboard.

```shell
flash work_louder/micro hallaji --build
```

## [KEYCHRON Q4](https://github.com/Keychron/qmk_firmware/tree/master/keyboards/keychron/q4)

Hold down the key located at `[0][0]` (top left) and plug in the keyboard.

```shell
flash keychron/q4/ansi/v2 hallaji --build
```

## [KBDFANS DZ60](https://github.com/qmk/qmk_firmware/tree/master/keyboards/dz60)

Hold down `Space + B` and plug in the keyboard.

```shell
flash dz60 hallaji --build
```

---

The keyboard must first be set to [flashing
mode](https://docs.qmk.fm/newbs_flashing#put-your-keyboard-into-dfu-bootloader-mode).
The [flash](../config/bin/.local/bin/flash) script is located in the bin
directory and is available as an executable. Alternatively,
[keycodes](https://docs.qmk.fm/keycodes) can be configured using
[QMK](https://config.qmk.fm) or [VIA](https://usevia.app) configurators.
