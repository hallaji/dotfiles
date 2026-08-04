-- ███╗   ██╗███╗   ██╗███╗   ██╗
-- ████╗  ██║████╗  ██║████╗  ██║
-- ██╔██╗ ██║██╔██╗ ██║██╔██╗ ██║
-- ██║╚██╗██║██║╚██╗██║██║╚██╗██║
-- ██║ ╚████║██║ ╚████║██║ ╚████║
-- ╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═══╝
-- https://github.com/mcchrish/nnn.vim
-- https://github.com/mcchrish/nnn.vim/blob/master/doc/nnn.txt

return {
  "mcchrish/nnn.vim",
  cond = not vim.g.vscode,
  config = function()
    -- The plugin reads g:nnn#* (hash-suffixed) globals; vim.g.nnn_* sets a
    -- different variable it never looks at, so the config must index the
    -- literal "nnn#..." names.
    vim.g["nnn#set_default_mappings"] = 0 -- Disable default mappings
    vim.g["nnn#command"] = "nnn -AGHci" -- nnn command with the following flags
    vim.g["nnn#statusline"] = 0 -- Don't show the statusline
    vim.g["nnn#action"] = { -- Use the following mappings for the following actions:
      ["<c-t>"] = "tab split",
      ["<c-s>"] = "split",
      ["<c-v>"] = "vsplit",
    }
  end,
}
