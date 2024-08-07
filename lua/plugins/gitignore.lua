--============================================================================--
--
-- https://github.com/wintermute-cell/gitignore.nvim
--
--============================================================================--
--
-- Gitignore.nvim helps generate .gitignore files for specific technologies
-- like programming languages, frameworks, and tools.
--
-- It uses the gitignore.io API to fetch the list of available templates and
-- creates a .gitignore file in the root of the project.
--
-- TUTORIAL:
--   1. Open a project in Neovim
--   2. Run the command :Gitignore
--   3. Select the templates you want to include in the .gitignore file (e.g.
--      "Node", "Python", "Java"), select as many as you want
--   4. Press Enter
--   5. The .gitignore file is created in the root of the project
--
--------------------------------------------------------------------------------
return {
  { "wintermute-cell/gitignore.nvim", config = function() require "gitignore" end },
}
