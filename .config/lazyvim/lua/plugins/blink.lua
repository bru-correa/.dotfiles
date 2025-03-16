return {
  "saghen/blink.cmp",
  opts = {
    signature = { enabled = true },

    keymap = {
      ["<c-k>"] = { "select_prev", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
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
    },
  },
}
