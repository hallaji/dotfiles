-- ███╗   ███╗ █████╗ ███████╗ ██████╗ ███╗   ██╗    ████████╗ ██████╗  ██████╗ ██╗
-- ████╗ ████║██╔══██╗██╔════╝██╔═══██╗████╗  ██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║
-- ██╔████╔██║███████║███████╗██║   ██║██╔██╗ ██║       ██║   ██║   ██║██║   ██║██║
-- ██║╚██╔╝██║██╔══██║╚════██║██║   ██║██║╚██╗██║       ██║   ██║   ██║██║   ██║██║
-- ██║ ╚═╝ ██║██║  ██║███████║╚██████╔╝██║ ╚████║       ██║   ╚██████╔╝╚██████╔╝███████╗
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
--
-- Declaratively install the formatters/linters (conform.nvim, nvim-lint) and
-- language servers (auto-enabled by mason-lspconfig) so a fresh machine
-- auto-installs them on `Lazy sync` — no manual :MasonInstall / dotup step.
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    ensure_installed = {
      -- formatters / linters
      "stylua", -- lua    (conform)
      "prettier", -- json/web (conform)
      "black", -- python (conform)
      "rubocop", -- ruby   (conform + nvim-lint)
      "ktlint", -- kotlin (conform)
      "clang-format", -- c/cpp  (conform)
      -- language servers (mason-lspconfig auto-enables installed servers)
      "bash-language-server", -- bash
      "eslint_d", -- js/ts lint
      "gopls", -- go
      "kotlin-language-server", -- kotlin
      "lua-language-server", -- lua
      "python-lsp-server", -- python
      "solargraph", -- ruby
      "tailwindcss-language-server", -- tailwind
      "typescript-language-server", -- js/ts
    },
  },
}
