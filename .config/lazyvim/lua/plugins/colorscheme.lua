-- Define the colorscheme at the end of the file

return {

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {},
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
    },
    lazy = false,
  },

  {
    "rebelot/kanagawa.nvim",
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "kanagawa",
        callback = function()
          vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
        end,
      })
    end,
    opts = {
      transparent = true,
      -- -- Highlight background color of diagnostics
      -- overrides = function(colors)
      --   local theme = colors.theme
      --   local makeDiagnosticColor = function(color)
      --     local c = require("kanagawa.lib.color")
      --     return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
      --   end
      --
      --   return {
      --     DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
      --     DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
      --     DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
      --     DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
      --   }
      -- end,

      -- Dark completion popup menu
      overrides = function(colors)
        local theme = colors.theme
        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
