--============================================================================--
--
-- https://github.com/tpope/vim-abolish
--
--============================================================================--
--
-- vim-abolish is a Vim plugin created by Tim Pope (tpope) that provides
-- several powerful features for dealing with word variants and patterns in
-- text. Here are some of the key functionalities:
--
--   1. SUBSTITUTION ENHANCEMENTS:
--      - The plugin enhances the :substitute command, allowing you to perform
--        more complex and flexible substitutions. For example, it can handle
--        case variations automatically.
--
--   2. CASE-COERCION:
--      - It provides commands to easily change the case of words (e.g.,
--        snake_case to camelCase, or vice versa). This is particularly useful
--        for programmers who need to switch between different naming
--        conventions.
--
--   3. ABBREVIATIONS:
--      - vim-abolish allows you to create smart abbreviations that expand in
--        different ways depending on the context. This can help in writing
--        repetitive code or text more efficiently.
--
--   4. SEARCH AND REPLACE:
--      - The plugin offers advanced search and replace capabilities, making it
--        easier to find and replace text with different case variations or
--        patterns.
--
-- TUTORIAL:
--   - :S/foo/bar/g – Perform a case-sensitive substitution of "foo" with "bar".
--   - :S/foo/bar/gc – Perform a sub w/ confirmation for each replacement.
--   - :Subvert/foo/bar/g – A powerful sub cmd that can handle case variations.

--   Want to turn fooBar into foo_bar?
--     - Press crs (coerce to snake_case)
--     - MixedCase (crm)
--     - camelCase (crc)
--     - UPPER_CASE (cru)
--     - dash-case (cr-)
--     - dot.case (cr.)
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  "tpope/vim-abolish",
}
