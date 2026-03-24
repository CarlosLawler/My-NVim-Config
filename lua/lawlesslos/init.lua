-- Load core configuration in order:
-- 1. settings (editor behavior)
-- 2. keymaps (user interaction)
-- 3. plugins (lazy.nvim + plugin definitions)

require("lawlesslos.set")
require("lawlesslos.remap")
require("lawlesslos.lazy")
require("lawlesslos.colors")
