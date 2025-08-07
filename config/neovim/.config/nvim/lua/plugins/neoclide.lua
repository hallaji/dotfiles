-- ███╗   ██╗███████╗ ██████╗  ██████╗██╗     ██╗██████╗ ███████╗
-- ████╗  ██║██╔════╝██╔═══██╗██╔════╝██║     ██║██╔══██╗██╔════╝
-- ██╔██╗ ██║█████╗  ██║   ██║██║     ██║     ██║██║  ██║█████╗
-- ██║╚██╗██║██╔══╝  ██║   ██║██║     ██║     ██║██║  ██║██╔══╝
-- ██║ ╚████║███████╗╚██████╔╝╚██████╗███████╗██║██████╔╝███████╗
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝╚══════╝╚═╝╚═════╝ ╚══════╝
-- https://github.com/neoclide/coc.nvim
-- https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
-- https://github.com/neoclide/coc.nvim/wiki/Language-servers
-- https://github.com/neoclide/jsonc.vim

return {
  {
    "neoclide/jsonc.vim",
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.g.coc_global_extensions = { -- List of COC extensions to install after starting the service
        'coc-tsserver',
        'coc-go',
        'coc-solargraph',
        'coc-pyright',
        'coc-json',
        'coc-yaml',
        'coc-html',
        'coc-css',
        'coc-cssmodules',
        'coc-prettier',
        'coc-eslint',
        'coc-marketplace',
        'coc-calc',
        'coc-docker',
        'coc-highlight',
        'coc-markdownlint',
      }

      -- Autocomplete
      function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      -- Use K to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
       if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end

      -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
      vim.api.nvim_create_augroup("CocGroup", {})
      vim.api.nvim_create_autocmd("CursorHold", {
          group = "CocGroup",
          command = "silent call CocActionAsync('highlight')",
          desc = "Highlight symbol under cursor on CursorHold"
      })

      -- Setup formatexpr specified filetype(s)
      vim.api.nvim_create_autocmd("FileType", {
          group = "CocGroup",
          pattern = "typescript,json",
          command = "setl formatexpr=CocAction('formatSelected')",
          desc = "Setup formatexpr specified filetype(s)."
      })

      -- Update signature help on jump placeholder
      vim.api.nvim_create_autocmd("User", {
          group = "CocGroup",
          pattern = "CocJumpPlaceholder",
          command = "call CocActionAsync('showSignatureHelp')",
          desc = "Update signature help on jump placeholder"
      })

      -- Add `:Format` command to format current buffer
      vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

      -- " Add `:Fold` command to fold current buffer
      vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

      -- Add `:OR` command for organize imports of the current buffer
      vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

      -- Add (Neo)Vim's native statusline support
      vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
    end,
  },
}
