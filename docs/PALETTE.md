# Palette

The color palette behind the **Catamaran** theme, shared by every tool in
these dotfiles.

## How it is organised and maintained

Everything lives in one place: the palette block of `config/env/.env`, in two
layers.

- **Layer 1 — named colors (the palette).** 26 exports, and the **only place
  hex literals live**: numbered neutrals (`PALETTE_BG0`–`PALETTE_BG4`,
  `PALETTE_NAVY`, `PALETTE_FG0`–`PALETTE_FG2`, `PALETTE_GRAY`) plus 16
  accents with real color names (`PALETTE_RED`, `PALETTE_SKY`,
  `PALETTE_MINT`, …).
- **Layer 2 — roles (semantic aliases).** Shell aliases grouped by area —
  `PALETTE_CODE_*` (syntax), `PALETTE_UI_*` (cross-tool chrome),
  `PALETTE_MODE_*` (vi-mode indicators) — each pointing at a layer-1 color.
  Consumers use a role when they mean the semantic ("error text is
  `UI_ERROR` everywhere") and a base color when it is decoration (tmux
  section backgrounds, Alacritty's ANSI table).

Colors reach tools four ways:

1. **Templates at login** — `render-templates` (run from `~/.zprofile`)
   envsubsts alacritty, bat, sketchybar, borders, alfred, gh-dash, lazygit
   and process-compose configs; the `:hex` tag converts to the `0xAARRGGBB`
   form sketchybar/borders need.
2. **Live shell environment** — tmux (server environment) and fzf
   (`FZF_DEFAULT_OPTS` in `tools.zsh`).
3. **Prompt-time reads** — oh-my-posh via `{{ .Env.PALETTE_* }}`.
4. **Neovim** — `lua/palettes/catamaran.lua` reads `vim.env` with hex
   fallbacks for env-less launches.

Tools configured with ANSI indexes or names — tig, starship, p10k — inherit
the palette **transitively** through Alacritty's ANSI table and are left
untouched on purpose.

**Changing a color:** edit its one hex in layer 1, then open a fresh login
shell (or `zsh -lc render-templates`) and restart the tmux server.
**Re-mapping a semantic:** change one alias line in layer 2.
**Guardrails:** the doctor's `templates` check flags stale rendered files;
`tests/unit/palette-sync.bats` fails when the Neovim fallbacks, `.vimrc`
hexes, the tables below, or the generated mockups drift from `.env`. After a
palette edit, regenerate the mockups with `devbox run palette-assets`.

## Named colors (layer 1)

```mermaid
flowchart TB
    subgraph neutrals[Neutrals]
        direction LR
        BG0["BG0<br>#1d232b"]:::bg0 ~~~ BG1["BG1<br>#222831"]:::bg1 ~~~ BG2["BG2<br>#242a34"]:::bg2 ~~~ BG3["BG3<br>#323a44"]:::bg3
        BG4["BG4<br>#3a4555"]:::bg4 ~~~ NAVY["NAVY<br>#202f42"]:::navy ~~~ FG0["FG0<br>#e1e4e8"]:::fg0 ~~~ FG1["FG1<br>#adbac7"]:::fg1
        FG2["FG2<br>#8296aa"]:::fg2 ~~~ GRAY["GRAY<br>#515f72"]:::gray
    end
    subgraph accents[Accents]
        direction LR
        RED["RED<br>#ff4b82"]:::red ~~~ PINK["PINK<br>#ff75b5"]:::pink ~~~ ROSE["ROSE<br>#fdaccb"]:::rose ~~~ ORANGE["ORANGE<br>#ff6b35"]:::orange
        AMBER["AMBER<br>#f5b168"]:::amber ~~~ YELLOW["YELLOW<br>#f4d35e"]:::yellow ~~~ GREEN["GREEN<br>#9ed47b"]:::green ~~~ TEAL["TEAL<br>#00b196"]:::teal
        MINT["MINT<br>#00e8c6"]:::mint ~~~ CYAN["CYAN<br>#04f6f6"]:::cyan ~~~ SKY["SKY<br>#02d9fe"]:::sky ~~~ AZURE["AZURE<br>#01bdfe"]:::azure
        BLUE["BLUE<br>#6fc1ff"]:::blue ~~~ STEEL["STEEL<br>#599ac8"]:::steel ~~~ PURPLE["PURPLE<br>#a394cd"]:::purple ~~~ MAUVE["MAUVE<br>#766b95"]:::mauve
    end
    classDef bg0 fill:#1d232b,stroke:#515f72,color:#e1e4e8
    classDef bg1 fill:#222831,stroke:#515f72,color:#e1e4e8
    classDef bg2 fill:#242a34,stroke:#515f72,color:#e1e4e8
    classDef bg3 fill:#323a44,stroke:#515f72,color:#e1e4e8
    classDef bg4 fill:#3a4555,stroke:#515f72,color:#e1e4e8
    classDef navy fill:#202f42,stroke:#515f72,color:#e1e4e8
    classDef fg0 fill:#e1e4e8,stroke:#515f72,color:#242a34
    classDef fg1 fill:#adbac7,stroke:#515f72,color:#242a34
    classDef fg2 fill:#8296aa,stroke:#515f72,color:#242a34
    classDef gray fill:#515f72,stroke:#515f72,color:#e1e4e8
    classDef red fill:#ff4b82,stroke:#515f72,color:#242a34
    classDef pink fill:#ff75b5,stroke:#515f72,color:#242a34
    classDef rose fill:#fdaccb,stroke:#515f72,color:#242a34
    classDef orange fill:#ff6b35,stroke:#515f72,color:#242a34
    classDef amber fill:#f5b168,stroke:#515f72,color:#242a34
    classDef yellow fill:#f4d35e,stroke:#515f72,color:#242a34
    classDef green fill:#9ed47b,stroke:#515f72,color:#242a34
    classDef teal fill:#00b196,stroke:#515f72,color:#242a34
    classDef mint fill:#00e8c6,stroke:#515f72,color:#242a34
    classDef cyan fill:#04f6f6,stroke:#515f72,color:#242a34
    classDef sky fill:#02d9fe,stroke:#515f72,color:#242a34
    classDef azure fill:#01bdfe,stroke:#515f72,color:#242a34
    classDef blue fill:#6fc1ff,stroke:#515f72,color:#242a34
    classDef steel fill:#599ac8,stroke:#515f72,color:#242a34
    classDef purple fill:#a394cd,stroke:#515f72,color:#242a34
    classDef mauve fill:#766b95,stroke:#515f72,color:#e1e4e8
```

| Name | Hex | Typical use |
| --- | --- | --- |
| `PALETTE_BG0` | `#1d232b` | darkest background — tmux status section C, nvim statusline/separators |
| `PALETTE_BG1` | `#222831` | nvim color column (ruler) |
| `PALETTE_BG2` | `#242a34` | **main background** (terminal, editor, bars) |
| `PALETTE_BG3` | `#323a44` | raised background — ANSI black, cursor line, popup menus |
| `PALETTE_BG4` | `#3a4555` | lightest background — ANSI bright black, inactive borders, muted text on dark |
| `PALETTE_NAVY` | `#202f42` | blue-tinted background — statusline section B, inactive statusline, lazygit selection |
| `PALETTE_FG0` | `#e1e4e8` | primary foreground |
| `PALETTE_FG1` | `#adbac7` | secondary foreground — ANSI bright white |
| `PALETTE_FG2` | `#8296aa` | tertiary foreground — ANSI white, hints |
| `PALETTE_GRAY` | `#515f72` | muted — comments, line numbers |
| `PALETTE_RED` | `#ff4b82` | errors, operators, visual mode |
| `PALETTE_PINK` | `#ff75b5` | secondary accent, special chars |
| `PALETTE_ROSE` | `#fdaccb` | identifiers, constants, tmux active tab |
| `PALETTE_ORANGE` | `#ff6b35` | cursor |
| `PALETTE_AMBER` | `#f5b168` | warnings, preprocessor, ANSI yellow + bright yellow |
| `PALETTE_YELLOW` | `#f4d35e` | insert mode, alacritty hints |
| `PALETTE_GREEN` | `#9ed47b` | replace mode |
| `PALETTE_TEAL` | `#00b196` | success, ANSI bright green |
| `PALETTE_MINT` | `#00e8c6` | strings, ANSI green |
| `PALETTE_CYAN` | `#04f6f6` | primary accent, ANSI cyan, selection |
| `PALETTE_SKY` | `#02d9fe` | functions, borders, normal mode, ANSI blue, underlined text |
| `PALETTE_AZURE` | `#01bdfe` | keywords |
| `PALETTE_BLUE` | `#6fc1ff` | info, ANSI bright blue |
| `PALETTE_STEEL` | `#599ac8` | statusline section B foreground |
| `PALETTE_PURPLE` | `#a394cd` | focus, ANSI bright magenta |
| `PALETTE_MAUVE` | `#766b95` | command mode |

## Roles (layer 2)

### Code — syntax colors (nvim highlights, bat theme)

| Role | Color | Used for |
| --- | --- | --- |
| `PALETTE_CODE_STRING` | `PALETTE_MINT` | strings |
| `PALETTE_CODE_KEYWORD` | `PALETTE_AZURE` | keywords, statements, types |
| `PALETTE_CODE_FUNCTION` | `PALETTE_SKY` | functions, markdown headings |
| `PALETTE_CODE_IDENTIFIER` | `PALETTE_ROSE` | variables, attributes |
| `PALETTE_CODE_CONSTANT` | `PALETTE_ROSE` | numbers, language constants |
| `PALETTE_CODE_COMMENT` | `PALETTE_GRAY` | comments |
| `PALETTE_CODE_OPERATOR` | `PALETTE_RED` | operators, punctuation |
| `PALETTE_CODE_PREPROCESSOR` | `PALETTE_AMBER` | preprocessor, imports |
| `PALETTE_CODE_SPECIAL` | `PALETTE_PINK` | escapes, regexp |

### UI — cross-tool chrome (fzf, sketchybar, borders, gh-dash, lazygit, process-compose, alfred, oh-my-posh, nvim)

| Role | Color | Used for |
| --- | --- | --- |
| `PALETTE_UI_ACCENT` | `PALETTE_CYAN` | primary accent — active borders, icons, selection |
| `PALETTE_UI_ACCENT_ALT` | `PALETTE_PINK` | secondary accent — prompts, search matches |
| `PALETTE_UI_SUCCESS` | `PALETTE_TEAL` | success, diff added |
| `PALETTE_UI_WARNING` | `PALETTE_AMBER` | warnings, diff changed |
| `PALETTE_UI_ERROR` | `PALETTE_RED` | errors, diff deleted, bell |
| `PALETTE_UI_INFO` | `PALETTE_BLUE` | info |
| `PALETTE_UI_HINT` | `PALETTE_FG2` | hints, faint text |
| `PALETTE_UI_FOCUS` | `PALETTE_PURPLE` | focus, selection highlight |
| `PALETTE_UI_BORDER` | `PALETTE_SKY` | window/pane borders |
| `PALETTE_UI_CURSOR` | `PALETTE_ORANGE` | cursor |

### Mode — vi-mode indicators (lualine, alacritty `vi_mode_cursor`)

| Role | Color | Used for |
| --- | --- | --- |
| `PALETTE_MODE_NORMAL` | `PALETTE_SKY` | normal mode |
| `PALETTE_MODE_INSERT` | `PALETTE_YELLOW` | insert mode |
| `PALETTE_MODE_VISUAL` | `PALETTE_RED` | visual mode |
| `PALETTE_MODE_REPLACE` | `PALETTE_GREEN` | replace mode |
| `PALETTE_MODE_COMMAND` | `PALETTE_MAUVE` | command mode |

## The palette in context

Generated mockups (stylized, not pixel-true — they document which color lands
where). Regenerate with `devbox run palette-assets`; sources are the
`*.svg.template` files beside them.

### Neovim

![Neovim mockup](assets/nvim.svg)

### tmux

![tmux mockup](assets/tmux.svg)

### Alacritty

![Alacritty mockup](assets/alacritty.svg)

## Deliberately outside the palette

- **ANSI-indexed tools** — tig (`.tigrc` color indexes), starship (named ANSI
  colors), p10k (indexes 1–7): themed transitively via Alacritty's ANSI
  table. Do not wire them to `PALETTE_*`.
- **`config/vim/.vimrc`** — hexes are hardcoded on purpose so the file stays
  a single copyable unit for servers; each hex is annotated with its palette
  name and membership is test-enforced. Its three diff backgrounds
  (`#12352f`, `#3a1c28`, `#2a3240`) are vim-only tints with no palette entry.
- **sketchybar `BAR_COLOR`** — transparent (`0x00000000`), no palette
  equivalent.
- **Vimium hint colors** — stock extension styling in browser-side JSON, not
  env-renderable.
- **Docs Mermaid diagrams** — Mermaid cannot read env vars; diagrams carry
  literal hexes with the palette name in a comment.
