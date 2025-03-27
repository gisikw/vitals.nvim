local Checker = require("vitals.checker")

local M = {
  checkers = {},
}

function M.start(config)
  for _, spec in ipairs(config.checks) do
    local checker = Checker.new(spec)
    table.insert(M.checkers, checker)
    checker:start()
  end
end

function M.summary()
  local pass, fail, pending = 0, 0, 0
  for _, c in ipairs(M.checkers) do
    if c.status == "pass" then pass = pass + 1
    elseif c.status == "fail" then fail = fail + 1
    else pending = pending + 1 end
  end
  return { pass = pass, fail = fail, pending = pending }
end

function M.icons()
  local icons = {}
  for _, c in ipairs(M.checkers) do
    table.insert(icons, c:summary_icon())
  end
  return table.concat(icons, " ")
end

function M.show_log()
  -- TODO
end

return M
