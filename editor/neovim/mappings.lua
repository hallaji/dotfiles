
-- ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
-- ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
-- ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
-- ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
-- ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
-- https://neovim.io/doc/user/map.html
-- https://neovim.io/doc/user/lua-guide.html#lua-guide-mappings

local wk = require("which-key")

-- ┌─┐┌─┐┌┐┌┌─┐┬─┐┌─┐┬
-- │ ┬├┤ │││├┤ ├┬┘├─┤│
-- └─┘└─┘┘└┘└─┘┴└─┴ ┴┴─┘

vim.keymap.set('x', 'p', 'pgvy') -- Recopy selected area on paste operation
vim.keymap.set('n', '<C-n>i', '<C-i>') -- Use <C-n>i to send <C-i> because <C-i> is same as <tab> when received by vim. Check Alacritty bindings for <C-i>
vim.keymap.set('n', 'Y', 'y$') -- Yank to the end of the line
vim.keymap.set('n', 'Q', '@q') -- Replay macro recording with Q
vim.keymap.set('v', '<Leader>p', '"*p') -- Paste from system clipboard in visual/select mode
vim.keymap.set('v', '<Leader>y', '"*y') -- Copy to system clipboard in visual/select mode

-- ┬  ┬┬┌─┐┬ ┬┌─┐┬
-- └┐┌┘│└─┐│ │├─┤│
--  └┘ ┴└─┘└─┘┴ ┴┴─┘

vim.keymap.set('', '<Leader>/', '<Plug>NERDCommenterToggle') -- Toggle comment
vim.keymap.set('n', '<Leader>d', ':nohlsearch<CR>') -- Remove search highlights
vim.keymap.set('n', '<Leader>m', '<Plug>MarkdownPreviewToggle') -- Preview markdown


wk.register({
  Q = { " Replay macro recording" },
  Y = { " Yank to the end of the line" },
  ["<C-X>"] = { " Whichkey" },
})

wk.register({
  ["/"] = { "󰆉 Comment" },
  p = { " Paste" },
  y = { " Yank" },
  c = {
    name = "󰅺 Comment",
  },
}, { mode="v", prefix = "<Leader>" })

wk.register({
  ["/"] = { "󰆉 Comment" },
  d = { "󰸱 Remove search highlights" },
  i = { " Toggle indent marks" },
  l = { "󱟇 Toggle limelight mode" },
  m = { "󰽛 Preview markdown" },
  e = { " Toggle relative numbers" },
  n = { " Toggle numbers" },
  r = { " Toggle rulers" },
  s = { "󰓆 Toggle spell check (en_au)" },
  t = { " Trim spaces" },
  w = { "󰖶 Wrap" },
  z = { "󰽏 Toggle zen mode" },
}, { prefix = "<Leader>" })

vim.keymap.set('n', '<Leader>t', [[:lua MiniTrailspace.trim()<CR>]], { silent = true }) -- Trim trailing whitespace
vim.keymap.set('n', '<Leader>z', [[:ZenMode<CR>]], { silent = true }) -- Enter Zen Mode
vim.keymap.set('n', '<C-X>', [[:WhichKey<CR>]]) -- Open WhichKey menu
vim.keymap.set('n', '<Leader>i', [[:IndentLinesToggle<CR>]], { silent = true }) -- Toggle Indent Lines
vim.keymap.set('n', '<Leader>l', [[:Limelight!!<CR>]], { silent = true }) -- Toggle Limelight
vim.keymap.set('n', '<Leader>e', [[:set relativenumber!<CR>]], { silent = true }) -- Toggle relative number
vim.keymap.set('n', '<Leader>n', [[:set norelativenumber \| set number!<CR>]], { silent = true }) -- Toggle line number and relative number
vim.keymap.set('n', '<Leader>r', [[:execute "set colorcolumn=" . (&colorcolumn == "" ? "80,120" : "")<CR>]], { silent = true }) -- Set colorcolumn to 80 and 120, or clear it if already set
vim.keymap.set('n', '<Leader>s', [[:set spell! spelllang=en_au<CR>]]) -- Toggle spell check with English (AU) as the language
vim.keymap.set('n', '<Leader>w', [[:set wrap! wrap?<CR>]]) -- Toggle line wrap

-- ┌┐┌┌─┐┬  ┬┬┌─┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤└┐┌┘││ ┬├─┤ │ ││ ││││
-- ┘└┘┴ ┴ └┘ ┴└─┘┴ ┴ ┴ ┴└─┘┘└┘

-- Jump between splits
vim.keymap.set('n', '<C-H>', '<C-W><C-H>') -- Move to the left split window using Ctrl+H
vim.keymap.set('n', '<C-J>', '<C-W><C-J>') -- Move to the bottom split window using Ctrl+J
vim.keymap.set('n', '<C-K>', '<C-W><C-K>') -- Move to the top split window using Ctrl+K
vim.keymap.set('n', '<C-L>', '<C-W><C-L>') -- Move to the right split window using Ctrl+L

-- Resize splits
vim.keymap.set('n', '<C-Left>', '<C-W><')
vim.keymap.set('n', '<C-Down>', '<C-W>-')
vim.keymap.set('n', '<C-Up>', '<C-W>+')
vim.keymap.set('n', '<C-Right>', '<C-W>>')

-- Cycle windows (splits)
vim.keymap.set('n', '<Tab>', '<C-W>w')
vim.keymap.set('n', '<S-Tab>', '<C-W>W')

-- Cycle buffers
vim.keymap.set('n', '[b', ':bprev<CR>')
vim.keymap.set('n', ']b', ':bnext<CR>')

-- Cycle tabs
vim.keymap.set('n', '[t', ':tabp<CR>')
vim.keymap.set('n', ']t', ':tabn<CR>')

wk.register({
  ["<C-H>"] = { " Go to left window" },
  ["<C-J>"] = { " Go to down window" },
  ["<C-K>"] = { " Go to up window" },
  ["<C-L>"] = { " Go to right window" },
  ["<C-\\>"] = { " Previous window" },
  ["<C-Left>"] = { " Resize width" },
  ["<C-Down>"] = { " Resize height" },
  ["<C-Up>"] = { " Resize height" },
  ["<C-Right>"] = { "  Resize width" },
  ["<Tab>"] = { "󱞣 Circle window forward" },
  ["<S-Tab>"] = { "󱞡 Circle window backward" },
  ["["] = {
    b = { " Prev buffer" },
    t = { " Prev tab" },
  },
  ["]"] = {
    b = { " Next buffer" },
    t = { " Next tab" },
  }
})

wk.register({
  c = {
    name = "󰅺 Comment",
  },
}, { prefix = "<Leader>" })

-- ┌─┐┌─┐┌─┐┬┬  ┌─┐┌┬┐
-- │  │ │├─┘││  │ │ │
-- └─┘└─┘┴  ┴┴─┘└─┘ ┴

wk.register({
  p = {
    name = " Copilot",
    a = { ":Copilot panel<CR>", "Panel" },
    d = { ":Copilot disable<CR>", "Disable" },
    e = { ":Copilot enable<CR>", "Enable" },
    g = { "<Plug>(copilot-suggest)", "Suggest" },
    i = { ":Copilot auth<CR>", "Sign In" },
    m = { "<Plug>(copilot-dismiss)", "Dismiss Suggestion" },
    n = { "<Plug>(copilot-next)", "Next Suggestion" },
    o = { ":Copilot signout<CR>", "Sign Out" },
    p = { "<Plug>(copilot-previous)", "Previous Suggestion" },
    r = { ":Copilot restart<CR>", "Restart" },
    s = { ":Copilot status<CR>", "Status" },
    u = { ":Copilot setup<CR>", "Setup" },
    v = { ":Copilot version<CR>", "Version" },
  }
}, { prefix = "<Leader>" })

-- ┌─┐┌─┐┌┬┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
-- │ ┬├─┘ │   ├─┘├┬┘│ ││││├─┘ │
-- └─┘┴   ┴   ┴  ┴└─└─┘┴ ┴┴   ┴

wk.register({
  t = {
    name = "󰭻 GPT Prompt",
    c = { ":<C-u>'<,'>GpChatNew<CR>", "Visual Chat New" },
    p = { ":<C-u>'<,'>GpChatPaste<CR>", "Visual Chat Paste" },
    t = { ":<C-u>'<,'>GpChatToggle<CR>", "Visual Toggle Chat" },

    ["<C-x>"] = { ":<C-u>'<,'>GpChatNew split<CR>", "Visual Chat New split" },
    ["<C-v>"] = { ":<C-u>'<,'>GpChatNew vsplit<CR>", "Visual Chat New vsplit" },
    ["<C-t>"] = { ":<C-u>'<,'>GpChatNew tabnew<CR>", "Visual Chat New tabnew" },

    r = { ":<C-u>'<,'>GpRewrite<CR>", "Visual Rewrite" },
    a = { ":<C-u>'<,'>GpAppend<CR>", "Visual Append (after)" },
    b = { ":<C-u>'<,'>GpPrepend<CR>", "Visual Prepend (before)" },
    i = { ":<C-u>'<,'>GpImplement<CR>", "Implement selection" },

    g = {
      name = "generate into new ..",
      p = { ":<C-u>'<,'>GpPopup<CR>", "Visual Popup" },
      e = { ":<C-u>'<,'>GpEnew<CR>", "Visual GpEnew" },
      n = { ":<C-u>'<,'>GpNew<CR>", "Visual GpNew" },
      v = { ":<C-u>'<,'>GpVnew<CR>", "Visual GpVnew" },
      t = { ":<C-u>'<,'>GpTabnew<CR>", "Visual GpTabnew" },
    },

    n = { "<CMD>GpNextAgent<CR>", "Next Agent" },
    s = { "<CMD>GpStop<CR>", "GpStop" },
    x = { ":<C-u>'<,'>GpContext<CR>", "Visual GpContext" },

    w = {
      name = "Whisper",
      w = { ":<C-u>'<,'>GpWhisper<CR>", "Whisper" },
      r = { ":<C-u>'<,'>GpWhisperRewrite<CR>", "Whisper Rewrite" },
      a = { ":<C-u>'<,'>GpWhisperAppend<CR>", "Whisper Append (after)" },
      b = { ":<C-u>'<,'>GpWhisperPrepend<CR>", "Whisper Prepend (before)" },
      p = { ":<C-u>'<,'>GpWhisperPopup<CR>", "Whisper Popup" },
      e = { ":<C-u>'<,'>GpWhisperEnew<CR>", "Whisper Enew" },
      n = { ":<C-u>'<,'>GpWhisperNew<CR>", "Whisper New" },
      v = { ":<C-u>'<,'>GpWhisperVnew<CR>", "Whisper Vnew" },
      t = { ":<C-u>'<,'>GpWhisperTabnew<CR>", "Whisper Tabnew" },
    },
    },
}, {
  mode = "v",
  prefix = "<Leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

wk.register({
    t = {
    name = "󰭻 GPT Prompt",
    c = { "<CMD>GpChatNew<CR>", "New Chat" },
    t = { "<CMD>GpChatToggle<CR>", "Toggle Chat" },
    f = { "<CMD>GpChatFinder<CR>", "Chat Finder" },

    ["<C-x>"] = { "<CMD>GpChatNew split<CR>", "New Chat split" },
    ["<C-v>"] = { "<CMD>GpChatNew vsplit<CR>", "New Chat vsplit" },
    ["<C-t>"] = { "<CMD>GpChatNew tabnew<CR>", "New Chat tabnew" },

    r = { "<CMD>GpRewrite<CR>", "Inline Rewrite" },
    a = { "<CMD>GpAppend<CR>", "Append (after)" },
    b = { "<CMD>GpPrepend<CR>", "Prepend (before)" },

    g = {
      name = "generate into new ..",
      p = { "<CMD>GpPopup<CR>", "Popup" },
      e = { "<CMD>GpEnew<CR>", "GpEnew" },
      n = { "<CMD>GpNew<CR>", "GpNew" },
      v = { "<CMD>GpVnew<CR>", "GpVnew" },
      t = { "<CMD>GpTabnew<CR>", "GpTabnew" },
    },

    n = { "<CMD>GpNextAgent<CR>", "Next Agent" },
    s = { "<CMD>GpStop<CR>", "GpStop" },
    x = { "<CMD>GpContext<CR>", "Toggle GpContext" },

    w = {
      name = "Whisper",
      w = { "<CMD>GpWhisper<CR>", "Whisper" },
      r = { "<CMD>GpWhisperRewrite<CR>", "Whisper Inline Rewrite" },
      a = { "<CMD>GpWhisperAppend<CR>", "Whisper Append (after)" },
      b = { "<CMD>GpWhisperPrepend<CR>", "Whisper Prepend (before)" },
      p = { "<CMD>GpWhisperPopup<CR>", "Whisper Popup" },
      e = { "<CMD>GpWhisperEnew<CR>", "Whisper Enew" },
      n = { "<CMD>GpWhisperNew<CR>", "Whisper New" },
      v = { "<CMD>GpWhisperVnew<CR>", "Whisper Vnew" },
      t = { "<CMD>GpWhisperTabnew<CR>", "Whisper Tabnew" },
    },
  },
}, {
  mode = "n",
  prefix = "<Leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- ┌┐ ┬ ┬┌─┐┌─┐┌─┐┬─┐
-- ├┴┐│ │├┤ ├┤ ├┤ ├┬┘
-- └─┘└─┘└  └  └─┘┴└─

vim.keymap.set('i', '<C-Q>', '<Esc>:q<CR>') -- Exit insert mode and close the current buffer
vim.keymap.set('i', '<C-S>', '<C-O>:update<CR>') -- Save the current buffer
vim.keymap.set('n', '<C-Q>', ':q<CR>') -- Close the current buffer
vim.keymap.set('n', '<C-S>', ':update<CR>') -- Save the current buffer
vim.keymap.set('n', '<Leader>q', ':q!<CR>') -- Forcefully quit (discard changes)
vim.keymap.set('n', '<Leader>Q', ':qa!<CR>') -- Forcefully quit all (discard changes)
vim.keymap.set('n', '<Leader>bQ', ':qa!<CR>') -- Forcefully quit all (discard changes)
vim.keymap.set('n', '<Leader>bc', ':bd<CR>') -- Close the current buffer
vim.keymap.set('n', '<Leader>bf', ':bfirst<CR>') -- Go to the first buffer
vim.keymap.set('n', '<Leader>bh', ':Startify<CR>') -- Open Startify
vim.keymap.set('n', '<Leader>bl', ':blast<CR>') -- Go to the last buffer
vim.keymap.set('n', '<Leader>bn', ':bnext<CR>') -- Go to the next buffer
vim.keymap.set('n', '<Leader>bp', ':bprevious<CR>') -- Go to the previous buffer
vim.keymap.set('n', '<Leader>bq', ':q<CR>') -- Close the current buffer
vim.keymap.set('n', '<Leader>bs', ':update<CR>') -- Save the current buffer
vim.keymap.set('x', '<C-Q>', '<Esc>') -- Exit visual mode

wk.register({
  ["<C-S>"] = { " Save" },
  ["<C-Q>"] = { "󰗼 Quit" },
})
wk.register({
  b = {
    name = " Buffer",
    c = { "󰅙 Close" },
    f = { " First" },
    h = { "󰟒 Home" },
    l = { " Last" },
    n = { " Next" },
    p = { " Previous" },
    q = { "󰗼 Quit" },
    Q = { "󰗼 Quit all" },
    s = { " Save" },
  },
  q = { "󰗼 Quit" },
  Q = { "󰗼 Quit all" },
}, { prefix = "<leader>" })

-- ┌─┐┌─┐┌─┐┌┐┌
-- │ │├─┘├┤ │││
-- └─┘┴  └─┘┘└┘

vim.keymap.set('n', '<Leader>od', ':tabedit $DOTFILES<CR>') -- Open a new tab with the $DOTFILES directory

wk.register({
  o = {
    name = " Open",
    d = { "Dotfiles" },
  },
}, { prefix = "<leader>" })

-- ┌─┐┬┌┐┌┌┬┐
-- ├┤ ││││ ││
-- └  ┴┘└┘─┴┘

vim.keymap.set('i', '<C-f>', '<Esc>:FzfLua<CR>') -- Open FzfLua in insert mode
vim.keymap.set('n', '<C-f>', ':FzfLua<CR>') -- Open FzfLua in normal mode
vim.keymap.set('x', '<C-f>', '<Esc>:FzfLua<CR>') -- Open FzfLua in visual mode
vim.keymap.set('n', '<leader>F', '<Plug>CtrlSFPrompt') -- Trigger CtrlSF prompt (provided by a plugin)
vim.keymap.set('n', '<leader>f', ':FzfLua<CR>') -- Open FzfLua in normal mode
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>') -- Open FzfLua for buffers in normal mode

wk.register({
  ["<C-F>"] = { " Spotlight" },
})
wk.register({
  f = {
    name = " Find",
    b = { " Buffers" },
  },
  F = { "󰈞 Find/Replace" },
}, { prefix = "<leader>" })

-- ┬─┐┌─┐┌─┐┬  ┌─┐┌─┐┌─┐
-- ├┬┘├┤ ├─┘│  ├─┤│  ├┤
-- ┴└─└─┘┴  ┴─┘┴ ┴└─┘└─┘

vim.keymap.set('n', '<Leader>rc', ':CtrlSFClearHL<CR>') -- Clear CtrlSF highlights
vim.keymap.set('n', '<Leader>rf', ':CtrlSFFocus<CR>') -- Focus CtrlSF window
vim.keymap.set('n', '<Leader>rl', '<Plug>CtrlSFPwordExec') -- Execute CtrlSF word motion
vim.keymap.set('n', '<Leader>ro', ':CtrlSFOpen<CR>') -- Open CtrlSF
vim.keymap.set('n', '<Leader>rp', '<Plug>CtrlSFPrompt') -- Execute CtrlSF prompt
vim.keymap.set('n', '<Leader>rs', '<Plug>CtrlSFVwordExec') -- Execute CtrlSF visual word motion
vim.keymap.set('n', '<Leader>rt', ':CtrlSFToggle<CR>') -- Toggle CtrlSF
vim.keymap.set('n', '<Leader>ru', ':CtrlSFUpdate<CR>') -- Update CtrlSF index
vim.keymap.set('n', '<Leader>rw', '<Plug>CtrlSFCwordExec') -- Execute CtrlSF word completion
vim.keymap.set('n', '<Leader>rz', '<Plug>CtrlSFCCwordExec') -- Execute CtrlSF CamelCase word completion

wk.register({
  r = {
    name = " Find/Replace",
    c = { "Clear Highlight" },
    f = { "Focus Window" },
    l = { "Last Search" },
    o = { "Open Window" },
    p = { "Prompt" },
    s = { "Selected" },
    t = { "Toggle Window" },
    u = { "Update Last Results" },
    w = { "Word" },
    z = { "Word Plus Boundary" },
  },
}, { prefix = "<leader>" })

-- ┌─┐─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
-- ├┤ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
-- └─┘┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─

vim.keymap.set('n', '_', ':Explore<CR>') -- Open Netrw
vim.keymap.set('n', '~', ':NvimTreeFocus<CR>') -- Focus on NvimTree
vim.keymap.set('n', '-', ':NnnPicker %:p:h<CR>') -- Open NnnPicker in the current directory
vim.keymap.set('n', '`', ':NnnExplorer %:p:h<CR>') -- Open NnnExplorer in the current directory

wk.register({
  ["_"] = { " Netrw" },
  ["~"] = { " Nvim Tree" },
  ["-"] = { " NNN Picker" },
  ["`"] = { " NNN Explorer" },
})

-- ┌─┐┬┌┬┐
-- │ ┬│ │
-- └─┘┴ ┴

vim.keymap.set('n', '<Leader>gR', ':Gitsigns reset_buffer<CR>') -- Reset buffer with Gitsigns
vim.keymap.set('n', '<Leader>gS', ':Gitsigns stage_buffer<CR>') -- Stage buffer with Gitsigns
vim.keymap.set('n', '<Leader>gb', ':Gitsigns blame_line<CR>') -- Blame line with Gitsigns
vim.keymap.set('n', '<leader>gc', ':FzfLua git_bcommits<CR>') -- Open FzfLua for Git blame commits
vim.keymap.set('n', '<Leader>gdc', ':DiffviewClose<CR>') -- Close Diffview
vim.keymap.set('n', '<Leader>gdf', ':DiffviewToggleFiles<CR>') -- Toggle Diffview file list
vim.keymap.set('n', '<Leader>gdh', ':DiffviewFileHistory<CR>') -- Open Diffview file history
vim.keymap.set('n', '<Leader>gdo', ':DiffviewOpen<CR>') -- Open Diffview
vim.keymap.set('n', '<Leader>gdr', ':DiffviewRefresh<CR>') -- Refresh Diffview
vim.keymap.set('n', '<Leader>gdt', ':Gitsigns diffthis<CR>') -- Gitsigns diffthis
vim.keymap.set('n', '<Leader>ge', ':Tig<CR>') -- Open Tig
vim.keymap.set('n', '<Leader>gp', ':Gitsigns preview_hunk<CR>') -- Preview Gitsigns hunk
vim.keymap.set('n', '<Leader>gq', ':Gitsigns setqflist<CR>:') -- Set Gitsigns quickfix list
vim.keymap.set('n', '<Leader>gr', ':Gitsigns reset_hunk<CR>') -- Reset Gitsigns hunk
vim.keymap.set('n', '<Leader>gs', ':Gitsigns stage_hunk<CR>') -- Stage Gitsigns hunk
vim.keymap.set('n', '<Leader>gts', ':Gitsigns toggle_signs<CR>') -- Toggle Gitsigns signs
vim.keymap.set('n', '<Leader>gtd', ':Gitsigns toggle_deleted<CR>') -- Toggle Gitsigns deleted signs
vim.keymap.set('n', '<Leader>gtb', ':Gitsigns toggle_current_line_blame<CR>') -- Toggle Gitsigns current line blame
vim.keymap.set('n', '<Leader>gtw', ':Gitsigns toggle_word_diff<CR>') -- Toggle Gitsigns word diff
vim.keymap.set('n', '<Leader>gtl', ':Gitsigns toggle_linehl<CR>') -- Toggle Gitsigns line highlight
vim.keymap.set('n', '<Leader>gtn', ':Gitsigns toggle_numhl<CR>') -- Toggle Gitsigns number highlight
vim.keymap.set('n', '<Leader>gu', ':Gitsigns undo_stage_hunk<CR>') -- Undo Gitsigns stage hunk
vim.keymap.set('n', '<Leader>gv', ':Gitsigns select_hunk<CR>') -- Select Gitsigns hunk
vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>') -- Go to previous Gitsigns hunk
vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>') -- Go to next Gitsigns hunk
vim.keymap.set('n', '<C-G>', ':Git<CR>') -- Open Git command line

wk.register({
  ["<C-G>"] = { " Fugitive" },
  ["["] = {
    h = { " Prev hunk (buffer)" },
  },
  ["]"] = {
    h = { " Next hunk (buffer)" },
  },
})
wk.register({
  g = {
    name = " Git",
    R = { " Reset buffer" },
    S = { " Stage buffer" },
    b = { " Blame" },
    c = { " Commits (buffer)" },
    d = {
      name = " Diff view",
      c = { " Close" },
      f = { " Files" },
      h = { "󰋚 File history" },
      o = { " Open" },
      r = { " Refresh" },
      t = { " This" },
    },
    e = { " Explorer" },
    p = { " Preview hunk" },
    q = { "󰁨 Quick fix (buffer)" },
    r = { "󰝳 Reset hunk" },
    s = { " Stage hunk" },
    t = {
      name = " Toggle",
      s = " Signs",
      d = " Deleted",
      b = " Blame",
      w = " Word diff",
      l = " Line highlight",
      n = " Number highlight",
    },
    u = { " Unstage hunk" },
    v = { "󰒆 Select hunk" },
  },
}, { prefix = "<leader>" })

-- ┌─┐┌─┐┌─┐
-- ├┤ ┌─┘├┤
-- └  └─┘└

-- @TODO: fzf mappings
-- vim.keymap.set('n', '<leader><tab>', '<Plug>(fzf-maps-n)') -- Open Fzf-maps-n (normal mode)
-- vim.keymap.set('x', '<leader><tab>', '<Plug>(fzf-maps-x)') -- Open Fzf-maps-x (visual mode)
-- vim.keymap.set('o', '<leader><tab>', '<Plug>(fzf-maps-o)') -- Open Fzf-maps-o (operator-pending mode)


-- ┌─┐┌─┐┌─┐
-- │  │ ││
-- └─┘└─┘└─┘

-- GoTo code navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)') -- Go to definition
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)') -- Go to type definition
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)') -- Go to implementation
vim.keymap.set('n', 'gr', '<Plug>(coc-references)') -- Find references

-- @TODO `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)') -- Go to previous diagnostic
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)') -- Go to next diagnostic

wk.register({
  ["[g"] = { " Prev diagnostic" },
  ["]g"] = { " Next diagnostic" },
  g = {
    d = { " Definition" },
    y = { " Type definition" },
    i = { " Implementation" },
    r = { " Reference" },
  },
})
