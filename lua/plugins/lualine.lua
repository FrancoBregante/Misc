local M = {}

M.plugin = {
  "hoob3rt/lualine.nvim",
  config = function()
    require("plugins.lualine").config()
  end,
}

M.config = function ()
  require('lualine').setup {
    options = {
      theme = 'tokyonight'
    }
  }
end

return M
