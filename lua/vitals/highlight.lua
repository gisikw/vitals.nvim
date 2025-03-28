local M = {}

local fallback = {
  VitalsPass    = { fg = "#f0ff00" },
  VitalsFail    = { fg = "#ff0000" },
  VitalsPending = { fg = "#aaaaaa" },
}

local function try_link(name, target)
  if vim.fn.hlexists(target) == 1 then
    vim.api.nvim_set_hl(0, name, { link = target })
  else
    vim.api.nvim_set_hl(0, name, fallback[name])
  end
end

function M.setup()
  try_link("VitalsPass",    "DiagnosticOk")
  try_link("VitalsFail",    "DiagnosticError")
  try_link("VitalsPending", "DiagnosticInfo")
end

return M
