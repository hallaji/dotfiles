# Cheat Sheet

## VIM

### Visual Selecttion

Use `v` for visual select. `i` is for inner and `a` for around selection.

- `viw` selects an inner word
- `vi(`,`vib` if the cursor is inside the parenthesis block
- `vi{`,`viB` for curly block
- `vi"` for double quotes
- `vi'` for single quotes
- `gv` reselect last visual selection
- `va(` selects around ()
- `v%` if the cursor is on a starting/ending of parenthesis or curly brace

### Yank/Copy

- `"*y` yanks selected text to the system clipboard
- `y` yanks selected text
- `yy` yanks current line
- `yiw` yanks an inner word
- `ya{` yanks around `{}`

### Navigation

- `]]` takes you to the next function or method
- `[[` takes you to the previous function or method

### Git Gutter

- `]h` Go to next hunk - cycle through hunks in current buffer
- `[h` Go to previous hunk - cycle through hunks in current buffer
- `]c` Go to next hunk - cycle through hunks in all buffers
- `[c` Go to previous hunk - cycle through hunks in all buffers
- `<leader>hp` Preview the hunk
- `<leader>hs` Stage the hunk
- `<leader>hu` Undo the hunk
- `<leader>hf` Fold all unchanged lines, leaving just the hunks visible

### VIM Plug

- `PlugUpgrade` Upgrade vim-plug itself
- `PlugUpdate [name ...] [#threads]` Install or update plugins

## Tmux

Prefix `Ctrl + b`

- `prefix + ,` Rename a window
- `prefix + I` Install tmux plugins
- `prefix + v` Create vertical pane
- `prefix + s` Create horizontal pane
- `prefix + c` Create a window/tab
- `prefix + &` Close a window/tab
- `prefix + x` Close a pane
- `prefix + h`, `prefix + j`, `prefix + k`, `prefix + l` Move between panes
- `prefix + H`, `prefix + J`, `prefix + K`, `prefix + L` Resize panes
- `prefix + <number>` Jump to specific window/tab
- `prefix + d` Detach current session

## Alacritty

### Tmux bindings

- `⌘ + D` Vertical pane
- `⌘ + shift + D` Horizontal pane
- `⌘ + W` Close pane/tab
- `⌘ + H` Move cursor to left pane
- `⌘ + J` Move cursor to bottom pane
- `⌘ + K` Move cursor to top pane
- `⌘ + L` Move cursor to left pane
- `⌘ + T` Open new tab
- `⌘ + ←` Resize pane to left
- `⌘ + →` Resize pane to down
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

## Vi-mode

Use `ESC` or `CTRL-[` to enter Normal mode.

NOTE: some of these key bindings are set by zsh by default when using a vi-mode keymap.

### Find/Edit source code

- `ctrl-p` : Find and edit a code directory under `~/.Code`
- `ctrl-f` : Find a code direcotry under `~/.Code`

### History

- `ctrl-k` Previous command in history.
- `ctrl-j` Next command in history.
- `/` Search backward in history.
- `n` Repeat the last backward search.
- `ctrl+r` Search backward in history.
- `ctrl+s` Search forward in history.

### Vim edition

- `vv` : Edit current command line in Vim
NOTE: this used to be bound to `v`. That is now the default (visual-mode)

### Movement

- `ctrl+e` To the end of the line.
- `ctrl+a` To the beginning of the line.
`$` To the end of the line.
`^` To the first non-blank character of the line.
`0` To the first character of the line.
`w` [count] words forward.
`W` [count] WORDS forward.
`e` Forward to the end of word [count] inclusive.
`E` Forward to the end of WORD [count] inclusive.
`b` [count] words backward.
`B` [count] WORDS backward.
`t{char}` Till before [count]'th occurrence of {char} to the right.
`T{char}` Till before [count]'th occurrence of {char} to the left.
`f{char}` : To [count]'th occurrence of {char} to the right.
`F{char}` : To [count]'th occurrence of {char} to the left.
`;` Repeat latest f, t, F or T [count] times.
`,` Repeat latest f, t, F or T in opposite direction.

### Insertion

`i` Insert text before the cursor
`I` Insert text before the first character in the line
`a` Append text after the cursor
`A` Append text at the end of the line
`o` Insert new command line below the current one
`O` Insert new command line above the current one

### Delete and Insert

`ctrl-h` While in Insert mode: delete character before the cursor
`ctrl-w` While in Insert mode: delete word before the cursor
`d{motion}` Delete text that {motion} moves over
`dd` Delete line
`D` Delete characters under the cursor until the end of the line
`c{motion}` Delete {motion} text and start insert
`cc` Delete line and start insert
`C` Delete to the end of the line and start insert
`r{char}` Replace the character under the cursor with {char}
`R` Enter replace mode: Each character replaces existing one
`x` Delete count characters under and after the cursor
`X` Delete count characters before the cursor
