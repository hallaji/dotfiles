--  ██████╗ █████╗ ████████╗ █████╗ ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗
-- ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║
-- ██║     ███████║   ██║   ███████║██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║
-- ██║     ██╔══██║   ██║   ██╔══██║██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║
-- ╚██████╗██║  ██║   ██║   ██║  ██║██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║
--  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

local theme = require("theme")
local get_color = theme.get_color

return {
  base = {
    primary_bg = get_color("PALETTE_BA_PRIMARY_BG", "#242a34"),
    secondary_bg = get_color("PALETTE_BA_SECONDARY_BG", "#323a44"),
    tertiary_bg = get_color("PALETTE_BA_TERTIARY_BG", "#3a4555"),
    primary_fg = get_color("PALETTE_BA_PRIMARY_FG", "#e1e4e8"),
    secondary_fg = get_color("PALETTE_BA_SECONDARY_FG", "#adbac7"),
    tertiary_fg = get_color("PALETTE_BA_TERTIARY_FG", "#8296aa"),
  },
  semantic = {
    primary = get_color("PALETTE_SE_PRIMARY", "#04f6f6"),
    secondary = get_color("PALETTE_SE_SECONDARY", "#ff75b5"),
    success = get_color("PALETTE_SE_SUCCESS", "#00b196"),
    warning = get_color("PALETTE_SE_WARNING", "#f5b168"),
    error = get_color("PALETTE_SE_ERROR", "#ff4b82"),
    info = get_color("PALETTE_SE_INFO", "#02d9fe"),
    hint = get_color("PALETTE_SE_HINT", "#8296aa"),
    focus = get_color("PALETTE_SE_FOCUS", "#a394cd"),
  },
  syntax = {
    string = get_color("PALETTE_SY_STRING", "#00e8c6"),
    keyword = get_color("PALETTE_SY_KEYWORD", "#01bdfe"),
    func = get_color("PALETTE_SY_FUNCTION", "#02d9fe"),
    identifier = get_color("PALETTE_SY_IDENTIFIER", "#fdaccb"),
    comment = get_color("PALETTE_SY_COMMENT", "#515f72"),
    constant = get_color("PALETTE_SY_CONSTANT", "#f9bcd3"),
    operator = get_color("PALETTE_SY_OPERATOR", "#ff4b82"),
    preprocessor = get_color("PALETTE_SY_PREPROCESSOR", "#ffb582"),
    special = get_color("PALETTE_SY_SPECIAL", "#ff75b5"),
  },
  ui = {
    ruler = get_color("PALETTE_UI_RULER", "#222831"),
    separator = get_color("PALETTE_UI_SEPARATOR", "#1d232b"),
    border = get_color("PALETTE_UI_BORDER", "#323a44"),
    border = get_color("PALETTE_UI_PANE", "#596c86"),
    indent = get_color("PALETTE_UI_INDENT", "#3a4555"),
    cursor = get_color("PALETTE_UI_CURSOR", "#FF6B35"),
    underline = get_color("PALETTE_UI_UNDERLINE", "#009ebc"),
  },
  status = {
    normal = get_color("PALETTE_SL_NORMAL", "#06bdde"),
    insert = get_color("PALETTE_SL_INSERT", "#F4D35E"),
    visual = get_color("PALETTE_SL_VISUAL", "#ff4b82"),
    replace = get_color("PALETTE_SL_REPLACE", "#9ED47B"),
    command = get_color("PALETTE_SL_COMMAND", "#766b95"),
    inactive = get_color("PALETTE_SL_INACTIVE", "#1b2839"),
    tmux = get_color("PALETTE_SL_TMUX", "#02d9fe"),
    section_b_bg = get_color("PALETTE_SL_SECTION_B_BG", "#202f42"),
    section_b_fg = get_color("PALETTE_SL_SECTION_B_FG", "#599ac8"),
    section_c_bg = get_color("PALETTE_SL_SECTION_C_BG", "#1d232b"),
    section_c_fg = get_color("PALETTE_SL_SECTION_C_FG", "#3a4555"),
  },
}
