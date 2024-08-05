--============================================================================--
--
-- https://github.com/kylechui/nvim-surround
--
--============================================================================--
--
-- This plugin provides a simple way to surround text with quotes, brackets,
-- etc. It is a wrapper around the nvim-surround plugin.
--
-- TUTORIAL:
--   Put cursor on word & press <Leader>' for single quote surround
--   Put .......................<Leader>" for double quote surround
--   Put .......................<Leader>) for parentheses surround (no space)
--   Put .......................<Leader>( for parentheses surround (w/ space)
--   Put .......................<Leader>] for square bracket surround (no space)
--   Put .......................<Leader>[ for square bracket surround (w/ space)
--   Put .......................<Leader>} for curly brace surround (no space)
--   Put .......................<Leader>{ for curly brace surround (w/ space)
--   Put .......................<Leader>` for backtick surround
--   Put .......................<Leader># for Ruby string interpolation
--   Put .......................<Leader>$ for ES6 string interpolation
--
-- WARN: string interpolation assumes word already inside "" (ruby) or `` (es6)
-- NOTE: The same keymaps can be used in visual mode to surround SELECTED text
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<Leader>'"] = { "<CMD>normal ysiw'<CR>", desc = "Surround word with single quotes" },
        ['<Leader>"'] = { '<CMD>normal ysiw"<CR>', desc = "Surround word with double quotes" },
        ["<Leader>)"] = { "<CMD>normal ysiw)<CR>", desc = "Surround word with parentheses" },
        ["<Leader>("] = { "<CMD>normal ysiw(<CR>", desc = "Surround word with parentheses (no space)" },
        ["<Leader>]"] = { "<CMD>normal ysiw]<CR>", desc = "Surround word with square brackets" },
        ["<Leader>["] = { "<CMD>normal ysiw[<CR>", desc = "Surround word with square brackets (no space)" },
        ["<Leader>}"] = { "<CMD>normal ysiw}<CR>", desc = "Surround word with curly braces" },
        ["<Leader>{"] = { "<CMD>normal ysiw{<CR>", desc = "Surround word with curly braces (no space)" },
        ["<Leader>`"] = { "<CMD>normal ysiw`<CR>", desc = "Surround word with backtick" },
        ["<Leader>#"] = {
          '<cmd>normal! ciw#{<C-r>"}<CR>',
          desc = "Surround word with Ruby string interpolation",
        },
        ["<Leader>$"] = {
          '<cmd>normal! ciw${<C-r>"}<CR>',
          desc = "Surround word with ES6 string interpolation",
        },
      },
      v = {
        ["<Leader>'"] = { "<CMD>normal S'<CR>gv", desc = "Surround selection with single quotes" },
        ['<Leader>"'] = { '<CMD>normal S"<CR>gv', desc = "Surround selection with double quotes" },
        ["<Leader>)"] = { "<CMD>normal S)<CR>gv", desc = "Surround selection with parentheses" },
        ["<Leader>("] = { "<CMD>normal S(<CR>gv", desc = "Surround selection with parentheses (no space)" },
        ["<Leader>]"] = { "<CMD>normal S]<CR>gv", desc = "Surround selection with square brackets" },
        ["<Leader>["] = { "<CMD>normal S[<CR>gv", desc = "Surround selection with square brackets (no space)" },
        ["<Leader>}"] = { "<CMD>normal S}<CR>gv", desc = "Surround selection with curly braces" },
        ["<Leader>{"] = { "<CMD>normal S{<CR>gv", desc = "Surround selection with curly braces (no space)" },
        ["<Leader>`"] = { "<CMD>normal S`<CR>gv", desc = "Surround selection with backtick" },
        ["<Leader>#"] = {
          '<CMD>normal! c#{<C-r>"}<CR>',
          desc = "Surround selection with Ruby string interpolation",
        },
        ["<Leader>$"] = {
          '<CMD>normal! c${<C-r>"}<CR>',
          desc = "Surround selection with ES6 string interpolation",
        },
      },
    },
  },
}
