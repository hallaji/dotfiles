# Keyboards

## [NuPhy Air60 V2](https://nuphy.com)

### VIA

Configure with [keyboards/nuphy/air60/v2/via.json](keyboards/nuphy/air60/v2/via.json)

### QMK

Hold down the key located at `[0][0]` (top left) and plug in the keyboard.

## [Work Louder Creator Micro](https://worklouder.cc)

### VIA

Configure with [keyboards/work_louder/micro/keymaps/hallaji/via.json](keyboards/work_louder/micro/keymaps/hallaji/via.json)

### [QMK](https://github.com/qmk/qmk_firmware/tree/master/keyboards/work_louder/micro)

Hold down the horizontal encoder (top left) and plug in the keyboard.

## [Keychron Q4](https://www.keychron.com)

### [QMK](https://github.com/Keychron/qmk_firmware/tree/master/keyboards/keychron/q4)

Hold down the key located at `[0][0]` (top left) and plug in the keyboard.

```shell
flash keychron/q4/ansi/v2 hallaji --build
```

## [KBDFans DZ60](https://kbdfans.com)

### [QMK](https://github.com/qmk/qmk_firmware/tree/master/keyboards/dz60)

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
