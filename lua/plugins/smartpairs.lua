--============================================================================--
--
-- https://github.com/gorkunov/smartpairs.vim
--
--============================================================================--
--
-- smartpairs allows you to forget about difficult keys combination like vi{ or
-- va".
--
-- Now you can use only one shortcut for all typical combinations. Even if
-- you've already selected something you can easily correct selection by using
-- smartpairs.
--
-- vi* -> viv    --> visual select inside * object
-- va* -> vav    --> visual select around * object
-- ci* -> civ    --> change inside        * object
-- ca* -> cav    --> change around        * object
-- di* -> div    --> delete inside        * object
-- da* -> dav    --> delete around        * object
-- yi* -> yiv    --> yank   inside        * object
-- ya* -> yav    --> yank   around        * object
--
-- Where * is in <, >, ", ', `, (, ), [, ], {, } or t as tag
--
-- After v* commands you can press v again and selection will be extended to
-- the next pairs.
--
-- TIP: Revert selection one pair at a time with <C-B> (think "back")
--------------------------------------------------------------------------------

-- Default is <C-V>. Changed so that visual block selection works with <C-V>
vim.g.smartpairs_revert_key = "<C-B>" -- "Go Back" key

---@type LazySpec
return {
  { "gorkunov/smartpairs.vim" },
}
