
--  ██████╗ ██████╗
-- ██╔════╝ ██╔══██╗
-- ██║  ███╗██████╔╝
-- ██║   ██║██╔═══╝
-- ╚██████╔╝██║
--  ╚═════╝ ╚═╝
-- https://github.com/Robitx/gp.nvim

return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      openai_api_key = { "op", "read", "--account", "my.1password.com", os.getenv("OPENAI_API_KEY_REFERENCE") },
      chat_user_prefix = "》", -- chat user prompt prefix
      chat_assistant_prefix = { "》", "🤖 {{agent}} 》" }, -- chat assistant prompt prefix
      chat_free_cursor = true, -- don't move the cursor to the end of the buffer
      chat_confirm_delete = false, -- explicitly confirm deletion of a chat file
      command_prompt_prefix_template = "🤖 {{agent}} ~ ",
    })
  end,
}
