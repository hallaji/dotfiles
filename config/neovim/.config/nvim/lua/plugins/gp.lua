--  ██████╗ ██████╗
-- ██╔════╝ ██╔══██╗
-- ██║  ███╗██████╔╝
-- ██║   ██║██╔═══╝
-- ╚██████╔╝██║
--  ╚═════╝ ╚═╝
-- https://github.com/Robitx/gp.nvim

return {
  "robitx/gp.nvim",
  cond = not vim.g.vscode,
  config = function()
    require("gp").setup({
      chat_user_prefix = "→→", -- chat user prompt prefix
      chat_assistant_prefix = { "→→ ", "{{agent}} →→" }, -- chat assistant prompt prefix
      chat_free_cursor = true, -- don't move the cursor to the end of the buffer
      chat_confirm_delete = false, -- explicitly confirm deletion of a chat file
      command_prompt_prefix_template = "{{agent}} →→ ",
      providers = {
        openai = {
          disable = false,
			    endpoint = "https://api.openai.com/v1/chat/completions",
			    secret = { "op", "read", "--account", "my.1password.com", os.getenv("OPENAI_API_KEY_REFERENCE") },
		    },
        googleai = {
          disable = false,
			    endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
			    secret = { "op", "read", "--account", "my.1password.com", os.getenv("GOOGLEAI_API_KEY_REFERENCE") },
		    },
      },
      agents = {
        {
          provider = "openai",
          name = "ChatGPT4o",
          chat = true,
          command = false,
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "openai",
          name = "CodeGPT4o",
          chat = false,
          command = true,
          model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "googleai",
          name = "ChatGemini",
          chat = true,
          command = false,
          model = { model = "gemini-pro", temperature = 1.1, top_p = 1 },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "googleai",
          name = "CodeGemini",
          chat = false,
          command = true,
          model = { model = "gemini-pro", temperature = 0.8, top_p = 1 },
          system_prompt = require("gp.defaults").code_system_prompt,
        },
      },
    })
  end,
}
