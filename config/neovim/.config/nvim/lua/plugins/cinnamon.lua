--  ██████╗██╗███╗   ██╗███╗   ██╗ █████╗ ███╗   ███╗ ██████╗ ███╗   ██╗
-- ██╔════╝██║████╗  ██║████╗  ██║██╔══██╗████╗ ████║██╔═══██╗████╗  ██║
-- ██║     ██║██╔██╗ ██║██╔██╗ ██║███████║██╔████╔██║██║   ██║██╔██╗ ██║
-- ██║     ██║██║╚██╗██║██║╚██╗██║██╔══██║██║╚██╔╝██║██║   ██║██║╚██╗██║
-- ╚██████╗██║██║ ╚████║██║ ╚████║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
--  ╚═════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
-- https://github.com/declancm/cinnamon.nvim

return {
  "declancm/cinnamon.nvim",
  config = function()
    require('cinnamon').setup {
      disabled = false,
      keymaps = {
          basic = true,
          extra = true,
      },
      options = {
          callback = nil, ---@type function?
          delay = 7,
          max_delta = {
              line = nil, ---@type number?
              column = nil, ---@type number?
              time = 1000, ---@type number
          },
          mode = "window", ---@type "cursor" | "window"
      },
    }
  end,
}
