--============================================================================--
--
-- https://github.com/andymass/vim-matchup
--
--============================================================================--
--
-- Highlight, navigate, and operate on sets of matching text. Extends vim's %
-- key to language-specific words instead of just single characters.
--
-- TUTORIAL:
--   - Place your cursor on a keyword, like function() and press % to jump to
--     its match (end, for example). Or def to end, or if to fi, etc.
--   - Press % again to jump back.
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "andymass/vim-matchup",
    -- lazy = false,
  },
}
