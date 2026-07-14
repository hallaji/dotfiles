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

-- Draft the commit message from staged changes via the headless `claude` CLI.
-- Replaces the message area (everything above the first comment line), so it is
-- safe to re-run. The diff is piped on stdin to sidestep argv size limits.
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

  -- Sticky notification (timeout = false); the completion handler replaces it
  -- in place via the shared id, so it stays up for the whole run.
  local notify_opts = { id = "claude_commit_message", title = "Claude" }
  vim.notify(
    "Writing the commit message…",
    vim.log.levels.INFO,
    vim.tbl_extend("force", notify_opts, { timeout = false })
  )
  vim.system(
    { "claude", "-p", prompt },
    { stdin = diff, text = true },
    vim.schedule_wrap(function(obj)
      if obj.code ~= 0 or vim.trim(obj.stdout or "") == "" then
        vim.notify(
          "claude failed: " .. (obj.stderr ~= "" and obj.stderr or "no output"),
          vim.log.levels.ERROR,
          notify_opts
        )
        return
      end
      if not vim.api.nvim_buf_is_valid(buf) then
        return
      end
      -- Strip stray code fences, then split into lines.
      local msg = vim.trim(obj.stdout):gsub("^```%w*\n", ""):gsub("\n```$", "")
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

      -- Replace the sticky notification with a self-dismissing confirmation.
      vim.notify(
        "Commit message drafted.",
        vim.log.levels.INFO,
        vim.tbl_extend("force", notify_opts, { timeout = 2000 })
      )
    end)
  )
end

return M
