local config = require("vitals.config").load()
local manager = require("vitals.manager")

if config then
  require("vitals.highlight").setup()
  manager.start(config)
end

return {
  summary = manager.summary,
  icons = manager.icons,
  open = manager.show_log,
}
