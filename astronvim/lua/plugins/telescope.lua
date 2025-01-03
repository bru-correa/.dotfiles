return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },
  config = function(plugin, opts)
    require "astronvim.plugins.configs.telescope"(plugin, opts)
    require("telescope").load_extension "fzf"
  end,
}
