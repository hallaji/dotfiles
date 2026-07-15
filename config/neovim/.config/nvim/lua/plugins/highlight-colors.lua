-- ██╗  ██╗██╗ ██████╗ ██╗  ██╗██╗     ██╗ ██████╗ ██╗  ██╗████████╗
-- ██║  ██║██║██╔════╝ ██║  ██║██║     ██║██╔════╝ ██║  ██║╚══██╔══╝
-- ███████║██║██║  ███╗███████║██║     ██║██║  ███╗███████║   ██║
-- ██╔══██║██║██║   ██║██╔══██║██║     ██║██║   ██║██╔══██║   ██║
-- ██║  ██║██║╚██████╔╝██║  ██║███████╗██║╚██████╔╝██║  ██║   ██║
-- ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝
--  ██████╗ ██████╗ ██╗      ██████╗ ██████╗ ███████╗
-- ██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗██╔════╝
-- ██║     ██║   ██║██║     ██║   ██║██████╔╝███████╗
-- ██║     ██║   ██║██║     ██║   ██║██╔══██╗╚════██║
-- ╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║███████║
--  ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
-- https://github.com/brenoprata10/nvim-highlight-colors

return {
  "brenoprata10/nvim-highlight-colors",
  cond = not vim.g.vscode,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    render = "virtual", -- Swatch beside the value, don't recolor the text itself
    virtual_symbol = "●",
    virtual_symbol_position = "eow",
    virtual_symbol_prefix = " ",
    virtual_symbol_suffix = "",
    enable_hex = true,
    enable_short_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    enable_var_usage = true,
    enable_named_colors = false,
    enable_tailwind = false,
    exclude_filetypes = { "lazy", "mason", "startify", "snacks_dashboard" },
    exclude_buftypes = { "help", "terminal", "nofile", "prompt", "quickfix" },
  },
}
