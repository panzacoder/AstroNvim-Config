-- AstroCore: editor options & features (your personal settings, ported active).
-- Your custom v4 keymaps live in `astrocore-custom.lua` (disabled) — pull from there
-- as you find yourself missing a mapping.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        virtualedit = "all", -- cursor can go anywhere
        shiftround = true, -- round indents to shiftwidth multiples
        iskeyword = vim.opt.iskeyword:append "-", -- treat kebab-case as one word
        listchars = { tab = "▸ ", eol = "¬" },
      },
    },
  },
}
