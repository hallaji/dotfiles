
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
  },
})

wk.register({
  c = {
    name = "󰅺 Comment",
  },
}, { prefix = "<Leader>" })

-- ┌─┐─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
-- ├┤ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
-- └─┘┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─

wk.register({
  ["~"] = { ":NvimTreeFocus<CR>", " Nvim Tree" },
  ["-"] = { ":NnnPicker %:p:h<CR>", " NNN Picker" },
  ["`"] = { ":NnnExplorer %:p:h<CR>", " NNN Explorer" },
})

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
    name = "󰭻 GPT",
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
    name = "󰭻 GPT",
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

-- ┌─┐┬┌┬┐
-- │ ┬│ │
-- └─┘┴ ┴

wk.register({
  ["["] = {
    h = { ":Gitsigns prev_hunk<CR>", " Prev Hunk (Buffer)" },
  },
  ["]"] = {
    h = { ":Gitsigns next_hunk<CR>", " Next Hunk (Buffer)" },
  },
})

wk.register({
  ["<C-G>"] = { ":Git<CR>", " Fugitive" },
  ["<C-T>"] = { ":Tig<CR>", " Tig" },
  g = {
    name = " Git",
    R = { ":Gitsigns reset_buffer<CR>", "Reset Buffer" },
    S = { ":Gitsigns stage_buffer<CR>", "Stage Buffer" },
    b = { ":Gitsigns blame_line<CR>", "Blame" },
    c = { ":FzfLua git_bcommits<CR>", "Commits (Buffer)" },
    d = {
      name = " Diff View",
      c = { ":DiffviewClose<CR>", "Close" },
      f = { ":DiffviewToggleFiles<CR>", "Files" },
      h = { ":DiffviewFileHistory<CR>", "File History" },
      o = { ":DiffviewOpen<CR>", "Open" },
      r = { ":DiffviewRefresh<CR>", "Refresh" },
      t = { ":Gitsigns diffthis<CR>", "This" },
    },
    p = { ":Gitsigns preview_hunk<CR>", "Preview hunk" },
    q = { ":Gitsigns setqflist<CR>", "Quick Fix (Buffer)" },
    r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
    s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
    t = {
      name = " Toggle",
      b = { ":Gitsigns toggle_current_line_blame<CR>", "Blame" },
      d = { ":Gitsigns toggle_deleted<CR>", "Deleted" },
      l = { ":Gitsigns toggle_linehl<CR>", "Line Highlight" },
      n = { ":Gitsigns toggle_numhl<CR>", "Number Highlight" },
      s = { ":Gitsigns toggle_signs<CR>", "Signs" },
      w = { ":Gitsigns toggle_word_diff<CR>", "Word Diff" },
    },
    u = { ":Gitsigns undo_stage_hunk<CR>", "Unstage Hunk" },
    v = { ":Gitsigns select_hunk<CR>", "Select Hunk" },
  },
}, { prefix = "<Leader>" })

-- ┌┐ ┬ ┬┌─┐┌─┐┌─┐┬─┐
-- ├┴┐│ │├┤ ├┤ ├┤ ├┬┘
-- └─┘└─┘└  └  └─┘┴└─

vim.keymap.set('n', '<C-Q>', ':q<CR>') -- Close the current buffer
vim.keymap.set('i', '<C-Q>', '<Esc>:q<CR>') -- Exit insert mode and close the current buffer
vim.keymap.set('x', '<C-Q>', '<Esc>') -- Exit visual mode
vim.keymap.set('i', '<C-S>', '<C-O>:update<CR>') -- Save the current buffer
vim.keymap.set('n', '<C-S>', ':update<CR>') -- Save the current buffer

wk.register({
  ["<C-S>"] = { " Save" },
  ["<C-Q>"] = { "󰗼 Quit" },
})
wk.register({
  b = {
    name = " Buffer",
    Q = { ":qa<CR>", "Quit all" },
    c = { ":bd<CR>", "Close" },
    f = { ":bfirst<CR>", "First" },
    h = { ":Startify<CR>", "Home" },
    l = { ":blast<CR>", "Last" },
    n = { ":bnext<CR>", "Next" },
    p = { ":bprevious<CR>", "Previous" },
    q = { ":q<CR>", "Quit" },
    s = { ":update<CR>", "Save" },
  },
  q = { ":q<CR>", "󰗼 Quit" },
  Q = { ":qa<CR>", "󰗼 Quit all" },
}, { prefix = "<Leader>" })


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
    b = { ":FzfLua buffers<CR>", "Buffers" },
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
