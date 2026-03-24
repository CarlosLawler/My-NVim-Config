# Neovim Config — Carlos Lawler

This config is designed to be:
- Minimal
- Understandable
- Easy to extend
- Lua-first (no reliance on .vimrc)

---

# 🧠 High-Level Structure

init.lua
↓
lua/lawlesslos/init.lua
↓
- set.lua      (editor behavior)
- remap.lua    (keybindings)
- lazy.lua     (plugin manager + plugin list)
↓
after/plugin/
- telescope.lua   (plugin-specific config)
- treesitter.lua  (plugin-specific config)

---

# 📁 File Breakdown

## init.lua
Entry point. Only loads your main module.

## lua/lawlesslos/init.lua
Controls load order:
1. settings
2. keymaps
3. plugins

---

## set.lua
All core editor behavior:
- indentation
- scrolling
- search
- performance tweaks
- UI defaults

No keymaps. No plugins.

---

## remap.lua
All custom keybindings:
- leader key
- navigation
- splits
- escape shortcuts
- movement improvements

No settings. No plugins.

---

## lazy.lua
Bootstraps plugin manager (lazy.nvim) and defines plugins.

This is the ONLY place where plugins are declared.

---

## after/plugin/
Plugin-specific configuration.

Each file corresponds to one plugin:
- telescope.lua → Telescope setup + keymaps
- treesitter.lua → Treesitter setup

This keeps plugin logic separate from core config.

---

# 🔁 Load Order

1. init.lua
2. lawlesslos/init.lua
3. set.lua
4. remap.lua
5. lazy.lua (plugins loaded)
6. after/plugin/* (plugin configs applied)

---

# 🧩 Design Rules

- No duplicate logic across files
- Settings go in set.lua
- Keymaps go in remap.lua
- Plugins go in lazy.lua
- Plugin config goes in after/plugin/
- Keep everything readable and minimal

---

# 🚀 Future Additions (Planned)

- LSP (language servers)
- Autocompletion
- Formatting
- Git integration
- Harpoon / workflow tools

---

# 🛠 Debug Tips

Check if a module loads:
:lua print("loaded")

Check plugin manager:
:Lazy

Check health:
:checkhealth

---

# ✍️ Philosophy

If I don’t understand it, I don’t keep it.
