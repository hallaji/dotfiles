-- ┌─┐┌─┐┌┐┌┌┬┐┬─┐┌─┐┬  ┬┌─┐┌─┐┌┬┐  ┌─┐┌─┐┬  ┌─┐┬─┐  ┌┬┐┌─┐┌┐┌┌─┐┌─┐┌─┐┬─┐
-- │  ├┤ │││ │ ├┬┘├─┤│  │┌─┘├┤  ││  │  │ ││  │ │├┬┘  │││├─┤│││├─┤│ ┬├┤ ├┬┘
-- └─┘└─┘┘└┘ ┴ ┴└─┴ ┴┴─┘┴└─┘└─┘─┴┘  └─┘└─┘┴─┘└─┘┴└─  ┴ ┴┴ ┴┘└┘┴ ┴└─┘└─┘┴└─

local M = {}

-- Helper to get env var with fallback
local function get_color(env_var, fallback)
  return vim.env[env_var] or fallback
end

-- Core theme colors
M.palette = {
  -- Base colors
  bg_primary = get_color('COLOR_BG_PRIMARY', '#22272e'),
  bg_secondary = get_color('COLOR_BG_SECONDARY', '#1f242a'),
  bg_tertiary = get_color('COLOR_BG_TERTIARY', '#3c4552'),
  fg_primary = get_color('COLOR_FG_PRIMARY', '#e1e4e8'),
  fg_secondary = get_color('COLOR_FG_SECONDARY', '#adbac7'),
  fg_tertiary = get_color('COLOR_FG_TERTIARY', '#8296aa'),

  -- Semantic colors
  primary = get_color('COLOR_PRIMARY', '#04f6f6'),
  secondary = get_color('COLOR_SECONDARY', '#e86db2'),
  success = get_color('COLOR_SUCCESS', '#00b196'),
  warning = get_color('COLOR_WARNING', '#f5b168'),
  error = get_color('COLOR_ERROR', '#ff4b82'),
  info = get_color('COLOR_INFO', '#6fc1ff'),
  hint = get_color('COLOR_HINT', '#8296aa'),
  focus = get_color('COLOR_FOCUS', '#a394cd'),

  -- Syntax colors
  string = get_color('COLOR_STRING', '#2bd2b9'),
  keyword = get_color('COLOR_KEYWORD', '#79b8ff'),
  func = get_color('COLOR_FUNCTION', '#04f6f6'),
  identifier = get_color('COLOR_IDENTIFIER', '#a394cd'),
  comment = get_color('COLOR_COMMENT', '#424c5a'),
  constant = get_color('COLOR_CONSTANT', '#2f97ea'),

  -- Additional colors
  ruler = get_color('COLOR_RULER', '#22282f'),
  border = get_color('COLOR_BORDER', '#a394cd'),
  indent_line = get_color('COLOR_INDENT_LINE', '#2e353f'),
  cursor = get_color('COLOR_CURSOR', '#F4D35E'),
  operator = get_color('COLOR_OPERATOR', '#f97684'),
  preprocessor = get_color('COLOR_PREPROCESSOR', '#ffcc95'),
  special = get_color('COLOR_SPECIAL', '#e86db2'),
  underline = get_color('COLOR_UNDERLINE', '#00b196'),
  search = get_color('COLOR_SEARCH', '#f47067'),
  search_bg = get_color('COLOR_SEARCH_BG', '#3c4552'),
}

-- Lualine specific colors
M.lualine = {
  normal = get_color('LUALINE_NORMAL', '#EEB4B3'),
  insert = get_color('LUALINE_INSERT', '#F4D35E'),
  visual = get_color('LUALINE_VISUAL', '#E95678'),
  replace = get_color('LUALINE_REPLACE', '#9ED47B'),
  command = get_color('LUALINE_COMMAND', '#267d80'),
  inactive = get_color('LUALINE_INACTIVE', '#6C6F93'),
  section_b_bg = get_color('LUALINE_SECTION_B_BG', '#2E303E'),
  section_b_fg = get_color('LUALINE_SECTION_B_FG', '#6C6F93'),
  section_c_bg = get_color('LUALINE_SECTION_C_BG', '#1f242a'),
  section_c_fg = get_color('LUALINE_SECTION_C_FG', '#475262'),
}

return M
