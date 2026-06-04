-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- ── Language packs (ACTIVE: your dev tooling — LSP, treesitter, formatting) ──
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.markdown" },

  -- ── Everything else from your v4 config (COMMENTED for the lean start) ──
  -- Re-enable any you find yourself missing; remove the leading `--`.
  -- lazydev removed: now bundled in AstroNvim v6 core.
  --
  -- UI / statusline
  -- { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  --
  -- Completion sources — NOTE: these were nvim-cmp sources; v6 uses blink.cmp,
  -- so they need blink-compatible equivalents before re-enabling.
  -- { import = "astrocommunity.completion.cmp-calc" },
  -- { import = "astrocommunity.completion.cmp-spell" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" }, -- (Copilot completion — skipping for now)
  --
  -- Editing support
  -- { import = "astrocommunity.editing-support.mini-operators" },
  -- { import = "astrocommunity.editing-support.nvim-origami" },
  -- { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  -- { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- { import = "astrocommunity.editing-support.treesj" },
  -- { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  -- { import = "astrocommunity.editing-support.vim-move" },
  --
  -- Git
  -- { import = "astrocommunity.git.blame-nvim" },
  -- { import = "astrocommunity.git.diffview-nvim" },
  -- { import = "astrocommunity.git.neogit" },
  -- { import = "astrocommunity.git.octo-nvim" },
  --
  -- Markdown / latex extras
  -- { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  --
  -- Motion
  -- { import = "astrocommunity.motion.hop-nvim" },
  -- { import = "astrocommunity.motion.nvim-surround" }, -- needed by surround-shortcuts.lua
  --
  -- Dotfiles / utility
  -- { import = "astrocommunity.pack.chezmoi" },
  -- { import = "astrocommunity.utility.nvim-toggler" },
}
