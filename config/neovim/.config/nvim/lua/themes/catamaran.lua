-- ┌─┐┌─┐┌┐┌┌┬┐┬─┐┌─┐┬  ┬┌─┐┌─┐┌┬┐  ┌─┐┌─┐┬  ┌─┐┬─┐  ┌┬┐┌─┐┌┐┌┌─┐┌─┐┌─┐┬─┐
-- │  ├┤ │││ │ ├┬┘├─┤│  │┌─┘├┤  ││  │  │ ││  │ │├┬┘  │││├─┤│││├─┤│ ┬├┤ ├┬┘
-- └─┘└─┘┘└┘ ┴ ┴└─┴ ┴┴─┘┴└─┘└─┘─┴┘  └─┘└─┘┴─┘└─┘┴└─  ┴ ┴┴ ┴┘└┘┴ ┴└─┘└─┘┴└─

local theme = require('theme')
local get_color = theme.get_color

return {
  base = {
    primary_bg = get_color('PALETTE_BA_PRIMARY_BG', '#22272e'),
    secondary_bg = get_color('PALETTE_BA_SECONDARY_BG', '#1f242a'),
    tertiary_bg = get_color('PALETTE_BA_TERTIARY_BG', '#3c4552'),
    primary_fg = get_color('PALETTE_BA_PRIMARY_FG', '#e1e4e8'),
    secondary_fg = get_color('PALETTE_BA_SECONDARY_FG', '#adbac7'),
    tertiary_fg = get_color('PALETTE_BA_TERTIARY_FG', '#8296aa'),
  },
  semantic = {
    primary = get_color('PALETTE_SE_PRIMARY', '#04f6f6'),
    secondary = get_color('PALETTE_SE_SECONDARY', '#e86db2'),
    success = get_color('PALETTE_SE_SUCCESS', '#00b196'),
    warning = get_color('PALETTE_SE_WARNING', '#f5b168'),
    error = get_color('PALETTE_SE_ERROR', '#ff4b82'),
    info = get_color('PALETTE_SE_INFO', '#6fc1ff'),
    hint = get_color('PALETTE_SE_HINT', '#8296aa'),
    focus = get_color('PALETTE_SE_FOCUS', '#a394cd'),
  },
  syntax = {
    string = get_color('PALETTE_SY_STRING', '#2bd2b9'),
    keyword = get_color('PALETTE_SY_KEYWORD', '#79b8ff'),
    func = get_color('PALETTE_SY_FUNCTION', '#04f6f6'),
    identifier = get_color('PALETTE_SY_IDENTIFIER', '#a394cd'),
    comment = get_color('PALETTE_SY_COMMENT', '#424c5a'),
    constant = get_color('PALETTE_SY_CONSTANT', '#2f97ea'),
    operator = get_color('PALETTE_SY_OPERATOR', '#f97684'),
    preprocessor = get_color('PALETTE_SY_PREPROCESSOR', '#ffcc95'),
    special = get_color('PALETTE_SY_SPECIAL', '#e86db2'),
  },
  ui = {
    ruler = get_color('PALETTE_UI_RULER', '#22282f'),
    border = get_color('PALETTE_UI_BORDER', '#a394cd'),
    indent_line = get_color('PALETTE_UI_INDENT_LINE', '#2e353f'),
    cursor = get_color('PALETTE_UI_CURSOR', '#F4D35E'),
    underline = get_color('PALETTE_UI_UNDERLINE', '#00b196'),
  },
  lualine = {
    normal = get_color('PALETTE_LL_NORMAL', '#EEB4B3'),
    insert = get_color('PALETTE_LL_INSERT', '#F4D35E'),
    visual = get_color('PALETTE_LL_VISUAL', '#E95678'),
    replace = get_color('PALETTE_LL_REPLACE', '#9ED47B'),
    command = get_color('PALETTE_LL_COMMAND', '#267d80'),
    inactive = get_color('PALETTE_LL_INACTIVE', '#6C6F93'),
    section_b_bg = get_color('PALETTE_LL_SECTION_B_BG', '#2E303E'),
    section_b_fg = get_color('PALETTE_LL_SECTION_B_FG', '#6C6F93'),
    section_c_bg = get_color('PALETTE_LL_SECTION_C_BG', '#1f242a'),
    section_c_fg = get_color('PALETTE_LL_SECTION_C_FG', '#475262'),
  },
}
