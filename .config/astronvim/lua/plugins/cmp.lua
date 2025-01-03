return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"

    opts.sources = cmp.config.sources {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    }

    opts.mapping["<C-o>"] = cmp.mapping.confirm()
  end,
}
