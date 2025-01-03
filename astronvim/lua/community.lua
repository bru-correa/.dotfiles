-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.lsp.lsp-signature-nvim", opts = { hint_enable = true } },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- Theme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Experimental
  { import = "astrocommunity.fuzzy-finder.fzf-lua" },
  -- { import = "astrocommunity.completion.blink-cmp" },

  {
    import = "astrocommunity.recipes.vscode",
    opts = {
      keymap = {
        ["<C-o>"] = { "accept", "fallback" },
      },
    },
  },

  -- { import = "astrocommunity.pack.nvchad-ui" },
  -- import/override with your plugins folder
}
