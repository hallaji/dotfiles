
-- ███████╗████████╗ █████╗ ██████╗ ████████╗██╗███████╗██╗   ██╗
-- ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔════╝╚██╗ ██╔╝
-- ███████╗   ██║   ███████║██████╔╝   ██║   ██║█████╗   ╚████╔╝
-- ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██║██╔══╝    ╚██╔╝
-- ███████║   ██║   ██║  ██║██║  ██║   ██║   ██║██║        ██║
-- ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝        ╚═╝
-- https://github.com/mhinz/vim-startify
-- https://github.com/mhinz/vim-startify/blob/master/doc/startify.txt

return {
  "mhinz/vim-startify",
  config = function()
    -- Generates a Startify table from a shell command
    local function commandToStartify(command)
      return function()
        local cmd_output = vim.fn.systemlist(command .. " 2>/dev/null")
        local files = vim.tbl_map(function(line)
          return { line = line, path = line }
        end, cmd_output)
        return files
      end
    end

    -- Reads ~/.NERDTreeBookmarks file and extract its second column
    local function nerdtreeBookmarks()
      local bookmarks = vim.fn.systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
      bookmarks = vim.list_slice(bookmarks, 1, -2) -- Slices an empty last line
      return vim.tbl_map(function(val)
        return { line = val, path = val }
      end, bookmarks)
    end

    vim.g.startify_fortune_use_unicode = 1 -- Use unicode characters
    vim.g.startify_bookmarks = {
      { d = vim.fn.expand("$DOTFILES") }
    }
    vim.g.startify_lists = {
      -- { type = 'files', header = {'   MRU'} }, -- Show most recently used files
      { type = 'dir', header = {'   MRU ' .. vim.fn.getcwd()} }, -- Show most recently used files in current directory
      { type = 'sessions', header = {'   Sessions'} }, -- Show sessions
      { type = nerdtreeBookmarks, header = {'   NERDTree Bookmarks'} }, -- Show NERDTree bookmarks
      { type = 'bookmarks', header = {'   Bookmarks'} }, -- Show bookmarks
      { type = commandToStartify("git ls-files -m"), header = {'   Git modified'} }, -- SHow modified files in git
      { type = commandToStartify("git ls-files -o --exclude-standard"), header = {'   Git untracked'} }, -- Show untracked files in git
      { type = 'commands', header = {'   Commands'} }, -- Show commands
    }
  end
}
