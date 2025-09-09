-- local custom_tokyonight = require("lualine.themes.tokyonight")
-- for _, mode in pairs(custom_tokyonight) do
--   for section, color in pairs(mode) do
--     if color.bg then
--       color.bg = "none"
--     end
--   end
-- end
--
-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   opts = function(_, opts)
--     opts.options.theme = custom_tokyonight
--     local function get_timerly_status()
--       local state = require("timerly.state")
--       if state.progress == 0 then
--         return ""
--       end
--       local total = math.max(0, state.total_secs + 1)
--       local mins = math.floor(total / 60)
--       local secs = total % 60
--       return string.format("%s %02d:%02d", state.mode:gsub("^%l", string.upper), mins, secs)
--     end
--     table.insert(opts.sections.lualine_x, get_timerly_status)
--   end,
-- }

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    opts.options.transparent = true

    local function get_timerly_status()
      local state = require("timerly.state")
      if state.progress == 0 then
        return ""
      end

      local total = math.max(0, state.total_secs + 1)
      local mins = math.floor(total / 60)
      local secs = total % 60

      return string.format("%s %02d:%02d", state.mode:gsub("^%l", string.upper), mins, secs)
    end

    table.insert(opts.sections.lualine_x, get_timerly_status)
  end,
}
