return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "clangd",
        "cpptools",
        "jsonlint",
        "hadolint",
        "dockerfile-language-server",
        "docker-compose-language-server",
        "eslint",
        "vtsls",
        "tailwindcss-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "tsx",
        "cpp",
        "c",
        "json",
        "dockerfile",
        "yaml",
        "bash",
        "scss",
        "toml",
      },
    },
  },

  { -- Linting
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require "lint"
      lint.linters_by_ft = {
        json = { "jsonlint" },
        dockerfile = { "hadolint" },
        htmldjango = { "djlint" },
        python = { "ruff" },
      }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local conf = require "nvchad.configs.cmp"
      local custom = require "configs.cmp"

      conf.mapping = custom.mapping
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {},
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
      "astro",
    },
  },

  { "folke/neodev.nvim", opts = {} },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"

      conf.defaults.mappings = {
        i = {
          ["<C-enter>"] = "to_fuzzy_refine",
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-o>"] = actions.select_default,
        },
        n = {
          ["\\"] = actions.select_horizontal,
          ["|"] = actions.select_vertical,
          ["q"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-o>"] = actions.select_default,
        },
      }

      conf.defaults.extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      }

      require("telescope").load_extension "persisted"
      require("telescope").load_extension "fzf"
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("which-key").setup()

      require("which-key").add {
        {
          { "<leader>S", group = "Session" },
          { "<leader>S_", hidden = true },
          { "<leader>g", group = "Git" },
          { "<leader>g_", hidden = true },
          { "<leader>l", group = "LSP" },
          { "<leader>l_", hidden = true },
          { "<leader>lw", group = "Workspaces" },
          { "<leader>lw_", hidden = true },
          { "<leader>f", group = "Search" },
          { "<leader>f_", hidden = true },
          { "<leader>b", group = "Buffers" },
          { "<leader>b_", hidden = true },
        },
      }
    end,
  },

  -- NOTE: Already has git signs by default
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   opts = {
  --     signs = {
  --       add = { text = "�" },
  --       change = { text = "�" },
  --       delete = { text = "??" },
  --       topdelete = { text = "?" },
  --       changedelete = { text = "~" },
  --       untracked = { text = "�" },
  --     },
  --
  --     on_attach = function(bufnr)
  --       local gs = package.loaded.gitsigns
  --
  --       local function opts(desc)
  --         return { buffer = bufnr, desc = desc }
  --       end
  --
  --       local map = vim.keymap.set
  --
  --       map("n", "<leader>gr", gs.reset_hunk, opts "Reset Hunk")
  --       map("n", "<leader>gp", gs.preview_hunk, opts "Preview Hunk")
  --       map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
  --     end,
  --   },
  -- },

  -- {
  --
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   opts = {
  --     menu = {
  --       width = vim.api.nvim_win_get_width(0) - 4,
  --     },
  --     settings = {
  --       save_on_toggle = true,
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>H",
  --       function()
  --         require("harpoon"):list():add()
  --       end,
  --       desc = "Harpoon file",
  --     },
  --     {
  --       "<leader><leader>",
  --       function()
  --         local harpoon = require "harpoon"
  --         harpoon.ui:toggle_quick_menu(harpoon:list())
  --       end,
  --       desc = "Harpoon quick menu",
  --     },
  --     {
  --       "<leader>h1",
  --       function()
  --         require("harpoon"):list():select(1)
  --       end,
  --       desc = "Harpoon to file 1",
  --     },
  --     {
  --       "<leader>h2",
  --       function()
  --         require("harpoon"):list():select(2)
  --       end,
  --       desc = "Harpoon to file 2",
  --     },
  --     {
  --       "<leader>h3",
  --       function()
  --         require("harpoon"):list():select(3)
  --       end,
  --       desc = "Harpoon to file 3",
  --     },
  --     {
  --       "<leader>h4",
  --       function()
  --         require("harpoon"):list():select(4)
  --       end,
  --       desc = "Harpoon to file 4",
  --     },
  --   },
  -- },

  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require "nvim-tmux-navigation"
      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    end,
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false,
  },
  {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    config = true,
  },

  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sR",
        function()
          local grug = require "grug-far"
          local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
          grug.open {
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          }
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
}
