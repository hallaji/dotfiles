-- ███████╗███████╗███████╗
-- ██╔════╝╚══███╔╝██╔════╝
-- █████╗    ███╔╝ █████╗
-- ██╔══╝   ███╔╝  ██╔══╝
-- ██║     ███████╗██║
-- ╚═╝     ╚══════╝╚═╝
-- https://github.com/junegunn/fzf
-- https://github.com/junegunn/fzf.vim
-- https://github.com/ibhagwan/fzf-lua

return {
  {
    "junegunn/fzf.vim",
    cond = not vim.g.vscode,
  },
  {
    "junegunn/fzf",
    cond = not vim.g.vscode,
    config = function()
      vim.g.fzf_tags_command = 'ctags -R' -- Generate tags for the current project
      -- vim.g.fzf_command_prefix = '' -- Use the default prefix
    end,
  },
  {
    "ibhagwan/fzf-lua",
    cond = not vim.g.vscode,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icon support
    config = function()
      require("fzf-lua").setup({}) -- calling `setup` is optional for customization
    end,
  },
}
