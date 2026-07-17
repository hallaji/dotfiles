-- ████████╗███╗   ███╗██╗   ██╗██╗  ██╗
-- ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝
--    ██║   ██╔████╔██║██║   ██║ ╚███╔╝
--    ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗
--    ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
--    ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
-- ███╗   ██╗ █████╗ ██╗   ██╗██╗ ██████╗  █████╗ ████████╗ ██████╗ ██████╗
-- ████╗  ██║██╔══██╗██║   ██║██║██╔════╝ ██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
-- ██╔██╗ ██║███████║██║   ██║██║██║  ███╗███████║   ██║   ██║   ██║██████╔╝
-- ██║╚██╗██║██╔══██║╚██╗ ██╔╝██║██║   ██║██╔══██║   ██║   ██║   ██║██╔══██╗
-- ██║ ╚████║██║  ██║ ╚████╔╝ ██║╚██████╔╝██║  ██║   ██║   ╚██████╔╝██║  ██║
-- ╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
-- https://github.com/christoomey/vim-tmux-navigator

return {
  "christoomey/vim-tmux-navigator",
  cond = not vim.g.vscode,
  config = function()
    -- Re-map terminal-mode nav with <Cmd> (runs without leaving terminal mode); pass keys through to fzf.
    for key, cmd in pairs({
      ["<C-h>"] = "TmuxNavigateLeft",
      ["<C-j>"] = "TmuxNavigateDown",
      ["<C-k>"] = "TmuxNavigateUp",
      ["<C-l>"] = "TmuxNavigateRight",
    }) do
      vim.keymap.set("t", key, function()
        return vim.bo.filetype == "fzf" and key or ("<Cmd>" .. cmd .. "<CR>")
      end, { expr = true, silent = true, desc = cmd })
    end
  end,
}
