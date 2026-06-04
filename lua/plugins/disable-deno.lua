-- Disable deno-nvim. The typescript-all-in-one community pack pulls it in for
-- Deno projects, but this machine's projects are node/bun (served by vtsls), and
-- deno-nvim uses the deprecated `require('lspconfig')` framework, which emits a
-- removal warning at startup. Re-enable (delete this file) if you start a Deno project.

---@type LazySpec
return {
  { "sigmasd/deno-nvim", enabled = false },
}
