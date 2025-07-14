-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Languages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },

  -- Utils
  { import = "astrocommunity.file-explorer.mini-files" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.motion.mini-move" },

  -- AI
  -- { import = "astrocommunity.completion.avante-nvim" },
}
