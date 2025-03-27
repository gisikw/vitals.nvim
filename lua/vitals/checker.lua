local uv = vim.loop

local Checker = {}
Checker.__index = Checker

function Checker.new(spec)
  local self = setmetatable({}, Checker)
  self.name = spec.name
  self.cmd = spec.cmd
  self.interval = spec.interval or 30
  self.status = "pending"
  self.last_output = nil
  self.timer = nil
  return self
end

function Checker:start()
  self.timer = uv.new_timer()
  self.timer:start(0, self.interval * 1000, vim.schedule_wrap(function()
    self:run()
  end))
end

function Checker:run()
  vim.fn.jobstart(self.cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_exit = function(_, code)
      self.status = code == 0 and "pass" or "fail"
    end,
    on_stdout = function(_, data)
      self.last_output = table.concat(data, "\n")
    end,
    on_stderr = function(_, data)
      self.last_output = table.concat(data, "\n")
    end,
  })
end

function Checker:summary_icon()
  if self.status == "pass" then return "󰗠" end
  if self.status == "fail" then return "󰀨" end
  return "󰪞"
end

return Checker
