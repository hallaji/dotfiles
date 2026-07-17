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
    local nav = {
      ["<C-h>"] = "TmuxNavigateLeft",
      ["<C-j>"] = "TmuxNavigateDown",
      ["<C-k>"] = "TmuxNavigateUp",
      ["<C-l>"] = "TmuxNavigateRight",
    }

    -- Re-map terminal-mode nav with <Cmd> (runs without leaving terminal mode); pass keys through to fzf.
    for key, cmd in pairs(nav) do
      vim.keymap.set("t", key, function()
        return vim.bo.filetype == "fzf" and key or ("<Cmd>" .. cmd .. "<CR>")
      end, { expr = true, silent = true, desc = cmd })
    end

    -- The plugin only maps normal/terminal mode; add visual/select so nav works with a selection.
    for key, cmd in pairs(nav) do
      vim.keymap.set({ "x", "s" }, key, "<Cmd>" .. cmd .. "<CR>", { silent = true, desc = cmd })
    end
  end,
}
