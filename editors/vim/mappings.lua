
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

vim.keymap.set('n', '<C-n>i', '<C-i>') -- Use <C-n>i to send <C-i> because <C-i> is same as <tab> when received by vim. Check Alacritty bindings for <C-i>
vim.keymap.set('x', 'p', 'pgvy') -- Recopy selected area on paste operation
vim.keymap.set('v', '<Leader>p', '"*p') -- Paste from system clipboard in visual/select mode
vim.keymap.set('v', '<Leader>y', '"*y') -- Copy to system clipboard in visual/select mode

-- Insert mode
wk.register({
  ["<C-X>"] = { "<C-O>:WhichKey<CR>", " Whichkey" },
}, { mode = "i" })

-- Normal mode
wk.register({
  ["<C-X>"] = { ":WhichKey<CR>", " Whichkey" },
  ["<C-W>"] = { "<C-W>", " Window" },
  ["<C-U>"] = { "<C-U>", "󰶣 Scroll Up" },
  ["<C-D>"] = { "<C-D>", "󰶡 Scroll Down" },
  ["<C-P>"] = { "<Plug>(ctrlp)", "󰀶 CtrlP Finder" },
  ["["] = { name = "󰮳 Previous" },
  ["]"] = { name = "󰮱 Next" },
  ["<"] = { name = "󰉵 Indent Left" },
  [">"] = { name = "󰉶 Indent Right" },
  ["<Leader>"] = { name = "󰸥 Leader" },
  Q = { "@q", " Replay Macro Recording" },
  Y = { "y$", " Yank to the End" },
}, { mode = "n" })

-- Normal mode with leader key
wk.register({
  ["<Space>"] = { ":nohlsearch<CR>", "󰸱 Clear Search Highlights" },
  ["/"] = { "<Plug>NERDCommenterToggle", "󰆉 Comment" },
  e = { ":set relativenumber!<CR>", " Relative Line Numbers" },
  h = { ":checkhealth<CR>", "󰩂 Check Health" },
  I = { ":IndentLinesToggle<CR>", " Indent Marks" },
  l = { ":Limelight!!<CR>", "󱟇 Limelight Mode" },
  m = { "<Plug>MarkdownPreviewToggle", "󰽛 Markdown Preview" },
  n = { ":set norelativenumber number!<CR>", " Line Numbers" },
  r = { function() vim.wo.colorcolumn = vim.wo.colorcolumn == "" and "80,120" or "" end, " Rulers" },
  S = { ":set spell! spelllang=en_au<CR>", "󰓆 Spell Check" },
  T = { ":lua MiniTrailspace.trim()<CR>", " Trim Trailing Spaces" },
  w = { ":set wrap! wrap?<CR>", "󰖶 Wrap Mode" },
  z = { ":ZenMode<CR>", "󰽏 Zen Mode" },
}, { mode = "n", prefix = "<Leader>" })

-- Visual or select mode with leader key
wk.register({
  ["<Space>"] = { ":nohlsearch<CR>", "󰸱 Clear Search Highlights" },
  ["/"] = { "<Plug>NERDCommenterToggle", "󰆉 Comment" },
  p = { " Paste" },
  y = { " Copy" },
  c = {
    name = "󰅺 Comment",
  },
}, { mode="v", prefix = "<Leader>" })

-- ┌┐┌┌─┐┬  ┬┬┌─┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤└┐┌┘││ ┬├─┤ │ ││ ││││
-- ┘└┘┴ ┴ └┘ ┴└─┘┴ ┴ ┴ ┴└─┘┘└┘

-- Normal mode
wk.register({
  -- Handled by https://github.com/christoomey/vim-tmux-navigator
  ["<C-H>"] = { " Go to Left Window" },
  ["<C-J>"] = { " Go to Down Window" },
  ["<C-K>"] = { " Go to Up Window" },
  ["<C-L>"] = { " Go to Right Window" },
  ["<C-\\>"] = { "󰮳 Go to Recent Window" },

  ["<C-Left>"] = { "<C-W><", " Resize Width" },
  ["<C-Down>"] = { "<C-W>-", " Resize Height" },
  ["<C-Up>"] = { "<C-W>+", " Resize Height" },
  ["<C-Right>"] = { "<C-W>>", "  Resize Width" },

  ["<Tab>"] = { "<C-W>w", "󱞣 Circle Window Forward" },
  ["<S-Tab>"] = { "<C-W>W", "󱞡 Circle Window Backward" },

  ["["] = {
    b = { ":bprev<CR>", " Previous Buffer" },
    t = { ":tabp<CR>", " Previous Tab" },
  },
  ["]"] = {
    b = { ":bnext<CR>", " Next Buffer" },
    t = { ":tabn<CR>", " Next Tab" },
  },
}, { mode = "n" })

-- Normal mode with leader key
wk.register({
  c = {
    name = "󰅺 Comment",
  },
}, { mode = "n", prefix = "<Leader>" })

-- ┌─┐─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
-- ├┤ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
-- └─┘┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─

-- Normal mode
wk.register({
  ["~"] = { ":NvimTreeFocus<CR>", " Nvim Tree" },
  ["-"] = { ":NnnPicker %:p:h<CR>", " NNN Picker" },
  ["`"] = { ":NnnExplorer %:p:h<CR>", " NNN Explorer" },
}, { mode = "n" })

-- ┌─┐┌─┐┌─┐┬┬  ┌─┐┌┬┐
-- │  │ │├─┘││  │ │ │
-- └─┘└─┘┴  ┴┴─┘└─┘ ┴

-- Insert mode
wk.register({
  ["<C-L>"] = { "<Plug>(copilot-accept-line)", "󰿄 Accept Line Suggestion" },
  ["<C-H>"] = { "<Plug>(copilot-accept-word)", "󰿄 Accept Word Suggestion" },
}, { mode = "i" })

-- Insert mode with expression
wk.register({
  ["<C-E>"] = { [[copilot#Accept("\\<CR>")]], "󰿄 Accept Copilot Suggestion" },
}, { mode = "i", expr = true })

-- Normal mode with leader key
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
}, { mode = "n", prefix = "<Leader>" })

-- ┌─┐┌─┐┌┬┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
-- │ ┬├─┘ │   ├─┘├┬┘│ ││││├─┘ │
-- └─┘┴   ┴   ┴  ┴└─└─┘┴ ┴┴   ┴

-- Normal mode with leader key
wk.register({
  x = {
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
}, { mode = "n", prefix = "<Leader>" })

-- Visual or select mode with leader key
wk.register({
  x = {
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
}, { mode = "v", prefix = "<Leader>" })

-- ┌─┐┬┌┬┐
-- │ ┬│ │
-- └─┘┴ ┴

-- Normal mode
wk.register({
  ["["] = {
    h = { ":Gitsigns prev_hunk<CR>", " Prev Hunk (Buffer)" },
  },
  ["]"] = {
    h = { ":Gitsigns next_hunk<CR>", " Next Hunk (Buffer)" },
  },
}, { mode = "n" })

-- Normal mode with leader key
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
    l = {
      name = "󰌷 Link",
      c = { ":GitLink<CR>", " Copy Code Permalink" },
      o = { ":GitLink!<CR>", " Open Code Permalink" },
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
}, { mode = "n", prefix = "<Leader>" })

-- Visual or select mode with leader key
wk.register({
  g = {
    name = " Git",
    l = {
      name = "󰌷 Link",
      c = { ":<C-u>'<,'>GitLink<CR>", " Copy Code Permalink" },
      o = { ":<C-u>'<,'>GitLink!<CR>", " Open Code Permalink" },
    },
  },
}, { mode="v", prefix = "<Leader>" })

-- ┌┐ ┬ ┬┌─┐┌─┐┌─┐┬─┐
-- ├┴┐│ │├┤ ├┤ ├┤ ├┬┘
-- └─┘└─┘└  └  └─┘┴└─

-- Normal mode
wk.register({
  ["<C-S>"] = { ":update<CR>", " Save" },
  ["<C-Q>"] = { ":q<CR>", "󰗼 Quit" },
}, { mode = "n" })

-- Insert mode
wk.register({
  ["<C-S>"] = { "<C-O>:update<CR>", " Save" },
  ["<C-Q>"] = { "<Esc>:q<CR>", "󰗼 Quit" },
}, { mode = "i" })

-- Visual or select mode
wk.register({
  ["<C-Q>"] = { "<Esc>", "󰗼 Quit" },
}, { mode = "v" })

-- Normal mode with leader key
wk.register({
  b = {
    name = " Buffer",
    Q = { ":qa<CR>", "Quit all" },
    a = { ":b#<CR>", "Alternate" },
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
}, { mode = "n", prefix = "<Leader>" })

-- ┌─┐┌─┐┌─┐   ┬   ┌─┐┌┬┐┬─┐┬  ┌─┐┌─┐
-- ├┤ ┌─┘├┤   ┌┼─  │   │ ├┬┘│  └─┐├┤
-- └  └─┘└    └┘   └─┘ ┴ ┴└─┴─┘└─┘└
-- https://github.com/dyng/ctrlsf.vim

-- Normal mode with leader key
wk.register({
  ["<C-F>"] = { ":FzfLua<CR>", "󰀶 Fuzzy Finder" },
  f = {
    name = " Find & Replace",
    ["<Space>"] = { ":CtrlSFClearHL<CR>", "Clear Highlights" },
    c = { ":CtrlSFClose<CR>", "Close" },
    f = { ":CtrlSFFocus<CR>", "Focus" },
    l = { "<Plug>CtrlSFPwordPath", "Prompt Last Pattern" },
    o = { ":CtrlSFOpen<CR>", "Open" },
    p = { ":CtrlSF -hidden ", "Prompt" },
    s = { ":CtrlSFStop<CR>", "Stop Search" },
    t = { ":CtrlSFToggle<CR>", "Toggle" },
    u = { ":CtrlSFUpdate<CR>", "Update Results" },
    w = { "<Plug>CtrlSFCwordPath", "Prompt Under Cursor" },
    x = { "<Plug>CtrlSFCCwordPath", "Prompt Under Cursor with Boundary" },
  },
  s = {
    name = "󰓈 Spotlight",
    b = { ":FzfLua buffers<CR>", "Buffers" },
  },
}, { mode = "n", prefix = "<Leader>", silent = false })

-- Visual or select mode with leader key
wk.register({
  f = {
    name = " Find & Replace",
    e = { "<Plug>CtrlSFVwordExec", "Find Selected Area" },
    v = { "<Plug>CtrlSFVwordPath", "Prompt Selected Area" },
  },
}, { mode = "v", prefix = "<Leader>", silent = false })

-- ┌┬┐┌─┐┌┬┐┌─┐  ┌─┐┌─┐┌┬┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐
--  │ │ │ │││ │  │  │ │││││││├┤ │││ │ └─┐
--  ┴ └─┘─┴┘└─┘  └─┘└─┘┴ ┴┴ ┴└─┘┘└┘ ┴ └─┘

-- Normal mode
wk.register({
  ["[o"] = { function() require("todo-comments").jump_prev() end, " Previous ToDo" },
  ["]o"] = { function() require("todo-comments").jump_next() end, " Next ToDo" },
}, { mode = "n" })

-- Normal mode with leader key
wk.register({
  ["<C-O>"] = { ":Telescope<CR>", "󰀶 Telescope" },
  t = {
    name = " ToDo",
    l = { ":TodoLocList<CR>", "Location List" },
    q = { ":TodoQuickFix<CR>", "Quick Fix List" },
    s = { ":TodoTelescope<CR>", "Search with Telescope" },
    t = { ":TodoTrouble<CR>", "Trouble List" },
  },
}, { mode = "n", prefix = "<Leader>" })

-- ┌┬┐┬─┐┌─┐┬ ┬┌┐ ┬  ┌─┐
--  │ ├┬┘│ ││ │├┴┐│  ├┤
--  ┴ ┴└─└─┘└─┘└─┘┴─┘└─┘

-- Normal mode with leader key
wk.register({
  ["<C-L>"] = { ":Trouble<CR>", " Trouble" },
  e = {
    name = " Trouble",
    l = { ":Trouble<CR>", "List" },
    t = { ":TroubleToggle<CR>", "Toggle" },
    r = { ":TroubleRefresh<CR>", "Refresh" },
    c = { ":TroubleClose<CR>", "Close" },
  },
}, { mode = "n", prefix = "<Leader>" })

-- ┌─┐┌─┐┌─┐
-- │  │ ││
-- └─┘└─┘└─┘

-- Normal mode
wk.register({
  ["<C-G>"] = { "<Plug>(coc-range-select)" , "Forward Selection Range"},
  ["[g"] = { "<Plug>(coc-diagnostic-prev)", " Go to Previous Diagnostic" },
  ["]g"] = { "<Plug>(coc-diagnostic-next)", " Go to Next Diagnostic" },
  ["<Space>"] = {
    name = "󰁨 Intellisense",
    a = { ":<C-U>CocList diagnostics<CR>", "Show All Diagnostics" },
    c = { ":<C-U>CocList commands<CR>", "Show Commands" },
    e = { ":<C-U>CocList extensions<CR>", "Manage Extensions" },
    j = { ":<C-U>CocNext<CR>", "Invoke Default Action for Next Item" },
    k = { ":<C-U>CocPrev<CR>", "Invoke Default Action for Previous Item" },
    o = { ":<C-U>CocList outline<CR>", "Find Symbol" },
    p = { ":<C-U>CocListResume<CR>", "Reopen Last Opened List" },
    s = { ":<C-U>CocList -I symbols<CR>", "Search Workspace Symbols" },
  },
  K = { "<CMD>lua _G.show_docs()<CR>", "Show Documentation" },
  g = {
    name = " Goto",
    d = { "<Plug>(coc-definition)", "Go to Definition" },
    y = { "<Plug>(coc-type-definition)", "Got to Type Definition" },
    i = { "<Plug>(coc-implementation)", "Go to Implementation" },
    r = { "<Plug>(coc-references)", "Go to Reference" },
  },
}, { mode = "n" })

-- Visual mode
wk.register({
  ["<C-G>"] = { "<Plug>(coc-range-select)" , "Forward Selection Range"},
}, { mode = "x" })

-- Insert mode
wk.register({
  ["<C-Space>"] = { "coc#refresh()", "Refresh Completion" },
  ["<C-F>"] = { "<Plug>(coc-snippets-expand-jump)", "Jump Through Snippets" },
  ["<CR>"] = { [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], "Confirm Selection / Format" },
  ["<TAB>"] = { [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()]], "Go to Next Completion / Refresh" },
  ["<S-TAB>"] = { [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], "Go to Previous Completion / Backspace" },
}, { mode = "i", expr = true })

-- Normal mode with leader key
wk.register({
  i = {
    name = "󰁨 Intellisense",
    a = { "<Plug>(coc-codeaction-selected)", "Run Code Action for Selection" },
    c = { "<Plug>(coc-codeaction-cursor)", "Run Code Action at Cursor" },
    e = { "<Plug>(coc-codeaction-refactor-selected)", "Run Refactor Code Action(s) for Selection" },
    f = { "<Plug>(coc-format-selected)", "Format Code" },
    l = { "<Plug>(coc-codelens-action)", "Invoke Command from Code Lens" },
    n = { "<Plug>(coc-rename)", "Rename Symbol" },
    q = { "<Plug>(coc-fix-current)", "Run Quickfix Preferred Code Action on Line" },
    r = { "<Plug>(coc-codeaction-refactor)", "Run Refactor Code Action(s)" },
    s = { "<Plug>(coc-codeaction-source)", "Run Code Action at Current File/Source" },
  },
}, { mode = "n", prefix = "<Leader>" })

-- Visual mode with leader key
wk.register({
  i = {
    name = "󰁨 Intellisense",
    f = { "<Plug>(coc-format-selected)", "Format Selected Code" },
    a = { "<Plug>(coc-codeaction-selected)", "Run Code Action for Selection" },
    r = { "<Plug>(coc-codeaction-refactor-selected)", "Run Refactor Code Action(s) for Selection" },
  },
}, { mode = "x", prefix = "<Leader>" })

-- Map function and class text objects
vim.keymap.set("x", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true })
vim.keymap.set("o", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true })
vim.keymap.set("x", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true })
vim.keymap.set("o", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true })
vim.keymap.set("x", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true })
vim.keymap.set("o", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true })
vim.keymap.set("x", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true })
vim.keymap.set("o", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true })

-- Remap <C-f> and <C-b> to scroll float windows/popups
vim.keymap.set("n", "<C-F>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { silent = true, nowait = true, expr = true })
vim.keymap.set("n", "<C-B>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { silent = true, nowait = true, expr = true })
vim.keymap.set("i", "<C-F>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', { silent = true, nowait = true, expr = true })
vim.keymap.set("i", "<C-B>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', { silent = true, nowait = true, expr = true })
vim.keymap.set("v", "<C-F>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { silent = true, nowait = true, expr = true })
vim.keymap.set("v", "<C-B>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { silent = true, nowait = true, expr = true })
