local M = {}

function M.setup()
  vim.api.nvim_set_hl(0, "VitalsPass",    { fg = "#00ff00" })
  vim.api.nvim_set_hl(0, "VitalsFail",    { fg = "#ff0000" })
  vim.api.nvim_set_hl(0, "VitalsPending", { fg = "#aaaaaa" })
end

return M
