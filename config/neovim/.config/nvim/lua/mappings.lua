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

wk.add({
  {
    mode = "n",
    { "<C-X>", ":WhichKey<CR>", desc = "Whichkey", icon = "" },

    { "<C-P>", "<Plug>(ctrlp)", desc = "CtrlP Finder", icon = "󰀶" },
    { "<C-W>", "<C-W>", desc = "Window", icon = "" },

    { "Q", "@q", desc = "Replay Macro Recording", icon = "" },
    { "Y", "y$", desc = "Yank to the End", icon = "" },

    -- Handled by https://github.com/christoomey/vim-tmux-navigator
    { "<C-H>", desc = "Go to Left Window", icon = "" },
    { "<C-J>", desc = "Go to Down Window", icon = "" },
    { "<C-K>", desc = "Go to Up Window", icon = "" },
    { "<C-L>", desc = "Go to Right Window", icon = "" },
    { "<C-\\>", desc = "Go to Recent Window", icon = "󰮳" },

    { "<C-Down>", "<C-W>-", desc = "Resize Height", icon = "" },
    { "<C-Left>", "<C-W><", desc = "Resize Width", icon = "" },
    { "<C-Right>", "<C-W>>", desc = "Resize Width", icon = "" },
    { "<C-Up>", "<C-W>+", desc = "Resize Height", icon = "" },

    { "<S-Tab>", "<C-W>W", desc = "Circle Window Backward", icon = "󱞡" },
    { "<Tab>", "<C-W>w", desc = "Circle Window Forward", icon = "󱞣" },

    { "[", group = "Previous", icon = "󰮳" },
    { "[b", ":bprev<CR>", desc = "Previous Buffer", icon = "" },
    { "[t", ":tabp<CR>", desc = "Previous Tab", icon = "" },

    { "]", group = "Next", icon = "󰮱" },
    { "]b", ":bnext<CR>", desc = "Next Buffer", icon = "" },
    { "]t", ":tabn<CR>", desc = "Next Tab", icon = "" },

    { "-", ":NnnPicker %:p:h<CR>", desc = "NNN Picker", icon = "", },
    { "`", ":NnnExplorer %:p:h<CR>", desc = "NNN Explorer", icon = "", },
    { "~", ":NvimTreeFocus<CR>", desc = "Nvim Tree", icon = "", },

    { "<Leader>", group = "Leader", icon = "󰸥" },
    { "<Leader>/", "<Plug>NERDCommenterToggle", desc = "Comment", icon = "󰆉" },
    { "<Leader><Space>", ":nohlsearch<CR>", desc = "Clear Search Highlights", icon = "󰸱" },
    { "<Leader>C", ":ColorSwatchGenerate<CR>", desc = "Color Swatch", icon = "󰢵" },
    { "<Leader>I", ":IndentLinesToggle<CR>", desc = "Indent Marks", icon = "" },
    { "<Leader>N", ":set relativenumber!<CR>", desc = "Relative Line Numbers", icon = "" },
    { "<Leader>P", ":Inspecthi<CR>", desc = "Inspect Highlight", icon = "" },
    { "<Leader>S", ":set spell! spelllang=en_au<CR>", desc = "Spell Check", icon = "󰓆" },
    { "<Leader>T", ":lua MiniTrailspace.trim()<CR>", desc = "Trim Trailing Spaces", icon = "" },
    { "<Leader>c", group = "Comment", icon = "󰅺", },
    { "<Leader>h", ":checkhealth<CR>", desc = "Check Health", icon = "󰩂" },
    { "<Leader>l", ":Limelight!!<CR>", desc = "Limelight Mode", icon = "󱟇" },
    { "<Leader>m", "<Plug>MarkdownPreviewToggle", desc = "Markdown Preview", icon = "󰽛" },
    { "<Leader>n", ":set norelativenumber number!<CR>", desc = "Line Numbers", icon = "" },
    { "<Leader>r", function() vim.wo.colorcolumn = vim.wo.colorcolumn == "" and "80,120" or "" end, desc = "Rulers", icon = "", },
    { "<Leader>w", ":set wrap! wrap?<CR>", desc = "Wrap Mode", icon = "󰖶" },
    { "<Leader>z", ":ZenMode<CR>", desc = "Zen Mode", icon = "󰽏" },
  },
  {
    mode = "i",
    { "<C-X>", "<C-O>:WhichKey<CR>", desc = "Whichkey", icon = "" },
  },
  {
    mode = { "v" },
    { "<Leader>/", "<Plug>NERDCommenterToggle", desc = "Comment", icon = "󰆉" },
    { "<Leader><Space>", ":nohlsearch<CR>", desc = "Clear Search Highlights", icon = "󰸱" },
    { "<Leader>c", group = "Comment", icon = "󰅺" },
    { "<Leader>p", desc = "Paste", icon = "" },
    { "<Leader>y", desc = "Copy", icon = "" },
  }
})

-- ┌─┐┌─┐┌─┐┬┬  ┌─┐┌┬┐
-- │  │ │├─┘││  │ │ │
-- └─┘└─┘┴  ┴┴─┘└─┘ ┴

wk.add({
  {
    mode = "n",
    { "<Leader>p", group = "Copilot", icon = "" },
    { "<Leader>pa", ":Copilot panel<CR>", desc = "Panel" },
    { "<Leader>pd", ":Copilot disable<CR>", desc = "Disable" },
    { "<Leader>pe", ":Copilot enable<CR>", desc = "Enable" },
    { "<Leader>pg", "<Plug>(copilot-suggest)", desc = "Suggest" },
    { "<Leader>pi", ":Copilot auth<CR>", desc = "Sign In" },
    { "<Leader>pm", "<Plug>(copilot-dismiss)", desc = "Dismiss Suggestion" },
    { "<Leader>pn", "<Plug>(copilot-next)", desc = "Next Suggestion" },
    { "<Leader>po", ":Copilot signout<CR>", desc = "Sign Out" },
    { "<Leader>pp", "<Plug>(copilot-previous)", desc = "Previous Suggestion" },
    { "<Leader>pr", ":Copilot restart<CR>", desc = "Restart" },
    { "<Leader>ps", ":Copilot status<CR>", desc = "Status" },
    { "<Leader>pu", ":Copilot setup<CR>", desc = "Setup" },
    { "<Leader>pv", ":Copilot version<CR>", desc = "Version" },
  },
  {
    mode = "i",
    { "<C-J>", "copilot#Accept('')", desc = "Accept Suggestion", expr = true, replace_keycodes = false },
    { "<C-K>", "<Plug>(copilot-accept-word)", desc = "Accept Word Suggestion" },
    { "<C-L>", "<Plug>(copilot-accept-line)", desc = "Accept Line Suggestion" },
    { "<C-N>", "<Plug>(copilot-next)", desc = "Next Suggestion" },
    { "<C-P>", "<Plug>(copilot-previous)", desc = "Previous Suggestion" },
    { "<C-D>", "<Plug>(copilot-dismiss)", desc = "Dismiss Suggestion" },
    { "<C-H>", "<Plug>(copilot-suggest)", desc = "Force Suggestion" },
  },
})

-- ┌─┐┌─┐┌┬┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
-- │ ┬├─┘ │   ├─┘├┬┘│ ││││├─┘ │
-- └─┘┴   ┴   ┴  ┴└─└─┘┴ ┴┴   ┴

wk.add({
  {
    mode = "n",
    { "<Leader><C-X>", "<CMD>GpChatNew<CR>", desc = "GPT", icon = "󰭻" },
    { "<Leader>x", group = "GPT", icon = "󰭻" },
    { "<Leader>x<C-t>", "<CMD>GpChatNew tabnew<CR>", desc = "New Chat tabnew" },
    { "<Leader>x<C-v>", "<CMD>GpChatNew vsplit<CR>", desc = "New Chat vsplit" },
    { "<Leader>x<C-x>", "<CMD>GpChatNew split<CR>", desc = "New Chat split" },
    { "<Leader>xa", "<CMD>GpAppend<CR>", desc = "Append (after)" },
    { "<Leader>xb", "<CMD>GpPrepend<CR>", desc = "Prepend (before)" },
    { "<Leader>xc", "<CMD>GpChatNew<CR>", desc = "New Chat" },
    { "<Leader>xf", "<CMD>GpChatFinder<CR>", desc = "Chat Finder" },
    { "<Leader>xg", group = "generate into new …" },
    { "<Leader>xge", "<CMD>GpEnew<CR>", desc = "GpEnew" },
    { "<Leader>xgn", "<CMD>GpNew<CR>", desc = "GpNew" },
    { "<Leader>xgp", "<CMD>GpPopup<CR>", desc = "Popup" },
    { "<Leader>xgt", "<CMD>GpTabnew<CR>", desc = "GpTabnew" },
    { "<Leader>xgv", "<CMD>GpVnew<CR>", desc = "GpVnew" },
    { "<Leader>xn", "<CMD>GpNextAgent<CR>", desc = "Next Agent" },
    { "<Leader>xr", "<CMD>GpRewrite<CR>", desc = "Inline Rewrite" },
    { "<Leader>xs", "<CMD>GpStop<CR>", desc = "GpStop" },
    { "<Leader>xt", "<CMD>GpChatToggle<CR>", desc = "Toggle Chat" },
    { "<Leader>xw", group = "Whisper" },
    { "<Leader>xwa", "<CMD>GpWhisperAppend<CR>", desc = "Whisper Append (after)" },
    { "<Leader>xwb", "<CMD>GpWhisperPrepend<CR>", desc = "Whisper Prepend (before)" },
    { "<Leader>xwe", "<CMD>GpWhisperEnew<CR>", desc = "Whisper Enew" },
    { "<Leader>xwn", "<CMD>GpWhisperNew<CR>", desc = "Whisper New" },
    { "<Leader>xwp", "<CMD>GpWhisperPopup<CR>", desc = "Whisper Popup" },
    { "<Leader>xwr", "<CMD>GpWhisperRewrite<CR>", desc = "Whisper Inline Rewrite" },
    { "<Leader>xwt", "<CMD>GpWhisperTabnew<CR>", desc = "Whisper Tabnew" },
    { "<Leader>xwv", "<CMD>GpWhisperVnew<CR>", desc = "Whisper Vnew" },
    { "<Leader>xww", "<CMD>GpWhisper<CR>", desc = "Whisper" },
    { "<Leader>xx", "<CMD>GpContext<CR>", desc = "Toggle GpContext" },
  },
  {
    mode = { "v" },
    { "<Leader>x", group = "GPT", icon = "󰭻" },
    { "<Leader>x<C-t>", ":<C-u>'<,'>GpChatNew tabnew<CR>", desc = "Visual Chat New tabnew" },
    { "<Leader>x<C-v>", ":<C-u>'<,'>GpChatNew vsplit<CR>", desc = "Visual Chat New vsplit" },
    { "<Leader>x<C-x>", ":<C-u>'<,'>GpChatNew split<CR>", desc = "Visual Chat New split" },
    { "<Leader>xa", ":<C-u>'<,'>GpAppend<CR>", desc = "Visual Append (after)" },
    { "<Leader>xb", ":<C-u>'<,'>GpPrepend<CR>", desc = "Visual Prepend (before)" },
    { "<Leader>xc", ":<C-u>'<,'>GpChatNew<CR>", desc = "Visual Chat New" },
    { "<Leader>xg", group = "generate into new .." },
    { "<Leader>xge", ":<C-u>'<,'>GpEnew<CR>", desc = "Visual GpEnew" },
    { "<Leader>xgn", ":<C-u>'<,'>GpNew<CR>", desc = "Visual GpNew" },
    { "<Leader>xgp", ":<C-u>'<,'>GpPopup<CR>", desc = "Visual Popup" },
    { "<Leader>xgt", ":<C-u>'<,'>GpTabnew<CR>", desc = "Visual GpTabnew" },
    { "<Leader>xgv", ":<C-u>'<,'>GpVnew<CR>", desc = "Visual GpVnew" },
    { "<Leader>xi", ":<C-u>'<,'>GpImplement<CR>", desc = "Implement selection" },
    { "<Leader>xn", "<CMD>GpNextAgent<CR>", desc = "Next Agent" },
    { "<Leader>xp", ":<C-u>'<,'>GpChatPaste<CR>", desc = "Visual Chat Paste" },
    { "<Leader>xr", ":<C-u>'<,'>GpRewrite<CR>", desc = "Visual Rewrite" },
    { "<Leader>xs", "<CMD>GpStop<CR>", desc = "GpStop" },
    { "<Leader>xt", ":<C-u>'<,'>GpChatToggle<CR>", desc = "Visual Toggle Chat" },
    { "<Leader>xw", group = "Whisper" },
    { "<Leader>xwa", ":<C-u>'<,'>GpWhisperAppend<CR>", desc = "Whisper Append (after)" },
    { "<Leader>xwb", ":<C-u>'<,'>GpWhisperPrepend<CR>", desc = "Whisper Prepend (before)" },
    { "<Leader>xwe", ":<C-u>'<,'>GpWhisperEnew<CR>", desc = "Whisper Enew" },
    { "<Leader>xwn", ":<C-u>'<,'>GpWhisperNew<CR>", desc = "Whisper New" },
    { "<Leader>xwp", ":<C-u>'<,'>GpWhisperPopup<CR>", desc = "Whisper Popup" },
    { "<Leader>xwr", ":<C-u>'<,'>GpWhisperRewrite<CR>", desc = "Whisper Rewrite" },
    { "<Leader>xwt", ":<C-u>'<,'>GpWhisperTabnew<CR>", desc = "Whisper Tabnew" },
    { "<Leader>xwv", ":<C-u>'<,'>GpWhisperVnew<CR>", desc = "Whisper Vnew" },
    { "<Leader>xww", ":<C-u>'<,'>GpWhisper<CR>", desc = "Whisper" },
    { "<Leader>xx", ":<C-u>'<,'>GpContext<CR>", desc = "Visual GpContext" },
  }
})

-- ┌─┐┬┌┬┐
-- │ ┬│ │
-- └─┘┴ ┴

wk.add({
  {
    mode = "n",
    { "<Leader><C-G>", ":vertical Git<CR>", desc = "Fugitive", icon = "" },
    { "<Leader><C-T>", ":Tig<CR>", desc = "Tig", icon = "" },
    { "<Leader>g", group = "Git", icon = "" },
    { "<Leader>gR", ":Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
    { "<Leader>gS", ":Gitsigns stage_buffer<CR>", desc = "Stage Buffer" },
    { "<Leader>gb", ":Gitsigns blame_line<CR>", desc = "Blame" },
    { "<Leader>gc", ":FzfLua git_bcommits<CR>", desc = "Commits (Buffer)" },
    { "<Leader>gd", group = "Diff View", icon = "" },
    { "<Leader>gdc", ":DiffviewClose<CR>", desc = "Close" },
    { "<Leader>gdf", ":DiffviewToggleFiles<CR>", desc = "Files" },
    { "<Leader>gdh", ":DiffviewFileHistory<CR>", desc = "File History" },
    { "<Leader>gdo", ":DiffviewOpen<CR>", desc = "Open" },
    { "<Leader>gdr", ":DiffviewRefresh<CR>", desc = "Refresh" },
    { "<Leader>gdt", ":Gitsigns diffthis<CR>", desc = "This" },
    { "<Leader>gl", group = "Link", icon = "󰌷" },
    { "<Leader>glc", ":GitLink<CR>", desc = "Copy Code Permalink", icon = "" },
    { "<Leader>glo", ":GitLink!<CR>", desc = "Open Code Permalink", icon = "" },
    { "<Leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
    { "<Leader>gq", ":Gitsigns setqflist<CR>", desc = "Quick Fix (Buffer)" },
    { "<Leader>gr", ":Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
    { "<Leader>gs", ":Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
    { "<Leader>gt", group = "Toggle", icon = "" },
    { "<Leader>gtb", ":Gitsigns toggle_current_line_blame<CR>", desc = "Blame" },
    { "<Leader>gtd", ":Gitsigns toggle_deleted<CR>", desc = "Deleted" },
    { "<Leader>gtl", ":Gitsigns toggle_linehl<CR>", desc = "Line Highlight" },
    { "<Leader>gtn", ":Gitsigns toggle_numhl<CR>", desc = "Number Highlight" },
    { "<Leader>gts", ":Gitsigns toggle_signs<CR>", desc = "Signs" },
    { "<Leader>gtw", ":Gitsigns toggle_word_diff<CR>", desc = "Word Diff" },
    { "<Leader>gu", ":Gitsigns undo_stage_hunk<CR>", desc = "Unstage Hunk" },
    { "<Leader>gv", ":Gitsigns select_hunk<CR>", desc = "Select Hunk" },
    { "[h", ":Gitsigns prev_hunk<CR>", desc = "Prev Hunk (Buffer)", icon ="" },
    { "]h", ":Gitsigns next_hunk<CR>", desc = "Next Hunk (Buffer)", icon = "" },
  },
  {
    mode = { "v" },
    { "<Leader>g", group = "Git", icon = "" },
    { "<Leader>gl", group = "Link", icon = "󰌷" },
    { "<Leader>glc", ":<C-u>'<,'>GitLink<CR>", desc = "Copy Code Permalink", icon = "" },
    { "<Leader>glo", ":<C-u>'<,'>GitLink!<CR>", desc = "Open Code Permalink", icon = "" },
  }
})

-- ┌┐ ┬ ┬┌─┐┌─┐┌─┐┬─┐
-- ├┴┐│ │├┤ ├┤ ├┤ ├┬┘
-- └─┘└─┘└  └  └─┘┴└─

-- Normal mode
wk.add({
  {
    mode = "n",
    { "<C-Q>", ":q<CR>", desc = "Quit", icon = "󰗼" },
    { "<C-S>", ":update<CR>", desc = "Save", icon = "" },
    { "<Leader>Q", ":qa<CR>", desc = "Quit all", icon = "󰗼" },
    { "<Leader>b", group = "Buffer", icon = "" },
    { "<Leader>bQ", ":qa<CR>", desc = "Quit all" },
    { "<Leader>ba", ":b#<CR>", desc = "Alternate" },
    { "<Leader>bc", ":bd<CR>", desc = "Close" },
    { "<Leader>bf", ":bfirst<CR>", desc = "First" },
    { "<Leader>bh", ":Startify<CR>", desc = "Home" },
    { "<Leader>bl", ":blast<CR>", desc = "Last" },
    { "<Leader>bn", ":bnext<CR>", desc = "Next" },
    { "<Leader>bp", ":bprevious<CR>", desc = "Previous" },
    { "<Leader>bq", ":q<CR>", desc = "Quit" },
    { "<Leader>bs", ":update<CR>", desc = "Save" },
    { "<Leader>q", ":q<CR>", desc = "Quit", icon = "󰗼" },
  },
  {
    mode = "i",
    { "<C-Q>", "<Esc>:q<CR>", desc = "Quit", icon = "󰗼" },
    { "<C-S>", "<C-O>:update<CR>", desc = "Save", icon = "" },
  },
  {
    mode = "v",
    { "<C-Q>", "<Esc>", desc = "Quit", icon = "󰗼" },
  }
})

-- ┌─┐┌─┐┌─┐   ┬   ┌─┐┌┬┐┬─┐┬  ┌─┐┌─┐
-- ├┤ ┌─┘├┤   ┌┼─  │   │ ├┬┘│  └─┐├┤
-- └  └─┘└    └┘   └─┘ ┴ ┴└─┴─┘└─┘└
-- https://github.com/dyng/ctrlsf.vim

wk.add({
  {
    mode = "n",
    { "<Leader><C-F>", ":CtrlSF -hidden ", desc = "Find & Replace", icon = "", silent = false },
    { "<Leader>f", group = "Find & Replace", icon = "", silent = false },
    { "<Leader>f<Space>", ":CtrlSFClearHL<CR>", desc = "Clear Highlights", silent = false },
    { "<Leader>fc", ":CtrlSFClose<CR>", desc = "Close", silent = false },
    { "<Leader>ff", ":CtrlSFFocus<CR>", desc = "Focus", silent = false },
    { "<Leader>fl", "<Plug>CtrlSFPwordPath", desc = "Prompt Last Pattern", silent = false },
    { "<Leader>fo", ":CtrlSFOpen<CR>", desc = "Open", silent = false },
    { "<Leader>fp", ":CtrlSF -hidden ", desc = "Prompt", silent = false },
    { "<Leader>fs", ":CtrlSFStop<CR>", desc = "Stop Search", silent = false },
    { "<Leader>ft", ":CtrlSFToggle<CR>", desc = "Toggle", silent = false },
    { "<Leader>fu", ":CtrlSFUpdate<CR>", desc = "Update Results", silent = false },
    { "<Leader>fw", "<Plug>CtrlSFCwordPath", desc = "Prompt Under Cursor", silent = false },
    { "<Leader>fx", "<Plug>CtrlSFCCwordPath", desc = "Prompt Under Cursor with Boundary", silent = false },
    { "<Leader>s", group = "󰓈 Spotlight", silent = false },
    { "<Leader>sb", ":Telescope buffers<CR>", desc = "Buffers", icon = "", silent = false },
  },
  {
    mode = { "v" },
    { "<Leader>f", group = "Find & Replace", icon = "", silent = false },
    { "<Leader>fe", "<Plug>CtrlSFVwordExec", desc = "Find Selected Area", silent = false },
    { "<Leader>fv", "<Plug>CtrlSFVwordPath", desc = "Prompt Selected Area", silent = false },
  }
})

-- ┌┬┐┌─┐┌┬┐┌─┐  ┌─┐┌─┐┌┬┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐
--  │ │ │ │││ │  │  │ │││││││├┤ │││ │ └─┐
--  ┴ └─┘─┴┘└─┘  └─┘└─┘┴ ┴┴ ┴└─┘┘└┘ ┴ └─┘

wk.add({
  {
    mode = "n",
    { "<Leader><C-O>", ":Telescope<CR>", desc = "Telescope", icon = "󰀶" },
    { "<Leader>t", group = "ToDo", icon = "" },
    { "<Leader>tl", ":TodoLocList<CR>", desc = "Location List" },
    { "<Leader>tq", ":TodoQuickFix<CR>", desc = "Quick Fix List" },
    { "<Leader>ts", ":TodoTelescope<CR>", desc = "Search with Telescope" },
    { "<Leader>tt", ":TodoTrouble<CR>", desc = "Trouble List" },
    { "[o", function() require("todo-comments").jump_prev() end, desc = "Previous ToDo", icon = "" },
    { "]o", function() require("todo-comments").jump_next() end, desc = "Next ToDo", icon = "" },
  }
})

-- ┌┬┐┬─┐┌─┐┬ ┬┌┐ ┬  ┌─┐
--  │ ├┬┘│ ││ │├┴┐│  ├┤
--  ┴ ┴└─└─┘└─┘└─┘┴─┘└─┘

wk.add({
  {
    mode = "n",
    { "<Leader><C-L>", ":Trouble<CR>", desc = "Trouble", icon = "" },
    { "<Leader>e", group = "Trouble", icon = "" },
    { "<Leader>ec", ":TroubleClose<CR>", desc = "Close" },
    { "<Leader>el", ":Trouble<CR>", desc = "List" },
    { "<Leader>er", ":TroubleRefresh<CR>", desc = "Refresh" },
    { "<Leader>et", ":TroubleToggle<CR>", desc = "Toggle" },
  }
})

-- ┬  ┌─┐┌─┐
-- │  └─┐├─┘
-- ┴─┘└─┘┴

wk.add({
  { "g", group = "LSP Go to" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to Declaration" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Go to Implementation" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Go to References" },
  { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Documentation" },
  { "<leader>l", group = "LSP" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
})
