
" ███████╗███████╗███╗   ██╗    ███╗   ███╗ ██████╗ ██████╗ ███████╗
" ╚══███╔╝██╔════╝████╗  ██║    ████╗ ████║██╔═══██╗██╔══██╗██╔════╝
"   ███╔╝ █████╗  ██╔██╗ ██║    ██╔████╔██║██║   ██║██║  ██║█████╗
"  ███╔╝  ██╔══╝  ██║╚██╗██║    ██║╚██╔╝██║██║   ██║██║  ██║██╔══╝
" ███████╗███████╗██║ ╚████║    ██║ ╚═╝ ██║╚██████╔╝██████╔╝███████╗
" ╚══════╝╚══════╝╚═╝  ╚═══╝    ╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝

" https://github.com/folke/zen-mode.nvim

lua << EOF
  require("zen-mode").setup {
    window = {
      backdrop = 0.95, -- shade the backdrop of the Zen window
      -- height and width can be:
      -- * an absolute number of cells when > 1
      -- * a percentage of the width / height of the editor when <= 1
      -- * a function that returns the width or the height
      width = 120, -- width of the Zen window
      height = 1, -- height of the Zen window
      options = {
        -- signcolumn = "no", -- disable signcolumn
        -- number = false, -- disable number column
        -- relativenumber = false, -- disable relative numbers
        -- cursorline = false, -- disable cursorline
        -- cursorcolumn = false, -- disable cursor column
        -- foldcolumn = "0", -- disable fold column
        -- list = false, -- disable whitespace characters
      },
    },
    plugins = {
      tmux = { enabled = true }, -- hiding tmux statusline
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function(win)

    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()

    end,
  }
EOF
