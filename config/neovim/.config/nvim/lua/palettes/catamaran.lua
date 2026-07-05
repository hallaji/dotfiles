--  ██████╗ █████╗ ████████╗ █████╗ ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗
-- ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║
-- ██║     ███████║   ██║   ███████║██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║
-- ██║     ██╔══██║   ██║   ██╔══██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║
-- ╚██████╗██║  ██║   ██║   ██║  ██║██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║
--  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
--
-- Mirrors the two-layer palette in config/env/.env: `color` holds the named
-- colors (the only literal hex fallbacks, for env-less launches), while the
-- code/ui/mode role groups chain their fallbacks to it. Keep the fallbacks in
-- sync with .env -- enforced by tests/unit/palette-sync.bats.

local theme = require("theme")
local get_color = theme.get_color

local c = {
  bg0 = get_color("PALETTE_BG0", "#1d232b"),
  bg1 = get_color("PALETTE_BG1", "#222831"),
  bg2 = get_color("PALETTE_BG2", "#242a34"),
  bg3 = get_color("PALETTE_BG3", "#323a44"),
  bg4 = get_color("PALETTE_BG4", "#3a4555"),
  navy = get_color("PALETTE_NAVY", "#202f42"),
  fg0 = get_color("PALETTE_FG0", "#e1e4e8"),
  fg1 = get_color("PALETTE_FG1", "#adbac7"),
  fg2 = get_color("PALETTE_FG2", "#8296aa"),
  gray = get_color("PALETTE_GRAY", "#515f72"),
  red = get_color("PALETTE_RED", "#ff4b82"),
  pink = get_color("PALETTE_PINK", "#ff75b5"),
  rose = get_color("PALETTE_ROSE", "#fdaccb"),
  orange = get_color("PALETTE_ORANGE", "#ff6b35"),
  amber = get_color("PALETTE_AMBER", "#f5b168"),
  yellow = get_color("PALETTE_YELLOW", "#f4d35e"),
  green = get_color("PALETTE_GREEN", "#9ed47b"),
  teal = get_color("PALETTE_TEAL", "#00b196"),
  mint = get_color("PALETTE_MINT", "#00e8c6"),
  cyan = get_color("PALETTE_CYAN", "#04f6f6"),
  sky = get_color("PALETTE_SKY", "#02d9fe"),
  azure = get_color("PALETTE_AZURE", "#01bdfe"),
  blue = get_color("PALETTE_BLUE", "#6fc1ff"),
  steel = get_color("PALETTE_STEEL", "#599ac8"),
  purple = get_color("PALETTE_PURPLE", "#a394cd"),
  mauve = get_color("PALETTE_MAUVE", "#766b95"),
}

return {
  color = c,
  code = {
    string = get_color("PALETTE_CODE_STRING", c.mint),
    keyword = get_color("PALETTE_CODE_KEYWORD", c.azure),
    func = get_color("PALETTE_CODE_FUNCTION", c.sky), -- "function" is reserved
    identifier = get_color("PALETTE_CODE_IDENTIFIER", c.rose),
    constant = get_color("PALETTE_CODE_CONSTANT", c.rose),
    comment = get_color("PALETTE_CODE_COMMENT", c.gray),
    operator = get_color("PALETTE_CODE_OPERATOR", c.red),
    preprocessor = get_color("PALETTE_CODE_PREPROCESSOR", c.amber),
    special = get_color("PALETTE_CODE_SPECIAL", c.pink),
  },
  ui = {
    accent = get_color("PALETTE_UI_ACCENT", c.cyan),
    accent_alt = get_color("PALETTE_UI_ACCENT_ALT", c.pink),
    success = get_color("PALETTE_UI_SUCCESS", c.teal),
    warning = get_color("PALETTE_UI_WARNING", c.amber),
    error = get_color("PALETTE_UI_ERROR", c.red),
    info = get_color("PALETTE_UI_INFO", c.blue),
    hint = get_color("PALETTE_UI_HINT", c.fg2),
    focus = get_color("PALETTE_UI_FOCUS", c.purple),
    border = get_color("PALETTE_UI_BORDER", c.sky),
    cursor = get_color("PALETTE_UI_CURSOR", c.orange),
  },
  mode = {
    normal = get_color("PALETTE_MODE_NORMAL", c.sky),
    insert = get_color("PALETTE_MODE_INSERT", c.yellow),
    visual = get_color("PALETTE_MODE_VISUAL", c.red),
    replace = get_color("PALETTE_MODE_REPLACE", c.green),
    command = get_color("PALETTE_MODE_COMMAND", c.mauve),
  },
}
