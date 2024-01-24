

lua << EOF
require("gp").setup({
  openai_api_key = { "op", "read", "--account", "my.1password.com", "<%= ENV["OPENAI_API_KEY_SECRET_REFERENCE"] %>" },
})
EOF
