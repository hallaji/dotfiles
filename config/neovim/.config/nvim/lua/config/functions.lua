-- ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
-- █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
-- ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
-- ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
-- ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
--
-- Reusable helper functions, required on demand (e.g. by config.mappings or
-- config.commands). Mirrors config/zsh/.config/zsh/functions.zsh.

local M = {}

-- ┌─┐┬
-- ├─┤│
-- ┴ ┴┴

-- Run the headless `claude` CLI with `stdin` piped in, showing a sticky
-- notification that the completion handler replaces in place. `on_output` gets
-- the trimmed, fence-stripped stdout on success; returning false from it
-- suppresses the success notification (e.g. when the target buffer is gone).
local function run_claude(opts)
  local nid = { id = opts.id, title = "Claude" }
  vim.notify(opts.working, vim.log.levels.INFO, vim.tbl_extend("force", nid, { timeout = false }))
  vim.system(
    { "claude", "-p", opts.prompt },
    { stdin = opts.stdin, text = true },
    vim.schedule_wrap(function(obj)
      if obj.code ~= 0 or vim.trim(obj.stdout or "") == "" then
        local err = obj.stderr ~= "" and obj.stderr or "no output"
        vim.notify("claude failed: " .. err, vim.log.levels.ERROR, nid)
        return
      end
      -- Strip stray code fences the model sometimes adds.
      local out = vim.trim(obj.stdout):gsub("^```%w*\n", ""):gsub("\n```$", "")
      if opts.on_output(out) ~= false then
        vim.notify(opts.done, vim.log.levels.INFO, vim.tbl_extend("force", nid, { timeout = 2000 }))
      end
    end)
  )
end

-- Draft the commit message from staged changes via `claude`. Replaces the
-- message area (everything above the first comment line), so it is safe to
-- re-run. The diff is piped on stdin to sidestep argv size limits.
function M.claude_commit_message(buf)
  local diff = vim.fn.system({ "git", "diff", "--cached", "--no-color" })
  if vim.v.shell_error ~= 0 then
    vim.notify("git diff failed: " .. diff, vim.log.levels.ERROR)
    return
  end
  if vim.trim(diff) == "" then
    vim.notify("No staged changes to summarise.", vim.log.levels.WARN)
    return
  end

  local prompt = table.concat({
    "Write a git commit message for the staged changes piped on stdin.",
    "Follow Conventional Commits: a `type(scope): summary` subject line",
    "(types: feat, fix, perf, chore, docs, refactor, test), imperative mood,",
    "~50 chars, lowercase summary, no trailing period. If the change needs",
    "explaining, add a blank line then a body of at most 3 lines as one plain",
    "paragraph — no bullet lists, no trailers. Output ONLY the commit message,",
    "with no code fences, quoting, or preamble.",
  }, "\n")

  run_claude({
    id = "claude_commit_message",
    working = "Writing the commit message…",
    done = "Commit message drafted.",
    prompt = prompt,
    stdin = diff,
    on_output = function(msg)
      if not vim.api.nvim_buf_is_valid(buf) then
        return false
      end
      local new_lines = vim.split(msg, "\n", { plain = true })
      -- Message area = everything above the first git comment line.
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local msg_end = #lines
      for i, l in ipairs(lines) do
        if l:match("^#") then
          msg_end = i - 1
          break
        end
      end
      table.insert(new_lines, "") -- keep a blank line before the git comments
      vim.api.nvim_buf_set_lines(buf, 0, msg_end, false, new_lines)
    end,
  })
end

-- Rewrite the last visual selection in place against a prompt, via `claude`.
-- Invoke through `:<C-u>lua …` from visual mode so the '< '> marks are set
-- before this runs. Charwise, linewise, and multibyte selections are handled.
function M.claude_rewrite_selection()
  local buf = vim.api.nvim_get_current_buf()
  local regtype = vim.fn.visualmode()
  if regtype == "" then
    return
  end
  local p1, p2 = vim.fn.getpos("'<"), vim.fn.getpos("'>")
  local text = vim.fn.getregion(p1, p2, { type = regtype })
  if #text == 0 then
    return
  end
  local selection = table.concat(text, "\n")

  -- Precise start/end for the in-place replacement, captured now (before the
  -- async round-trip) from the region positions.
  local pos = vim.fn.getregionpos(p1, p2, { type = regtype })
  local s, e = pos[1][1], pos[#pos][2]
  local srow, scol, erow, ecol = s[2] - 1, s[3] - 1, e[2] - 1, e[3]
  local ft = vim.bo[buf].filetype

  vim.ui.input({ prompt = "Claude rewrite: " }, function(instruction)
    if not instruction or vim.trim(instruction) == "" then
      return
    end
    local prompt = table.concat({
      "Rewrite the text piped on stdin according to this instruction:",
      instruction,
      "",
      "The text is a" .. (ft ~= "" and " " .. ft or "") .. " selection from an editor.",
      "Preserve surrounding style and indentation. Output ONLY the replacement",
      "text, with no explanation, commentary, or code fences.",
    }, "\n")

    run_claude({
      id = "claude_rewrite",
      working = "Rewriting selection…",
      done = "Selection rewritten.",
      prompt = prompt,
      stdin = selection,
      on_output = function(out)
        if not vim.api.nvim_buf_is_valid(buf) then
          return false
        end
        local new_lines = vim.split(out, "\n", { plain = true })
        local ok = pcall(vim.api.nvim_buf_set_text, buf, srow, scol, erow, ecol, new_lines)
        if not ok then
          vim.notify(
            "Rewrite failed: the selection moved before Claude replied.",
            vim.log.levels.ERROR
          )
          return false
        end
      end,
    })
  end)
end

-- Toggle the Claude Code terminal with a chosen provider. claudecode.nvim
-- resolves its provider from global config, not per-command, so pin it right
-- before toggling to keep each binding deterministic regardless of which was
-- used last. A one-arg setup only touches `provider`, leaving the external
-- terminal command and env intact.
function M.claude_toggle(provider)
  ---@diagnostic disable-next-line: missing-fields
  require("claudecode.terminal").setup({ provider = provider })
  vim.cmd("ClaudeCode")
end

return M
