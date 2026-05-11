# Keyboards

| Keyboard | VIA | QMK | Flashing Mode | Flash Command |
|----|----|----|----|----|
| [NuPhy Air60 V2](https://nuphy.com) | [VIA](keyboards/nuphy/air60/v2/via.json) | | Key `[0][0]` (top left) | |
| [Work Louder Creator Micro](https://worklouder.cc) | [VIA](keyboards/work_louder/micro/keymaps/hallaji/via.json) | [QMK](https://github.com/qmk/qmk_firmware/tree/master/keyboards/work_louder/micro) | Horizontal encoder key (top left) | |
| [Keychron Q4](https://www.keychron.com) | | [QMK](https://github.com/Keychron/qmk_firmware/tree/master/keyboards/keychron/q4) | Key `[0][0]` (top left) | ```flash-keyboard keychron/q4/ansi/v2 hallaji --build ``` |
| [KBDFans DZ60](https://kbdfans.com) | | [QMK](https://github.com/qmk/qmk_firmware/tree/master/keyboards/dz60) | `Space + B` | ```flash-keyboard dz60 hallaji --build ``` |

The keyboard must first be set to [flashing mode](https://docs.qmk.fm/newbs_flashing#put-your-keyboard-into-dfu-bootloader-mode). The [flash](../config/bin/.local/bin/flash) script is located in the bin directory and is available as an executable. Alternatively, [keycodes](https://docs.qmk.fm/keycodes) can be configured using [QMK](https://config.qmk.fm) or [VIA](https://usevia.app) configurators.
