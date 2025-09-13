-- ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
-- ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
-- ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
-- ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
-- ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

vim.g.mapleader = ","                   -- set the leader key to comma
vim.g.maplocalleader = "\\"             -- set the local leader key to backslash
vim.g.loaded_perl_provider = 0          -- disable perl provider :help provider-perl

vim.opt.syntax = "enable"               -- enable syntax highlighting
vim.opt.spell = false                   -- enable spell checking
vim.opt.list = false                    -- hide whitespace characters
vim.opt.spelllang = "en_au"             -- set spell checking language
vim.opt.swapfile = false                -- disable swap files
vim.opt.cursorcolumn = false            -- disable cursor column
vim.opt.clipboard:append("unnamedplus") -- set clipboard to system clipboard

vim.wo.number = true                    -- show line numbers
vim.wo.relativenumber = true            -- show relative line numbers
vim.wo.colorcolumn = "80,120"           -- set color column
vim.wo.foldcolumn = "1"                 -- set fold column
vim.wo.cursorline = true                -- highlight current line
vim.wo.wrap = false                     -- disable line wrapping
vim.wo.signcolumn = "yes"               -- always show sign column

vim.o.encoding = "UTF-8"                -- set encoding
vim.o.ruler = true                      -- show cursor position
vim.o.cmdheight = 1                     -- set command line height
vim.o.mouse = "a"                       -- enable mouse support
vim.o.updatetime = 100                  -- faster completion (default is 4000)
vim.o.timeoutlen = 500                  -- faster completion (default is 1000)
vim.o.hidden = true                     -- enable background buffers (keep hidden buffers open)
vim.o.backspace = "indent,eol,start"    -- allow backspacing over everything in insert mode
vim.o.errorbells = false                -- disable error bells (beeping)
vim.o.visualbell = true                 -- enable visual bell (flash screen instead of beeping)
vim.o.hlsearch = true                   -- highlight search results by default
vim.o.incsearch = true                  -- incremental search (search as you type)
vim.o.splitbelow = true                 -- open horizontal splits below current window
vim.o.splitright = true                 -- open vertical splits to the right of current window
vim.o.showmode = true                   -- show mode in command line
vim.o.exrc = true                       -- enable local configurations (.nvimrc, .exrc, etc.) https://neovim.io/doc/user/options.html#'exrc'
vim.o.termguicolors = true              -- enable 24-bit RGB color

vim.cmd.colorscheme("catamaran")        -- set colorscheme
