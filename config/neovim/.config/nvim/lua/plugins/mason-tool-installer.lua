-- ███╗   ███╗ █████╗ ███████╗ ██████╗ ███╗   ██╗    ████████╗ ██████╗  ██████╗ ██╗
-- ████╗ ████║██╔══██╗██╔════╝██╔═══██╗████╗  ██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║
-- ██╔████╔██║███████║███████╗██║   ██║██╔██╗ ██║       ██║   ██║   ██║██║   ██║██║
-- ██║╚██╔╝██║██╔══██║╚════██║██║   ██║██║╚██╗██║       ██║   ██║   ██║██║   ██║██║
-- ██║ ╚═╝ ██║██║  ██║███████║╚██████╔╝██║ ╚████║       ██║   ╚██████╔╝╚██████╔╝███████╗
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
--
-- Declaratively install the formatters/linters used by conform.nvim and
-- nvim-lint, so a fresh machine auto-installs them (no manual :MasonInstall).
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    ensure_installed = {
      "stylua", -- lua    (conform)
      "prettier", -- json/web (conform)
      "black", -- python (conform)
      "rubocop", -- ruby   (conform + nvim-lint)
      "ktlint", -- kotlin (conform)
      "clang-format", -- c/cpp  (conform)
    },
  },
}
