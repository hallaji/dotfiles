
--  ██████╗ ██████╗
-- ██╔════╝ ██╔══██╗
-- ██║  ███╗██████╔╝
-- ██║   ██║██╔═══╝
-- ╚██████╔╝██║
--  ╚═════╝ ╚═╝
-- https://github.com/Robitx/gp.nvim

require("gp").setup({
  -- required openai api key
  openai_api_key = { "op", "read", "--account", "my.1password.com", "<%= ENV["OPENAI_API_KEY_REFERENCE"] %>" },

  -- chat user prompt prefix
  chat_user_prefix = "︾︾︾︾︾",

  -- chat assistant prompt prefix
  chat_assistant_prefix = { "︽︽︽︽︽ ", "》{{agent}}" },
})
