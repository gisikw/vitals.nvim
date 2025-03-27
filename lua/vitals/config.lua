local M = {}

function M.load()
  local cwd = vim.fn.getcwd()
  local path = cwd .. "/vitals.config.lua"
  local ok, config = pcall(dofile, path)
  if ok and config and type(config.checks) == "table" then
    return config
  end
end

return M
