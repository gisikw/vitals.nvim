# ⚡️ vitals.nvim

**vitals.nvim** is a minimalist background health monitor for Neovim. It
passively runs build, test, and lint commands and shows their status as simple,
unobtrusive icons in your statusline - no popups, no interruptions.

> Think GitHub PR checks, but for your local dev workflow.

---
> ⚠️ **Warning: This project is still taking shape.**
>
> vitals.nvim is in early development. The API and behavior may change, and
> portions of the README may not yet reflect the current code.
---

## ✨ Features

- 🧠 Runs background checkers (e.g. `vitest`, `eslint`, `cargo check`)
- 🎯 Shows a single icon per checker (pass/fail/pending) in the statusline
- 🔧 Configurable per project via `vitals.config.lua`
- 🎨 Clean statusline integration with custom highlight groups
- 💤 Fully passive: only visual feedback unless you ask for more
- 🔌 Powered by `vim.loop` and runs cross-platform with no dependencies

---

## 📦 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "gisikw/vitals.nvim",
  config = function()
    require("vitals")
  end,
}
```

---

## 🧪 Configuration

In your project root, create a `vitals.config.lua` file:

```lua
return {
  checks = {
    {
      name = "Tests",
      cmd = "pnpm exec vitest run",
      interval = 10,
    },
    {
      name = "Lint",
      cmd = "eslint .",
      interval = 30,
    },
  },
}
```

Each check runs on a timer (in seconds). You can mix and match commands freely.

---

## 📊 Lualine Integration

Vitals provides a native lualine component:

```lua
require("lualine").setup({
  sections = {
    lualine_c = {
      "branch",
      require("vitals.lualine"),
    },
  },
})
```

Each checker will be shown as a glyph:
- ✅ `󰗠` for pass
- ❌ `󰀨` for fail
- ⏳ `󰪞` for pending

---

## 🛣️ Roadmap

- [ ] Log viewer (e.g. `:VitalsLog`)
- [ ] File watcher support (in addition to timer)
- [ ] Per-checker `on_save` triggers
- [ ] Tool-specific adapters (e.g. `vitest` with smart diffing)
- [ ] Optional notification or virtual text integration
