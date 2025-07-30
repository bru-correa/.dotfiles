return {
  "saghen/blink.cmp",
  opts = {
    signature = { enabled = true },

    keymap = {
      ["<c-k>"] = { "select_prev" },
      ["<c-j>"] = { "select_next" },
      ["<c-o>"] = { "select_and_accept", "fallback" },

      ["<c-l>"] = { "snippet_forward", "fallback" },
      ["<c-h>"] = { "snippet_backward", "fallback" },

      ["<c-u"] = { "scroll_documentation_up", "fallback" },
      ["<c-d"] = { "scroll_documentation_down", "fallback" },

      ["<tab>"] = {},
      ["<s-tab>"] = {},
    },

    completion = {
      ghost_text = { enabled = false },

      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
