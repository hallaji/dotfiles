# Cheat Sheet

- [Cheat Sheet](#cheat-sheet)
  - [Steering Focus](#steering-focus)
    - [Spaces & Monitors (Yabai / SKHD)](#spaces--monitors-yabai--skhd)
    - [Terminals (Alacritty)](#terminals-alacritty)
    - [Editors (VIM / VSCode)](#editors-vim--vscode)
    - [Browsers (Vimium / Vimari)](#browsers-vimium--vimari)
  - [OS Shortcuts (macOS)](#os-shortcuts-macos)
    - [Menubar](#menubar)
    - [Meetings](#meetings)
    - [Password Manager](#password-manager)
    - [General](#general)
  - [Yabai / SKHD](#yabai--skhd)
  - [Tmux](#tmux)
    - [Tmux Glossary](#tmux-glossary)
    - [Tmux Key Bindings](#tmux-key-bindings)
      - [Custom Key Bindings](#custom-key-bindings)
    - [Tmux Commands](#tmux-commands)
  - [Alacritty](#alacritty)
    - [Tmux bindings](#tmux-bindings)
    - [Vi-mode](#vi-mode)
  - [Vim](#vim)
    - [Vim Glossary](#vim-glossary)
    - [Vim Commands](#vim-commands)
      - [General Commands](#general-commands)
      - [Tab Commands](#tab-commands)
      - [Buffer Commands](#buffer-commands)
      - [Normal Mode](#normal-mode)
        - [Custom Mappings in Normal Mode](#custom-mappings-in-normal-mode)
      - [Insert Mode](#insert-mode)
        - [Custom Mappings in Insert Mode](#custom-mappings-in-insert-mode)
      - [Visual Mode](#visual-mode)
        - [Custom Mappings in Visual Mode](#custom-mappings-in-visual-mode)
      - [Visual Selection](#visual-selection)
      - [Yank/Copy](#yankcopy)
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

- Resize a window: `⌃⌥⌘` + (`←` | `↓` | `↑` | `→`)
- Focus on a window: `⌃⌥⌘` + (`h` | `j` | `k` | `l`)
- Move a window: `⌃⌥⌘` + (`home` | `pagedown` | `pageup` | `end`)
- Focus on a monitor by number `⌃⌥⌘` + (`1` | `2` | `3` | etc.)
- Focus on the next space `⌃⌥⌘ + Backtick`

### Terminals (Alacritty)

- Resize a pane: `⌘` + (`←` | `↓` | `↑` | `→`)
- Focus on a pane: `⌘` + (`h` | `j` | `k` | `l`)
- Move the cursor in vi-mode: `h` | `l` (left or right)
- Go through history in vi-mode: `j` | `k` (down or up)
- Move the cursor in Alacritty vi-mode: `h` | `j` | `k` | `l`
- Jump between Tmux tabs `⌘⇧` + (`h` | `l`)
- Jump between Tmux sessions `⌘⇧` + (`←` | `→`)
- Switch to a tab by number `⌘` + (`1` | `2` | `3` | etc.)

### Editors (VIM / VSCode)

- Resize a pane: `⌃` + (`←` | `↓` | `↑` | `→`)
- Focus on a pane: `⌃` + (`h` | `j` | `k` | `l`)
- Move the cursor: `h` | `j` | `k` | `l`

### Browsers (Vimium / Vimari)

- Scroll: `h` | `j` | `k` | `l`
- Scroll half a page: `u` | `d` (up or down )
- Go through history `H` | `L` (back or forwrad)
- Go to a tab `K` | `J` (left or right)

## OS Shortcuts (macOS)

Checkout keyboard [keymaps](../keyboards) to find the key place.

### Menubar

- `⌘ + Space` Toogle search (LaunchBar)
- `⌃⇧⌥⌘ + C` Toggle calendar dropdown (Itsycal)
- `⌃⇧⌥⌘ + ]` Toggle network monitor (Little Snitch)
- `⌃⇧⌥⌘ + [` Toggle network dropdown (iStat Menus)
- `⌃⇧⌥⌘ + P` Toogle battery/power dropdown (iStat Menus)
- `⌃⇧⌥⌘ + O` Toggle meeting bar (MeetingBar)
- `⌃⇧⌥⌘ + I` Toggle time dropdown (iStat Menus)
- `⌃⇧⌥⌘ + U` Toogle computer awake mode (Lungo) [via SKHD]
- `⌃⇧⌥⌘ + Y` Toogle mic/camera indicator (Micro Snitch)

### Meetings

- `⌃⇧⌥⌘ + M` End current meeting or join the next one otherwise (MeetingBar) [via SKHD]
- `⌃⇧⌥⌘ + J` Join next meeting (MeetingBar)
- `⌃⇧⌥⌘ + '` Toggle meeting title visibility (MeetingBar)
- `⌃⇧⌥⌘ + Z` Start/Stop screen sharing (Zoom)
- `⌃⇧⌥⌘ + X` Pause/Resume screen sharing (Zoom)
- `⌃⇧⌥⌘ + A` Mute/Unmute audio (Zoom)
- `⌃⇧⌥⌘ + V` Start/Stop video (Zoom)

### Password Manager

- `⌃⇧⌥⌘ + 1` Toggle quick access for password manager (1password)
- `⌃⇧⌥⌘ + 2` Open password manager (1password)
- `⌃⇧⌥⌘ + 3` Lock password manager (1password)

### General

- `⌃⇧⌥⌘ + E` On/Off microphone (Applescript) [via macOS Shortcuts → Services]
- `⌃⇧⌥⌘ + N` Show notification centre [via macOS Shortcuts → Mission Control]
- `⌃⇧⌥⌘ + Backtick` Toggle menu bar
- `⌃⇧⌥⌘ + L` Lock screen [via SKHD]
- `⌃⇧⌥⌘ + D` Show desktop [via SKHD]
- `⌃⇧⌥⌘ + T` New terminal in current space [via SKHD]
- `⌃⇧⌥⌘ + R` New browser in current space [via SKHD]

## Yabai / SKHD

[koekeishiya/yabai](https://github.com/koekeishiya/yabai) and [koekeishiya/skhd](https://github.com/koekeishiya/skhd)

- `⌃⌥⌘ + r` Rotate windows
- `⌃⌥⌘ + y` Mirror tree y-axis
- `⌃⌥⌘ + x` Mirror tree x-axis
- `⌃⌥⌘ + p` Toggle picture-in-picture
- `⌃⌥⌘ + e` Toggle layout
- `⌃⌥⌘ + s` Toggle sticky (show on all spaces)
- `⌃⌥⌘ + f` Toggle window fullscreen zoom
- `⌃⌥⌘ + d` Toggle window parent zoom
- `⌃⌥⌘ + o` Toggle desktop offset
- `⌃⌥⌘ + w` Destroy space (desktop)
- `⌃⌥⌘ + c` Move window to previous space
- `⌃⌥⌘ + z` Move window to next space
- `⌃⌥⌘ + n` Create a desktop and follow focus
- `⌃⌥⌘ + m` Create a desktop, move focused window and follow focus
- `⌃⌥⌘ + 0` Balance size of windows
- `⌃⌥⌘ + -` Set the opacity of normal windows to minimum
- `⌃⌥⌘ + =` Set the opacity of normal windows to maximum

## Tmux

[tmux/tmux](https://github.com/tmux/tmux)

### Tmux Glossary

- Session is a collection of terminals that tmux handles and each session has windows.
- Window is a tab occupies the entire screen. It can be split into panes.

### Tmux Key Bindings

- `⌃ + b` + `:` Run a tmux command
- `⌃ + b` + `t` Show digital clock
- `⌃ + b` + `s` List sessions
- `⌃ + b` + `w` List windows
- `⌃ + b` + `(` Switch to previous session
- `⌃ + b` + `)` Switch to next session
- `⌃ + b` + `,` Rename a window
- `⌃ + b` + `I` Install tmux plugins
- `⌃ + b` + `U` Update tmux plugins
- `⌃ + b` + `⌥u` Uninstall/remove tmux plugin
- `⌃ + b` + `c` Create a window/tab
- `⌃ + b` + `&` Close a window/tab
- `⌃ + b` + `%` Split window/tab vertically (create vertical pane)
- `⌃ + b` + `"` Split window/tab horizontally (create horizontal pane)
- `⌃ + b` + `x` Close a window/tab or pane
- `⌃ + b` + `<number>` Jump to specific window/tab
- `⌃ + b` + `d` Detach current session
- `⌃ + b` + `[` Start copy mode
  - `Space` Start selection
  - `Enter` Copy selection
  - `q` Quit mode
- `⌃ + b` + `]` Paste copied text from clipboard

#### Custom Key Bindings

- `⌃ + b` + `⌃ + r` Reload tmux config file
- `⌃ + b` + `⌃ + s` Sync panes
- `⌃ + b` + `S` Save environment
- `⌃ + b` + `R` Restore environment
- `⌃ + b` + (`h` | `j` | `k` | `l`) Move between panes
- `⌃ + b` + (`H` | `J` | `K` | `L`) Resize panes
- `⌃ + b` + `u` Grab and open any URL from the terminal window
- `⌃⇧ + ←` Swap current window with left
- `⌃⇧ + →` Swap current window with right
- `⌃ + b` + `y`
  - Copy text from the command line to the clipboard (normal mode)
  - Copy selection to system clipboard (copy mode)
- `⌃ + b` + `Y`
  - Copy current working directory to the clipboard (normal mode)
  - Copy selection and paste it to the command line (copy mode)
- `⌃ + b` + `Enter` Enter copy mode
  - `v` Begin selection
  - `V` Select line
  - `y` Copy selection
- `⌃ + b` + `b` List buffers
- `⌃ + b` + `P` Choose buffer

### Tmux Commands

- `tmux ls` List all sessions managed by the server
- `tmux new [-n window-name] [-s session-name] [-t target-session]`
  - `-n` Specify a window name
  - `-s` Create a new session with name `session-name`
  - `-t` Group the new session with `target-session`
- `tmux attach` Attach latest session
  - `[-t target-session]` Switch to `target-session`
- `tmux detach` Detach latest session
  - `[-s target-session]` Detach all clients currently attached to the `target-session`
  - `[-t target-client]` Detach the current client if bound to a key `target-client`
- `tmux kill-session [-t target-session]` Destroy the given session and close any windows linked to it
- `tmux kill-server` Kill the tmux server and clients and destroy all sessions
- `tmux switch -t [target-session]` Switch between sessions

## Alacritty

[alacritty/alacritty](https://github.com/alacritty/alacritty)

### Tmux bindings

- `⌘ + :`   Run a tmux command
- `⌘ + u`   Grab and open any URL from the terminal window
- `⌘ + p`   Look up in files/directories
- `⌘⇧ + p`  Show session tree
- `⌘ + s`   Save environment
- `⌘⇧ + s`  Restore environment
- `⌘ + d`   Vertical pane
- `⌘⇧ + d`  Horizontal pane
- `⌘ + w`   Close pane/tab
- `⌘ + t`   Open a new tab
- `⌘ + r`   Rename a tab
- `⌘⇧ + r`  Rename a session
- `⌘ + c`   Start tmux copy mode
- `⌘ + v`   Paste from clipboard

### Vi-mode

Use `ESC` or `⌃[` to enter Normal mode.

> **Note:** some of these key bindings are set by zsh by default when using a vi-mode keymap.

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

## Vim

### Vim Glossary

- Buffer is the in-memory text of a file. Use to open up all required files.
- Window (AKA split or pane) is a viewport on a buffer. Use when you need multiple viewports of buffers.
- Tab is a collection of windows (splits). Make one when working on a different project.

### Vim Commands

Leader key `,`

#### General Commands

- `:ter[minal]` Open a terminal window
- `:w[rite]` Write the whole buffer to the current file
- `:up[date]` Similar to `:w[rite]`, but only write when the buffer has been modified

#### Tab Commands

- `:tab<tab>` See command
- `:tabnew [path]`, `:tabe[dit] [path]` Open a new tab with optional path or filename
- `:tabnext` Next tab
- `:tabprev` Previous tab
- `:tabfirst` First tab
- `:tablast` Last tab
- `:-tabmove` Move the tab page to the left
- `:+tabmove` Move the tab page to the right

#### Buffer Commands

- `:e[dit] file` Edit a file in a new buffer
- `:b<tab>` See commands
- `:buffer <tab>` Switch to a hidden buffer
- `:bn[ext]` Go to the next buffer
- `:bp[revious]` Go to the previous buffer
- `:bf[irst]` Got to the first buffer
- `:bl[ast]` Go to the last buffer
- `:bd[elete]` Delete a buffer (close a file)
- `:b[uffer]#` Go to a buffer by index #
- `:b[uffer] file` Go to a buffer by file
- `:buffers`, `:ls` List all open buffers

#### Normal Mode

- `⌃w>` `⌃w<`, `⌃>` `⌃<` Resize the width of current window
- `⌃w+`, `⌃w-` Resize the height of current window
- `⌃wh`, `⌃h` Move cursor to left window
- `⌃wj`, `⌃j` Move cursor to bottom window
- `⌃wk`, `⌃k` Move cursor to top window
- `⌃wl`, `⌃l` Move cursor to left window
- `⌃wo`, Close other windows
- `⌃wt` Make the first (top left) window current
- `⌃ww` Switch windows
- `⌃wx` Exchange current window with next one
- `⌃w=` Make all windows equal height & width
- `⌃wq` Quit a windows
- `⌃ws`, `:sp[lit] [file]` Create a horizontal window, two viewports on the same file
- `⌃wv`, `:vs[plit] [file]` Create a vertical window
- `⌃wn`, `:new [file]` Create a new window and start editing new empty file
- `:vert[ical] ba[ll]` Edit all buffers as vertical windows
- `⌃o`, `⌃i` Jump through "jump list", a list of places where the cursor has been
- `d{motion}` Delete text that {motion} moves over
- `dd` Delete line
- `D` Delete characters under the cursor until the end of the line
- `c{motion}` Delete {motion} text and start insert
- `cc` Delete line and start insert
- `C` Delete to the end of the line and start insert
- `r{char}` Replace the character under the cursor with {char}
- `R` Enter replace mode: Each character replaces existing one
- `x` Delete count characters under and after the cursor
- `X` Delete count characters before the cursor
- `i` Insert text before the cursor
- `I` Insert text before the first character in the line
- `a` Append text after the cursor
- `A` Append text at the end of the line
- `o` Insert new command line below the current one
- `O` Insert new command line above the current one
- `$` To the end of the line
- `^` To the first non-blank character of the line
- `0` To the first character of the line
- `w` [count] words forward
- `W` [count] WORDS forward
- `e` Forward to the end of word [count] inclusive
- `E` Forward to the end of WORD [count] inclusive
- `b` [count] words backward
- `B` [count] WORDS backward
- `qq` Record a macro
- `Q` Replay a macro recording

##### Custom Mappings in Normal Mode

- `<tab>`, `<S-tab>` Circle windows
- `]]` Go to the next function or method
- `[[` Go to the previous function or method
- `]b`, `[b` Circle buffers
- `]t`, `[t` Circle tabs
- `]h`, `[h` Circle hunks in a buffer
- `]c`, `[c` Circle hunks in all buffers
- `<leader>dot` Edit dotfiles in a new tab
- `<leader> ` Clear search highlighting with leader + space
- `<leader>/` Toggle commeneting a line
- `<leader>r` Toggle ruler
- `<leader>z` Toggle white space trimming
- `<leader>w` Toggle wrap
- `<leader>n` Toggle relatie number
- `⌃ + s`, `<leader>s` Save
- `⌃ + q`, `<leader>q` Quit
- `<leader>Q` Quit all
- `Backtick` Open NERDTree explorer
- `-` Open NNN picker
- `_` Open Netrw explorer
- `~` Open NNN explorer

#### Insert Mode

- `⌃ + h` Delete character before the cursor
- `⌃ + w` Delete word before the cursor

##### Custom Mappings in Insert Mode

- `⌃ + s` Save
- `⌃ + q` Quit

#### Visual Mode

##### Custom Mappings in Visual Mode

- `,y` Copy to the system clipboard
- `,p` Paste from the system clipboard
- `⌃ + q` Escape

#### Visual Selection

Use `v` for visual select. `i` is for inner and `a` for around selection.

- `viw` selects an inner word
- `vi(`,`vib` if the cursor is inside the parenthesis block
- `vi{`,`viB` for curly block
- `vi"` for double quotes
- `vi'` for single quotes
- `gv` reselect last visual selection
- `va(` selects around ()
- `v%` if the cursor is on a starting/ending of parenthesis or curly brace

#### Yank/Copy

- `"*y` yanks selected text to the system clipboard
- `y` yanks selected text
- `yy` yanks current line
- `yiw` yanks an inner word
- `ya{` yanks around `{}`

### Vim Plugins

#### Plug

[junegunn/vim-plug](https://github.com/junegunn/vim-plug)

- `:Plug<tab>` Choose a command

#### CtrlP

[kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)

- `:help ctrlp` Help
- `:help ctrlp-mappings`
- `:help ctrlp-extensions`
- `:help ctrlp-commands`
- `:help ctrlp-options`
- `⌃p` Toggle CtrlP in file mode
  - `<Tab>` Auto-complete directory names
  - `⌃f`, `⌃b` Cycle between "files", "buffers", "mru files" (most recently used files) or "mixed" (all three modes at the same time)
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
  - `foo:<command>` Execute a command while opening the file e.g. `foo:25` jump to the line 25
  - `<F5>`
    - Refresh the match window and purge the cache for the current directory
    - Remove deleted files from the MRU list
  - `<F7>`
    - Bookmarkdir mode: Wipe bookmark list
    - MRU mode: Wipe the list and delete entries marked by `⌃z`
    - Buffer mode: Delete entry under the cursor or delete multiple entries marked by `⌃z`

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
  - `-` Stage or unstage the file or hunk under the cursor and multiple lines can also be selected (`git add`/`git reset`)
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
- `:GRename` Like `:GMove` but operates relative to the parent directory of the current file
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

- `o` Open in prev window
- `t` Open in new tab
- `T` Open in new tab silently

#### Netrw

- `:help netrw`, `<F1>` Help
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
