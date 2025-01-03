-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "typescript",
      "tsx",
      "javascript",
      "json",
      "terraform",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
