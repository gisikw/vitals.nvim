local Component = require('lualine.component'):extend()
local highlight = require('lualine.highlight')

function Component:init(options)
  Component.super.init(self, options)

  self.symbol = {
    pass = "󰗠",
    fail = "󰀨",
    pending = "󰪞",
  }

  self.colors = {
    pass = highlight.create_component_highlight_group(
      { fg = '#00ff00' }, 'VitalsPass', self.options),
    fail = highlight.create_component_highlight_group(
      { fg = '#ff5555' }, 'VitalsFail', self.options),
    pending = highlight.create_component_highlight_group(
      { fg = '#aaaaaa' }, 'VitalsPending', self.options),
  }
end

function Component:update_status()
  local checkers = require("vitals.manager").checkers
  local icons = {}

  for _, checker in ipairs(checkers) do
    local status = checker.status or "pending"
    local color = self.colors[status] or self.colors.pending
    local icon = self.symbol[status] or self.symbol.pending

    table.insert(icons,
      highlight.component_format_highlight(color) .. icon)
  end

  return table.concat(icons, " ") .. " "
end

return Component
