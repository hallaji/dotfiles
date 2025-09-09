-- ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
-- ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
-- ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
-- ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
-- ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
-- https://neovim.io/doc/user/map.html
-- https://neovim.io/doc/user/lua-guide.html#lua-guide-mappings

if vim.g.vscode then
  return
end

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
    { "<Leader><C-G>", ":Neogit<CR>", desc = "Neogit", icon = "" },
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
  -- LSP Go to mappings
  { "g", group = "Go to", icon = "󰮫", },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition", icon = "󰊕", },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to Declaration", icon = "󰙴", },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Go to Implementation", icon = "󰡱", },
  { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Go to References", icon = "󰌹", },
  { "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Go to Type Definition", icon = "󰜁", },
  { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Documentation", icon = "󰋖", },
  { "gK", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", icon = "󰘦", },

  -- Inc-rename (if using inc-rename.nvim)
  { "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, desc = "Rename", expr = true, icon = "󰑕", },

  -- Document highlighting
  { "<leader>lh", group = "Highlight", icon = "󰸱", },
  { "<leader>lhh", "<cmd>lua vim.lsp.buf.document_highlight()<cr>", desc = "Document Highlight", icon = "󰸱", },
  { "<leader>lhc", "<cmd>lua vim.lsp.buf.clear_references()<cr>", desc = "Clear Highlights", icon = "󰇙", },

  -- -- LSP main actions
  -- { "<leader>l", group = "󰒋 LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "󰌵 Code Action", mode = { "n", "v" } },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "󰑕 Rename" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "󰉢 Format Document", mode = { "n", "v" } },
  -- { "<leader>li", "<cmd>LspInfo<cr>", desc = "󰉒 LSP Info" },
  -- { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "󰤚 LSP Install Info" },
  -- { "<leader>lR", "<cmd>LspRestart<cr>", desc = "󰑓 Restart LSP" },
  -- { "<leader>lS", "<cmd>LspStart<cr>", desc = "󰐥 Start LSP" },
  -- { "<leader>lT", "<cmd>LspStop<cr>", desc = "󰙦 Stop LSP" },

  -- -- Diagnostics
  -- { "<leader>ld", group = "󰉪 Diagnostics" },
  -- { "<leader>ldd", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "󰌶 Show Line Diagnostics" },
  -- { "<leader>ldl", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "󰂛 Diagnostics to Location List" },
  -- { "<leader>ldq", "<cmd>lua vim.diagnostic.setqflist()<cr>", desc = "󰁨 Diagnostics to Quickfix" },
  -- { "<leader>ldt", "<cmd>lua vim.diagnostic.toggle()<cr>", desc = "󰄭 Toggle Diagnostics" },
  -- { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
  -- { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Previous Diagnostic" },
  -- { "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>", desc = "Next Error" },
  -- { "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>", desc = "Previous Error" },
  -- { "]w", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<cr>", desc = "Next Warning" },
  -- { "[w", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<cr>", desc = "Previous Warning" },

  -- -- Workspace management
  -- { "<leader>lw", group = "󰇄 Workspace" },
  -- { "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", desc = "󰀸 Add Workspace Folder" },
  -- { "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", desc = "󰤄 Remove Workspace Folder" },
  -- { "<leader>lwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = "󰈙 List Workspace Folders" },
  -- { "<leader>lws", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", desc = "󰒕 Workspace Symbols" },

  -- -- Symbols and navigation
  -- { "<leader>ls", group = "󰒕 Symbols" },
  -- { "<leader>lso", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", desc = "󰈙 Document Symbols" },
  -- { "<leader>lsw", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", desc = "󰇄 Workspace Symbols" },
  -- { "<leader>lsi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", desc = "󰴽 Implementations" },
  -- { "<leader>lsr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "󰈙 References" },
  -- { "<leader>lsd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", desc = "󰊕 Definitions" },
  -- { "<leader>lst", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", desc = "󰗀 Type Definitions" },

  -- -- Call hierarchy
  -- { "<leader>lc", group = "󰗀 Call Hierarchy" },
  -- { "<leader>lci", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", desc = "󰸙 Incoming Calls" },
  -- { "<leader>lco", "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", desc = "󰸖 Outgoing Calls" },


  -- -- LSP-specific plugin integrations
  -- -- Trouble.nvim integration (if installed)
  -- { "<leader>lt", group = "󰔫 Trouble" },
  -- { "<leader>ltt", "<cmd>TroubleToggle<cr>", desc = "󰔫 Toggle Trouble" },
  -- { "<leader>ltd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "󰉪 Document Diagnostics" },
  -- { "<leader>ltw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "󰇄 Workspace Diagnostics" },
  -- { "<leader>ltr", "<cmd>TroubleToggle lsp_references<cr>", desc = "󰈙 LSP References" },
  -- { "<leader>ltl", "<cmd>TroubleToggle loclist<cr>", desc = "󰂛 Location List" },
  -- { "<leader>ltq", "<cmd>TroubleToggle quickfix<cr>", desc = "󰁨 Quickfix" },

  -- -- LSP Saga integration (if installed)
  -- { "<leader>lg", group = "󰒋 LSP Saga" },
  -- { "<leader>lgd", "<cmd>Lspsaga peek_definition<cr>", desc = "󰊕 Peek Definition" },
  -- { "<leader>lgr", "<cmd>Lspsaga lsp_finder<cr>", desc = "󰈙 LSP Finder" },
  -- { "<leader>lga", "<cmd>Lspsaga code_action<cr>", desc = "󰌵 Code Action" },
  -- { "<leader>lgn", "<cmd>Lspsaga rename<cr>", desc = "󰑕 Rename" },
  -- { "<leader>lgh", "<cmd>Lspsaga hover_doc<cr>", desc = "󰈙 Hover Doc" },
  -- { "<leader>lgo", "<cmd>Lspsaga outline<cr>", desc = "󰘦 Outline" },

  -- -- Additional useful LSP mappings
  -- { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", mode = "i" },
  -- { "<C-h>", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Info", mode = "i" },

  -- -- Mason integration (if using mason.nvim)
  -- { "<leader>lm", group = "󰏗 Mason" },
  -- { "<leader>lmm", "<cmd>Mason<cr>", desc = "󰏗 Mason" },
  -- { "<leader>lmi", "<cmd>MasonInstall<cr>", desc = "󰏗 Mason Install" },
  -- { "<leader>lmu", "<cmd>MasonUninstall<cr>", desc = "󰏗 Mason Uninstall" },
  -- { "<leader>lmU", "<cmd>MasonUpdate<cr>", desc = "󰏗 Mason Update" },
  -- { "<leader>lml", "<cmd>MasonLog<cr>", desc = "󰏗 Mason Log" },

  -- -- Inlay hints (Neovim 0.10+)
  -- { "<leader>lI", group = "󰉧 Inlay Hints" },
  -- { "<leader>lIt", function()
  --   vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
  -- end, desc = "󰉧 Toggle Inlay Hints" },
  -- { "<leader>lIe", function()
  --   vim.lsp.inlay_hint.enable(0, true)
  -- end, desc = "󰉧 Enable Inlay Hints" },
  -- { "<leader>lId", function()
  --   vim.lsp.inlay_hint.enable(0, false)
  -- end, desc = "󰉧 Disable Inlay Hints" },

  -- -- Quick actions
  -- { "<leader>q", group = "󰗇 Quick Actions" },
  -- { "<leader>qf", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "󰌵 Quick Fix", mode = { "n", "v" } },
  -- { "<leader>qr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "󰑕 Quick Rename" },
  -- { "<leader>qh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "󰈙 Quick Hover" },

  -- -- Search and navigation shortcuts
  -- { "<leader>/", group = "󰍉 Search" },
  -- { "<leader>/s", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", desc = "󰒕 Search Symbols" },
  -- { "<leader>/w", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", desc = "󰇄 Search Workspace" },
  -- { "<leader>/r", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "󰈙 Search References" },
  -- { "<leader>/d", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", desc = "󰉪 Search Diagnostics" },

  -- -- Toggle features
  -- { "<leader>t", group = "󰔡 Toggle" },
  -- { "<leader>td", function()
  --   vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  -- end, desc = "󰉪 Toggle Diagnostics" },
  -- { "<leader>tf", function()
  --   vim.g.format_on_save = not vim.g.format_on_save
  --   print("Format on save: " .. (vim.g.format_on_save and "enabled" or "disabled"))
  -- end, desc = "󰉢 Toggle Format on Save" },
})
