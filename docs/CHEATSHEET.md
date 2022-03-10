# Cheat Sheet

- [Cheat Sheet](#cheat-sheet)
  - [Yabai & SKHD](#yabai--skhd)
  - [Tmux](#tmux)
    - [Tmux Glossary](#tmux-glossary)
    - [Tmux Key Bindings](#tmux-key-bindings)
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

## Yabai & SKHD

[koekeishiya/yabai](https://github.com/koekeishiya/yabai) and [koekeishiya/skhd](https://github.com/koekeishiya/skhd)

- `⌃⌥ + 1` Focus on monitor #1
- `⌃⌥ + 2` Focus on monitor #2
- `⌃⌥ + 3` Focus on monitor #3
- `⌃⌥ + 0x32` Focus on the next space `0x32 = backtick`
- `⌃⌥ + h` Focus on left window
- `⌃⌥ + j` Focus on bottom window
- `⌃⌥ + k` Focus on top window
- `⌃⌥ + l` Focus on right window
- `⌃⌥ + home` Move window left
- `⌃⌥ + pagedown` Move window bottom
- `⌃⌥ + pageup` Move window top
- `⌃⌥ + end` Move window right
- `⌃⌥ + left` Resize window left
- `⌃⌥ + down` Resize window down
- `⌃⌥ + up` Resize window up
- `⌃⌥ + right` Resize window right
- `⌃⌥ + r` Rotate windows
- `⌃⌥ + y` Mirror tree y-axis
- `⌃⌥ + x` Mirror tree x-axis
- `⌃⌥ + p` Toggle picture-in-picture
- `⌃⌥ + e` Toggle layout
- `⌃⌥ + s` Toggle sticky (show on all spaces)
- `⌃⌥ + f` Toggle window fullscreen zoom
- `⌃⌥ + d` Toggle window parent zoom
- `⌃⌥ + o` Toggle desktop offset
- `⌃⌥ + w` Destroy space (desktop)
- `⌃⌥ + c` Move window to previous space
- `⌃⌥ + x` Move window to recent space
- `⌃⌥ + z` Move window to next space
- `⌃⌥ + n` Create a desktop and follow focus
- `⌃⌥ + m` Create a desktop, move focused window and follow focus
- `⌃⌥ + 0` Balance size of windows
- `⌃⌥ + -` Set normal window opacity to minimum
- `⌃⌥ + =` Set normal window opacity to maximum

## Tmux

[tmux/tmux](https://github.com/tmux/tmux)

### Tmux Glossary

- Session is a collection of terminals that tmux handles and each session has one more windows.
- Window is a tab occupies the entire screen. It can be split into panes.

### Tmux Key Bindings

Tmux prefix `⌃ + b`

- `prefix + ,` Rename a window
- `prefix + I` Install tmux plugins
- `prefix + U` Update tmux plugins
- `prefix + alt + u` Uninstall tmux plugins
- `prefix + v` Create vertical pane
- `prefix + s` Create horizontal pane
- `prefix + c` Create a window/tab
- `prefix + &` Close a window/tab
- `prefix + x` Close a pane
- `prefix + h`, `prefix + j`, `prefix + k`, `prefix + l` Move between panes
- `prefix + H`, `prefix + J`, `prefix + K`, `prefix + L` Resize panes
- `prefix + <number>` Jump to specific window/tab
- `prefix + d` Detach current session
- `prefix + u` Grab and open any URL from the terminal window

### Tmux Commands

- `tmux ls` List all sessions managed by the server
- `tmux new [-n window-name] [-s session-name] [-t target-session]`
  - `-n` Specify a window name
  - `-s` Create a new session with name `session-name`
  - `-t` Group the new session with `target-session`
- `tmux attach [-t target-session]` Attach or switch to `terget-session`
- `tmux detach [-s target-session] [-t target-client]`
  - `-s` Detach all clients currently attached to the `target-session`
  - `-t` Detach the current client if bound to a key `target-client`
- `tmux kill-session [-t target-session]` Destroy the given session and close any windows linked to it
- `tmux kill-server` Kill the tmux server and clients and destroy all sessions

## Alacritty

### Tmux bindings

- `⌘ + U` Grab and open any URL from the terminal window
- `⌘ + D` Vertical pane
- `⌘⇧ + D` Horizontal pane
- `⌘ + W` Close pane/tab
- `⌘ + H` Move cursor to left pane
- `⌘ + J` Move cursor to bottom pane
- `⌘ + K` Move cursor to top pane
- `⌘ + L` Move cursor to left pane
- `⌘ + T` Open a new tab
- `⌘ + R` Rename a tab
- `⌘⇧ + H` Previous tab
- `⌘⇧ + L` Next tab
- `⌘ + ←` Resize pane to left
- `⌘ + ↓` Resize pane to down
- `⌘ + ↑` Resize pane to up
- `⌘ + →` Resize pane to right
- `⌘ + 1` Switch to tab #1
- `⌘ + 2` Switch to tab #2
- `⌘ + 3` Switch to tab #3
- `⌘ + 4` Switch to tab #4
- `⌘ + 5` Switch to tab #5
- `⌘ + 6` Switch to tab #6
- `⌘ + 7` Switch to tab #7
- `⌘ + 8` Switch to tab #8
- `⌘ + 9` Switch to tab #9

### Vi-mode

Use `ESC` or `⌃[` to enter Normal mode.

> **Note:** some of these key bindings are set by zsh by default when using a vi-mode keymap.

- `⌃ + p` : Start editing a code directory under `~/.Code`
- `⌃ + o` : Open a code direcotry under `~/.Code`
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

- `,,` Toggle nerd tree

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
