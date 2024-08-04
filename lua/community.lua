-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.completion.cmp-calc" }, -- Inline calculations
  { import = "astrocommunity.completion.cmp-spell" }, -- Inline spelling suggestions
  { import = "astrocommunity.completion.copilot-lua-cmp" }, -- Automatic code completion through copilot
  { import = "astrocommunity.editing-support.mini-operators" }, --  FIXME: (gx doesn't work) g= Evaluate text and replace with output, gx exchange text regions, gm multiply text, gr replace text with register, gs sort text
  { import = "astrocommunity.editing-support.nvim-origami" }, -- Fold with h (but only from the very beginning of the line, expand with l
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" }, -- Intelligent ends for if, do, etc.
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" }, -- Highlights ends for { and [ more intelligently
  { import = "astrocommunity.editing-support.treesj" }, -- Splitting and joining blocks of code. <Leader>m (or s or j)
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" }, -- Works in the background, I think?
  { import = "astrocommunity.editing-support.vim-move" }, -- "drag visuals" plugin. opt + j or k. Also supports h and l.
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.octo-nvim" }, -- Code review. <Leader>O (capital o for Octo), list PRs. <Leader> [O]cto > [p]ull requests > [t] list open PRs
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  { import = "astrocommunity.motion.hop-nvim" }, -- Type lowercase s, then jump to words/lines with 2 letters
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.neovim-lua-development.lazydev-nvim" },
  { import = "astrocommunity.pack.chezmoi" }, -- Dotfile manager
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.utility.nvim-toggler" }, -- <Leader>i - toggle true to false or yes to no.
}
