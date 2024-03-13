# Cheat Sheet

- [Cheat Sheet](#cheat-sheet)
  - [Steering Focus](#steering-focus)
    - [Spaces & Monitors (Yabai / SKHD)](#spaces--monitors-yabai--skhd)
    - [Terminals (Alacritty)](#terminals-alacritty)
    - [Editors (VIM / NVIM / VSCode)](#editors-vim--nvim--vscode)
    - [Browsers (Vimium / Vimari)](#browsers-vimium--vimari)
  - [OS Shortcuts (macOS)](#os-shortcuts-macos)
  - [Yabai / SKHD](#yabai--skhd)
  - [Tmux](#tmux)
    - [Tmux Key Bindings](#tmux-key-bindings)
      - [Custom Tmux Key Bindings](#custom-tmux-key-bindings)
  - [Alacritty](#alacritty)
    - [Tmux bindings](#tmux-bindings)
    - [Vi-mode](#vi-mode)
  - [Vim/Neovim](#vimneovim)
    - [Vim Glossary](#vim-glossary)
    - [Vim Commands](#vim-commands)
    - [Vim Plugins](#vim-plugins)
      - [Plug](#plug)
      - [CtrlP](#ctrlp)
      - [COC](#coc)
      - [Fugitive](#fugitive)
      - [Git Gutter](#git-gutter)
      - [GV](#gv)
      - [Nerd Tree](#nerd-tree)
      - [Netrw](#netrw)
      - [FZF](#fzf)
      - [Number Toggle](#number-toggle)
  - [Vimium / Vimari](#vimium--vimari)
  - [Footnote](#footnote)

## Steering Focus

### Spaces & Monitors (Yabai / SKHD)

- Focus on a window: `⌃⌥⌘` + (`h` | `j` | `k` | `l`)
- Resize a window: `⌃⌥⌘` + (`←` | `↓` | `↑` | `→`)
- Move a window: `⌃⌥⌘` + (`home` | `pagedown` | `pageup` | `end`)
- Focus on a monitor by number `⌃⌥⌘` + (`1` | `2` | `3` | etc.)
- Focus on the next space `⌃⌥⌘ + Backtick`

### Terminals (Alacritty)

- Focus on a pane: `⌃` + (`h` | `j` | `k` | `l`)
- Resize a pane: `⌘` + (`←` | `↓` | `↑` | `→`)
- Move the cursor in vi-mode: `h` | `l` (left or right)
- Go through history in vi-mode: `j` | `k` (down or up)
- Move the cursor in Alacritty vi-mode: `h` | `j` | `k` | `l`
- Jump between Tmux tabs `⌘⇧` + (`h` | `l`)
- Jump between Tmux sessions `⌘⇧` + (`←` | `→`)
- Switch to a tab by number `⌘` + (`1` | `2` | `3` | etc.)

### Editors (VIM / NVIM / VSCode)

- Focus on a pane: `⌃` + (`h` | `j` | `k` | `l`)
- Resize a pane: `⌃` + (`←` | `↓` | `↑` | `→`)
- Move the cursor: `h` | `j` | `k` | `l`
- Move to previous pane `⌃` + `\`

### Browsers (Vimium / Vimari)

- Scroll: `h` | `j` | `k` | `l`
- Scroll half a page: `u` | `d` (up or down )
- Go through history `H` | `L` (back or forwrad)
- Go to a tab `K` | `J` (left or right)

## OS Shortcuts (macOS)

- `HYPR` Control, Shift, Alt and GUI = `⌃⇧⌥⌘`
- `LCAG` Control, Alt and GUI = `⌃⇧⌥`

Checkout keyboard [keymaps](../keyboards) and [Keycodes](https://github.com/qmk/qmk_firmware/blob/master/docs/keycodes.md).

- `⌘ + SPACE` Toogle search (Alfred)
- `HYPR + BACKTICK` Toggle macOS menu bar (via SKHD)
- `HYPR + L` Lock screen (via SKHD)
- `HYPR + D` Show desktop (via SKHD)
- `HYPR + ENTER` End current meeting or join the next one (via SKHD)
- `HYPR + \` Search in menu bar (via Bartender)
- `HYPR + ]` Toggle calendar dropdown (via Itsycal)
- `HYPR + [` Toggle meeting bar (via MeetingBar)
- `HYPR + P` Toggle network monitor (via Little Snitch)
- `HYPR + J` Join next meeting (via MeetingBar)
- `HYPR + U` Toogle computer awake mode (via SKHD)
- `HYPR + Y` Toggle "Do Not Disturb" [via macOS Shortcuts → Mission Control]
- `HYPR + W` Show quick access for password manager (via 1password)
- `HYPR + E` Lock password manager (via 1password)
- `HYPR + A` Show notification centre [via macOS Shortcuts → Mission Control]
- `HYPR + N` Toggle to switching minimal window (via Zoom)
- `HYPR + Z` Start/Stop screen sharing (via Zoom)
- `HYPR + X` Pause/Resume screen sharing (via Zoom)
- `HYPR + V` Start/Stop video (via Zoom)
- `HYPR + M` Mute/Unmute audio (via Zoom)
- `HYPR + B` Toggle in-meeting chat (via Zoom)
- `HYPR + N` Switch to minimal window (via Zoom)

## Yabai / SKHD

[koekeishiya/yabai](https://github.com/koekeishiya/yabai) and [koekeishiya/skhd](https://github.com/koekeishiya/skhd)

- `⌃⌥⌘ + r` Rotate windows
- `⌃⌥⌘ + y` Mirror tree y-axis
- `⌃⌥⌘ + x` Mirror tree x-axis
- `⌃⌥⌘ + a` Toggle float (only on bsp spaces)
- `⌃⌥⌘ + p` Toggle split vertically or horizontally with parent node
- `⌃⌥⌘ + e` Toggle layout
- `⌃⌥⌘ + s` Toggle sticky (show on all spaces)
- `⌃⌥⌘ + f` Toggle window fullscreen zoom
- `⌃⌥⌘ + d` Toggle window parent zoom
- `⌃⌥⌘ + o` Toggle desktop offset
- `⌃⌥⌘ + w` Destroy space (desktop)
- `⌃⌥⌘ + n` Create a desktop and follow focus
- `⌃⌥⌘ + m` Create a desktop, move focused window and follow focus
- `⌃⌥⌘ + 0` Balance size of windows
- `⌃⌥⌘ + -` Set the opacity of normal windows to minimum
- `⌃⌥⌘ + =` Set the opacity of normal windows to maximum

## Tmux

[tmux/tmux](https://github.com/tmux/tmux)

### Tmux Key Bindings

- `⌃b` + `:` Enter command mode
- `⌃b` + `E` Spread panes out evenly
- `⌃b` + `s` Show all sessions
- `⌃b` + `w` Show all windows
- `⌃b` + `f` Search for a pane
- `⌃b` + `%` Split current window/tab vertically (create a vertical pane)
- `⌃b` + `"` Split current window/tab horizontally (create a horizontal pane)
- `⌃b` + `c` Create a new window/tab
- `⌃b` + `x` Close current pane
- `⌃b` + `&` Close current window/tab
- `⌃b` + `,` Rename current window
- `⌃b` + `$` Rename current session
- `⌃b` + `(` Move to previous session
- `⌃b` + `)` Move to next session
- `⌃b` + `p` Move to previous window/tab
- `⌃b` + `n` Move to next window/tab
- `⌃b` + `1..9` Switch window/tab by number
- `⌃b` + `[` Enter copy mode
  - `Space` Start selection
  - `Enter` Copy selection
  - `Esc` Clear selection
  - `q` Quit mode
  - `g` Go to top line
  - `G` Go to bottom line
  - `↑` Scroll up
  - `↓` Scroll down
  - `h` Move cursor left
  - `j` Move cursor down
  - `k` Move cursor up
  - `l` Move cursor right
  - `w` Move cursor forward one word at a time
  - `b` Move cursor backward one word at a time
  - `/` Search forward
  - `?` Search backward
  - `n` Next keyword occurance
  - `N` Previous keyword occurance
- `⌃b` + `]` Paste copied text from clipboard
- `⌃b` + `?` List key bindings
- `⌃b` + `t` Show digital clock
- `⌃b` + `d` Detach from session
- `⌃b` + `l` Toggle last active window/tab
- `⌃b` + `;` Toggle last active pane
- `⌃b` + `q` Show pane numbers
- `⌃b` + `q` + `1..9` Switch pane by number
- `⌃b` + `o` Switch to next pane
- `⌃b` + `z` Toggle pane zoom
- `⌃b` + `!` Convert pane into a window
- `⌃b` + `{` Move the current pane left
- `⌃b` + `}` Move the current pane right
- `⌃b` + `I` Install tmux plugins
- `⌃b` + `U` Update tmux plugins
- `⌃b` + `⌥u` Uninstall/remove tmux plugin

#### Custom Tmux Key Bindings

- `⌃b` + `u` Grab and open any URL from the terminal window
- `⌃b` + `⌃s` Toggle panes synchronisation
- `⌃b` + `S` Save environment
- `⌃b` + `R` Restore environment
- `⌃b` + (`h` | `j` | `k` | `l`) or (`←` | `↓` | `↑` | `→`) Switch to a pane
- `⌃b` + (`H` | `J` | `K` | `L`) Resize panes
- `⌃b` + `⌃r` Reload config file
- `⌃b` + `b` List buffers that store copied text
- `⌃b` + `P` Opens a menu to choose a buffer for pasting
- `⌃⇧←` Swap current window with the left window
- `⌃⇧→` Swap current window with the right window
- `⌃b` + `Enter` Enter copy mode
  - `v` Begin selection
  - `V` Select line
  - `y` Copy selection
- `⌃b` + `y`
  - Copy text from the command line to the clipboard (normal mode)
  - Copy selection to system clipboard (copy mode)
- `⌃b` + `Y`
  - Copy current working directory to the clipboard (normal mode)
  - Copy selection and paste it to the command line (copy mode)

## Alacritty

[alacritty/alacritty](https://github.com/alacritty/alacritty)

### Tmux bindings

- `⌘ + :` Run a tmux command
- `⌘ + u` Grab and open any URL from the terminal window
- `⌘ + p` Look up in files/directories
- `⌘⇧ + p` Show session tree
- `⌘ + s` Save environment
- `⌘⇧ + s` Restore environment
- `⌘ + d` Vertical pane
- `⌘⇧ + d` Horizontal pane
- `⌘ + w` Close pane/tab
- `⌘ + t` Open a new tab
- `⌘ + r` Rename a tab
- `⌘⇧ + r` Rename a session
- `⌘ + c` Start tmux copy mode
- `⌘ + v` Paste from clipboard

### Vi-mode

Use `ESC` or `⌃[` to enter Normal mode.

> **Note:** some of these key bindings are set by zsh by default when using a
> vi-mode keymap.

- `⌃ + p` : Change to a directory (Looking up in `~/.Code`)
- `⌃ + o` : Open a direcotry in editor (looking up in `~/.Code`)
- `⌃ + k` Previous command in history.
- `⌃ + j` Next command in history.
- `/` Search backward in history.
- `n` Repeat the last backward search.
- `⌃ + r` Search backward in history.
- `⌃ + s` Search forward in history.
- `vv` : Edit current command line in vim
- `⌃ + e` To the end of the line.
- `⌃ + a` To the beginning of the line.

## Vim/Neovim

- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [Neovim](https://neovim.io)
- [Vim](https://www.vim.org)

### Vim Glossary

- Buffer is the in-memory text of a file. Use to open up all required files.
- Window (AKA split or pane) is a viewport on a buffer. Use when you need
  multiple viewports of buffers.
- Tab is a collection of windows (splits). Make one when working on a different project.

### Vim Commands

#### Text Objects

- `:h text-objects` Help
- `viw` Select inner word
- `vi(`,`vib` Select inner of round braces
- `vi{`,`viB` Select inner of curly braces
- `vi[` Select inner of square brackets
- `vi"` Select inner of double quotes
- `vi'` Select inner of single quotes
- `gv` Select last visual selection
- `va(` Select outer of round braces
- `v%` Select while cursor is on starting/ending
- `"*y` Yank selected text to the system clipboard
- `y` Yank selected text
- `yy` Yank current line
- `yiw` Yank an inner word
- `ya{` Yank around `{}`

### Vim Plugins

#### Plug

[junegunn/vim-plug](https://github.com/junegunn/vim-plug)

- `:Plug<tab>` Choose a command

#### CtrlSF

[dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim?tab=readme-ov-file#key-maps)

In CtrlSF window:

- `Enter`, `o` - Open corresponding file of current line in the window which
  CtrlSF is launched from.
- `<C-O>` Like Enter but open file in a horizontal split window.
- `t` Like Enter but open file in a new tab.
- `p` Like Enter but open file in a preview window.
- `P` Like Enter but open file in a preview window and switch focus to it.
- `O` Like Enter but always leave CtrlSF window opening.
- `T` Like `t` but focus CtrlSF window instead of new opened tab.
- `M` Switch result window between normal view and compact view.
- `q` Quit CtrlSF window.
- `⌃J` Move cursor to next match.
- `⌃N` Move cursor to next file's first match.
- `⌃K` Move cursor to previous match.
- `⌃P` Move cursor to previous file's first match.
- `⌃C` Stop a background searching process.
- `⌃T` (If you have fzf installed) Use fzf for faster navigation. In the fzf
  window, use `<Enter>` to focus specific match and `⌃O` to open matched file.

In preview window:

- `q` Close preview window.

#### CtrlP

[kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)

- `:help ctrlp` Help
- `:help ctrlp-mappings`
- `:help ctrlp-extensions`
- `:help ctrlp-commands`
- `:help ctrlp-options`
- `⌃p` Toggle CtrlP in file mode
  - `<Tab>` Auto-complete directory names
  - `⌃f`, `⌃b` Cycle between "files", "buffers", "mru files" (most recently used
    files) or "mixed" (all three modes at the same time)
  - `⌃d` Switch to filename only search instead of full path
  - `⌃r` Switch to regexp mode
  - `⌃k`, `⌃j` Navigate up and down in the results
  - `⌃n`, `⌃p` Select the next/previous string in the prompt's history
  - `⌃t` Open the entry in new tab
  - `⌃s`, `⌃x` Open the entry in split
  - `⌃v` Open the entry in vertical split
  - `⌃o` Open a file or open files marked by `⌃z`
  - `⌃y` Create a new file and its parent directories (type the relative file path)
  - `⌃z`
    - Mark/unmark a file to be opened with `⌃o`
    - Mark/unmark a file to create a new file in its directory using `⌃y`
  - `⌃g`, `⌃c`, `<Esc>` Exit
  - `..<CR>` Go up the directory tree by one or multiple levels
  - `?<CR>` Open mapping help
  - `foo:<command>` Execute a command while opening the file e.g. `foo:25` jump
    to the line 25
  - `<F5>`
    - Refresh the match window and purge the cache for the current directory
    - Remove deleted files from the MRU list
  - `<F7>`
    - Bookmarkdir mode: Wipe bookmark list
    - MRU mode: Wipe the list and delete entries marked by `⌃z`
    - Buffer mode: Delete entry under the cursor or delete multiple entries marked
      by `⌃z`

#### COC

[neoclide/coc.nvim)](https://github.com/neoclide/coc.nvim)

- `:checkhealth` Check and see if the coc.nvim service is running
- `:CocDiagnostics` Get all diagnostics of current buffer in location list
- `:CocInfo` Get some useful information after starting the server
- `[g`, `]g` Navigate through diagnostics
- `gd` Go to definition
- `gy` Go to type definition
- `gi` Go to implementation
- `gr` Go to references
- `K` Show documentation in preview mode
- `,rn` Rename a symbol
- `,f` Format selectd code
- `<space>a` Show all diagnostics
- `<space>e` Manage extensions
- `<space>c` Show commands
- `<space>o` Find symbol of current document
- `<space>s` Search workspace symbol

#### Fugitive

[tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) and [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb)

- `:help fugitive` Help
- `:G [git command]` Run any git command e.g. `:G add .`, `:G blame`, etc.
- `:G`, `⌃g` Bring up summary window
  - `<Enter>` Open the file
  - `<⌃n>` `<⌃p>` Move down an up between file names skipping blank lines in between
  - `-` Stage or unstage the file or hunk under the cursor and multiple lines can
    also be selected (`git add`/`git reset`)
  - `s` Stage a file/hunk under the cursor
  - `u` Unstage a file/hunk under the cursor
  - `U` Unstage everything
  - `X` Discard the change under the cursor
  - `P` Interactively add patches from a changed file under the cursor
  - `I` Interactively reset patches from a changed file under the cursor
  - `cc` Open commit window
  - `=` Toggle an inline diff of the file under the cursor
  - `o` Open the file or object under the cursor in a new split
  - `O` Open the file or object under the cursor in a new tab
  - `gO` Open the file or object under the cursor in a new vertical split
  - `p` Open the file or object under the cursor in a preview window
  - `C` Open the commit containing the current file
  - `(` Jump to the previous file, hunk or revision
  - `)` Jump to the next file, hunk or revision
  - `i` Jump to the next file or hunk, expanding inline diffs
  - `[c` Jump to previous hunk, expanding inline diffs automatically
  - `]c` Jump to next hunk, expanding inline diffs automatically
- `:Gwrite` Stage the current file to the index `git-add`
- `:Gread` Revert current file to last checked in version `git-checkout`
- `:Gdiff` Open diff to compare working copy (run it from a working tree file)
  - `:Gwrite` for entire file, `:diffput`for a hunk (more granular)
    - Stage a file/hunk when cursor is on working copy
    - Checkout a file/hunk when cursor is on index copy
  - `:Gread` for entire file, `:diffget`for a hunk (more granular)
    - Checkout a file/hunk when cursor is on working copy
    - Stage a file/hunk when cursor is on index copy
- `:GDelete`
  - Remove files from the working tree and from the index on the current file `git-rm`
  - Delete the buffer afterward
- `:GRemove` Like `:GDelete`, but keep the (now empty) buffer around
- `:GMove` Rename the current file and the corresponding vim buffer `git-mv`
- `:GRename` Like `:GMove` but operates relative to the parent directory of the
  current file
- `:GBrowse` Open the current file on Github with optional line range

#### Git Gutter

[airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)

- `]h` Go to next hunk - cycle through hunks in current buffer
- `[h` Go to previous hunk - cycle through hunks in current buffer
- `]c` Go to next hunk - cycle through hunks in all buffers
- `[c` Go to previous hunk - cycle through hunks in all buffers
- `<leader>gp` Preview the hunk
- `<leader>gs` Stage the hunk
- `<leader>gd` Undo the hunk
- `<leader>gf` Fold all unchanged lines, leaving just the hunks visible

#### GV

[gv.vim](https://github.com/junegunn/gv.vim)

- `:GV` Open commit browser
- `:GV!` List the commits that affected the current file
- `:GV?` List the revisions of the current file

`:GV` or `:GV?` can be used in visual mode to track the changes in the selected lines.

#### Nerd Tree

[preservim/nerdtree](https://github.com/preservim/nerdtree)

- `?` Help

#### Netrw

- `:h netrw` Help
- `⇧I` Toggle the banner
- `%` Create new file from netrw
- `d` Create new directory from netrw

#### FZF

[junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)

- `⌃t` Open a new tab
- `⌃x` Open in a new split
- `⌃v` Open in a new vertical split

#### Number Toggle

[jeffkreeftmeijer/vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)

- `,n` Switch to absolute or relative line numbers

## Vimium / Vimari

[philc/vimium](https://github.com/philc/vimium)
[televator-apps/vimari](https://github.com/televator-apps/vimari)

- `H` Go back in history
- `L` Go forward in history
- `K` Go one tab right
- `J` Go one tab left
- `t` Create new tab
- `x` Close current tab
- `X` Restore closed tab
- `r` Reload the page
- `j` Scroll down
- `k` Scroll up
- `h` Scroll left
- `l` Scroll right
- `u` Scroll a half page up
- `d` Scroll a half page down
- `gg` Scroll to the top of the page
- `G` Scroll to the bottom of the page
- `f` Open a link in the current tab
- `F` Open a link in a new tab
- `/` Enter find mode
- `n` Cycle forward to the next find match
- `N` Cycle backward to the previous find match
- `yy` Copy the current URL to the clipboard
- `gf` Cycle focus to the next frame
- `gi` Go to first input
- `i` Enter insert mode
- `o` Open URL, bookmark, or history entry
- `O` Open URL, bookmark, or history entry in a new tab
- `gs` View page source

## Footnote

- `⌘` Command (Cmd)
- `⇧` Shift
- `⌥` Option (Alt)
- `⌃` Control (Ctrl)
- `⇪` Caps Lock
- `⇥` Tab
- `⎋` Escape
