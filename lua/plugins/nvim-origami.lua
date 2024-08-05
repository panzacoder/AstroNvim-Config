--============================================================================--
--
-- https://github.com/chrisgrieser/nvim-origami
-- https://github.com/AstroNvim/astrocommunity/tree/d2d0fb72372ab9e0714ad36ebfe018f86e848723/lua/astrocommunity/editing-support/nvim-origami
--
--============================================================================--
--
-- TUTORIAL:
--   - Use `h` at the first non-blank character of a line (or before) to fold.
--   - Use `l` anywhere on a folded line to unfold it.
--
-- This allows you to ditch zc, zo, and za – you can just use h and l to work
-- with folds. (h still moves left if not at the beginning of a line, and l
-- still moves right when on an unfolded line – this plugin basically
-- "overloads" those keys.)
--
-- By default, the plugin pauses folds while searching, and restore them when
-- done with searching. (Normally, folds are opened when you search for some
-- text inside a fold, and stay open afterward.)
--
-- It also remembers folds across sessions (and as a side effect, also the
-- cursor position).
--
-- OPTIONS:
--   - hOnlyOpensOnFirstColumn: Only hides folds when cursor is at the very
--     first column in vim, generally, and `h` is pressed again.
--
-- COMMUNITY PLUGIN: yes
--   - Specified here to override the default config
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  "chrisgrieser/nvim-origami",
  event = "BufReadPost", -- later or on keypress would prevent saving folds
  opts = {
    hOnlyOpensOnFirstColumn = true,
  }, -- an empty opts table is needed even when using default config
}
