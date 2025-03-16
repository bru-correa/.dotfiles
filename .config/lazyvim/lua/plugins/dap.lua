return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "microsoft/vscode-js-debug",
      build = "npm i && npm run compile vsDebugServerBundle && rm -rf out && mv -f dist out",
    },
  },
  optional = true,
  opts = function()
    local dap = require("dap")
    if not dap.adapters["pwa-chrome"] then
      dap.adapters["pwa-chrome"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path()
              .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
    end
    for _, lang in ipairs({
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    }) do
      dap.configurations[lang] = dap.configurations[lang] or {}
      table.insert(dap.configurations[lang], {
        name = "Launch & Debug Chrome",
        type = "pwa-chrome",
        request = "launch",
        url = function()
          local co = coroutine.running()
          return coroutine.create(function()
            vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:8080" }, function(url)
              if url == nil or url == "" then
                return
              else
                coroutine.resume(co, url)
              end
            end)
          end)
        end,
        webRoot = vim.fn.getcwd(),
        protocol = "inspector",
        sourceMaps = true,
        userDataDir = false,
        -- resolveSourceMapLocations = {
        --   "${workspaceFolder}/**",
        --   "!**/node_modules/**",
        -- },

        -- rootPath = "${workspaceFolder}",
        -- cwd = "${workspaceFolder}",
        -- console = "integratedTerminal",
        -- internalConsoleOptions = "neverOpen",
        -- sourceMapPathOverrides = {
        --   ["./*"] = "${workspaceFolder}/src/*",
        -- },
      })
    end
  end,
}
