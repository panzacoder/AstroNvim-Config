--============================================================================--
--
-- https://github.com/mattn/emmet-vim
--
--============================================================================--
--
-- emmet-vim is a vim plug-in which provides support for expanding
-- abbreviations similar to emmet.
--
--
-- TUTORIAL:
--
-- Type ("_" is the cursor position):
--
--     html:5_
--
-- Then type <c-y>, (Ctrl-Y<Leader>) and you should see:
--
-- <!DOCTYPE HTML>
-- <html lang="en">
-- <head>
-- 	 <meta charset="UTF-8">
-- 	 <title></title>
-- </head>
-- <body>
-- 	 _
-- </body>
-- </html>
--
-- STATUS: experimental
-- TODO: (2024-08-04) Jon => Test emmet-vim in jsx and TS files and see if it
-- works properly
--
--------------------------------------------------------------------------------

---@type LazySpec
return {
  {
    "mattn/emmet-vim",
    config = function()
      -- Set global variables for emmet-vim
      vim.g.user_emmet_settings = {
        typescript = {
          extends = "jsx",
        },
        javascript = {
          extends = "jsx",
        },
      }
      -- Set other Emmet options
      -- vim.g.user_emmet_leader_key = "<C-Z>"
    end,
  },
}
