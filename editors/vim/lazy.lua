
-- ██╗      █████╗ ███████╗██╗   ██╗
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝
-- ██║     ███████║  ███╔╝  ╚████╔╝
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝
-- ███████╗██║  ██║███████╗   ██║
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝
-- https://github.com/folke/lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- ┬┌─┐┌─┐┌┐┌┌─┐
  -- ││  │ ││││└─┐
  -- ┴└─┘└─┘┘└┘└─┘

  "nvim-tree/nvim-web-devicons", -- https://github.com/nvim-tree/nvim-web-devicons
  "ryanoasis/vim-devicons", -- https://github.com/ryanoasis/vim-devicons

  -- ┌┬┐┌─┐┌─┐┬  ┌─┐
  --  │ │ ││ ││  └─┐
  --  ┴ └─┘└─┘┴─┘└─┘

  {
    "folke/which-key.nvim", -- https://github.com/folke/which-key.nvim
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  "cocopon/colorswatch.vim", -- https://github.com/cocopon/colorswatch.vim
  "cocopon/inspecthi.vim", -- https://github.com/cocopon/inspecthi.vim
  "editorconfig/editorconfig-vim", -- https://github.com/editorconfig/editorconfig-vim
  "edkolev/tmuxline.vim", -- https://github.com/edkolev/tmuxline.vim
  "tpope/vim-surround", -- https://github.com/tpope/vim-surround
  "travisjeffery/vim-auto-mkdir", -- https://github.com/travisjeffery/vim-auto-mkdir
  "preservim/vimux", -- https://github.com/preservim/vimux
  "preservim/nerdcommenter", -- https://github.com/preservim/nerdcommenter
  "Yggdroot/indentLine", -- https://github.com/Yggdroot/indentLine
  "junegunn/limelight.vim", -- https://github.com/junegunn/limelight.vim
  "folke/zen-mode.nvim", -- https://github.com/folke/zen-mode.nvim
  "christoomey/vim-tmux-navigator", -- https://github.com/christoomey/vim-tmux-navigator
  "nvim-lua/plenary.nvim", -- https://github.com/nvim-lua/plenary.nvim
  "sindrets/diffview.nvim", -- https://github.com/sindrets/diffview.nvim
  "github/copilot.vim", -- https://github.com/github/copilot.vim
  "robitx/gp.nvim", -- https://github.com/Robitx/gp.nvim
  "declancm/cinnamon.nvim", -- https://github.com/declancm/cinnamon.nvim
  {
    "echasnovski/mini.nvim", -- https://github.com/echasnovski/mini.nvim
    version = "*"
  },
  {
    "iamcco/markdown-preview.nvim", -- https://github.com/iamcco/markdown-preview.nvim
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  }, -- https://github.com/folke/todo-comments.nvim
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  }, -- https://github.com/folke/trouble.nvim
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
  }, -- https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  }, -- https://github.com/nvim-lualine/lualine.nvim
  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("gitlinker").setup({
        message = false,
      })
    end,
  }, -- https://github.com/linrongbin16/gitlinker.nvim

  -- ┌─┐┌─┐┌─┐┬─┐┌─┐┬ ┬
  -- └─┐├┤ ├─┤├┬┘│  ├─┤
  -- └─┘└─┘┴ ┴┴└─└─┘┴ ┴

  "ctrlpvim/ctrlp.vim", -- https://github.com/ctrlpvim/ctrlp.vim
  "dyng/ctrlsf.vim", -- https://github.com/dyng/ctrlsf.vim
  "junegunn/fzf", -- https://github.com/junegunn/fzf
  "junegunn/fzf.vim", -- https://github.com/junegunn/fzf.vim
  {
    "ibhagwan/fzf-lua", -- https://github.com/ibhagwan/fzf-lua
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icon support
    config = function()
      require("fzf-lua").setup({}) -- calling `setup` is optional for customization
    end
  },


  -- ┌─┐─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐
  -- ├┤ ┌┴┬┘├─┘│  │ │├┬┘├┤
  -- └─┘┴ └─┴  ┴─┘└─┘┴└─└─┘

  "mhinz/vim-startify", -- https://github.com/mhinz/vim-startify
  "mcchrish/nnn.vim", -- https://github.com/mcchrish/nnn.vim
  "kyazdani42/nvim-tree.lua", -- https://github.com/kyazdani42/nvim-tree.lua


  -- ┌─┐┬┌┬┐
  -- │ ┬│ │
  -- └─┘┴ ┴

  "tpope/vim-fugitive", -- https://github.com/tpope/vim-fugitive
  "tpope/vim-rhubarb", -- https://github.com/tpope/vim-rhubarb
  "codeindulgence/vim-tig", -- https://github.com/codeindulgence/vim-tig
  "lewis6991/gitsigns.nvim", -- https://github.com/lewis6991/gitsigns.nvim

  -- ┌┬┐┌─┐┬  ┬┌─┐┬  ┌─┐┌─┐┌┬┐┌─┐┌┐┌┌┬┐
  --  ││├┤ └┐┌┘├┤ │  │ │├─┘│││├┤ │││ │
  -- ─┴┘└─┘ └┘ └─┘┴─┘└─┘┴  ┴ ┴└─┘┘└┘ ┴

  {
    "neoclide/coc.nvim", -- https://github.com/neoclide/coc.nvim
    branch = "release",
  },
  {
    "nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
    build = ":TSUpdate"
  },
  {
    "fatih/vim-go", -- https://github.com/fatih/vim-go
    build = ":GoUpdateBinaries"
  },
  "neoclide/jsonc.vim", -- https://github.com/neoclide/jsonc.vim
  "preservim/vim-markdown", -- https://github.com/preservim/vim-markdown

})
