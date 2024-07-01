
--  ██████╗  ██████╗
-- ██╔════╝ ██╔═══██╗
-- ██║  ███╗██║   ██║
-- ██║   ██║██║   ██║
-- ╚██████╔╝╚██████╔╝
--  ╚═════╝  ╚═════╝
-- https://github.com/fatih/vim-go

return {
  "fatih/vim-go",
  build = ":GoUpdateBinaries",
  config = function()
    vim.g.go_highlight_build_constraints = 1 -- Highlight build constraints
    vim.g.go_highlight_extra_types = 1 -- Highlight extra types
    vim.g.go_highlight_fields = 1 -- Highlight fields
    vim.g.go_highlight_functions = 1 -- Highlight functions
    vim.g.go_highlight_methods = 1 -- Highlight methods
    vim.g.go_highlight_operators = 1 -- Highlight operators
    vim.g.go_highlight_structs = 1 -- Highlight structs
    vim.g.go_highlight_types = 1 -- Highlight types

    vim.g.go_auto_sameids = 1 -- Automatically rename same ids
    vim.g.go_def_mapping_enabled = 1 -- Enable mapping to go to definition
    vim.g.go_fmt_command = "goimports" -- Use goimports to format
    vim.g.go_def_mode = 'gopls' -- Use gopls to go to definition
    vim.g.go_info_mode = 'gopls' -- Use gopls to show info

    vim.api.nvim_create_autocmd("BufWritePre", { -- Format on save
      pattern = "*.go",
      callback = function()
        vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
      end
    })
  end,
}
