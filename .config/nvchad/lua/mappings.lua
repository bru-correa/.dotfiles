-- The following line is commented to unmap default nvchad mappings
-- require "nvchad.mappings"

local map = vim.keymap.set

-- Quick ESC
map("i", "jk", "<ESC>")

-- Save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { silent = true })
map({ "n", "i", "v" }, "<leader>w", "<cmd> w <cr>", { desc = "Save", silent = true })

-- Move Selection
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")

-- BUFFERS
local tabufline = require "nvchad.tabufline"
map("n", "<S-l>", tabufline.next, { desc = "Next Buffer", silent = true })
map("n", "<S-h>", tabufline.prev, { desc = "Prev Buffer", silent = true })
map("n", "<leader>c", tabufline.close_buffer, { desc = "Close Buffer", silent = true })

local function closeOtherBuffers()
  tabufline.closeAllBufs(false)
end
map("n", "<leader>bc", closeOtherBuffers, { desc = "Close Other Buffers", silent = true })

local function closeRightBuffers()
  tabufline.closeBufs_at_direction "right"
end
map("n", "<leader>bl", closeRightBuffers, { desc = "Close Right Buffers", silent = true })

local function closeLeftBuffers()
  tabufline.closeBufs_at_direction "left"
end
map("n", "<leader>bh", closeLeftBuffers, { desc = "Close Left Buffers", silent = true })

-- Clear search with <ESC>
map({ "i", "n" }, "<ESC>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch", silent = true })

-- Center scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit", silent = true })
map("n", "<leader>Q", ":q!<CR>", { desc = "Force Quit", silent = true })

-- LSP
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
map("n", "<leader>lk", vim.diagnostic.goto_prev, { desc = "Lsp prev diagnostic" })
map("n", "<leader>lj", vim.diagnostic.goto_next, { desc = "Lsp next diagnostic" })
map("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "Lsp diagnostic loclist" })

-- Toggle explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = " Explorer", silent = true })

-- Telescope
local builtin = require "telescope.builtin"
map("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Search Keymaps" })
map("n", "<leader>ff", builtin.find_files, { desc = "Search Files" })
map("n", "<leader>fs", builtin.builtin, { desc = "Search Select Telescope" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Search Current Word" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Search by Grep" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics" })
map("n", "<leader>fr", builtin.resume, { desc = "Search Resume" })
map("n", "<leader>f.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
map("n", "<leader>fc", "<cmd>Telescope themes<CR>", { desc = "Search Colorschemes" })
