-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add more treesitter parsers
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      {
        "<leader>cn",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Annotations (Neogen)",
      },
    },
    opts = function(_, opts)
      if opts.snippet_engine ~= nil then
        return
      end

      local map = {
        ["LuaSnip"] = "luasnip",
        ["nvim-snippy"] = "snippy",
        ["vim-vsnip"] = "vsnip",
      }

      for plugin, engine in pairs(map) do
        if LazyVim.has(plugin) then
          opts.snippet_engine = engine
          return
        end
      end

      if vim.snippet then
        opts.snippet_engine = "nvim"
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  {
    "ChristianChiarulli/swenv.nvim",
    keys = {
      {
        "<leader>cp",
        "<cmd>lua require('swenv.api').pick_venv()<cr>",
        desc = "Choose Py Env",
      },
    },
  },

  {
    "hedyhli/outline.nvim",
    keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
    cmd = "Outline",
    opts = function()
      local defaults = require("outline.config").defaults
      local opts = {
        symbols = {
          icons = {},
          filter = vim.deepcopy(LazyVim.config.kind_filter),
        },
        keymaps = {
          up_and_jump = "<up>",
          down_and_jump = "<down>",
        },
      }

      for kind, symbol in pairs(defaults.symbols.icons) do
        opts.symbols.icons[kind] = {
          icon = LazyVim.config.icons.kinds[kind] or symbol.icon,
          hl = symbol.hl,
        }
      end
      return opts
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("projects")
      end)
    end,
  },

  {
    "echasnovski/mini.map",
    opts = function()
      local map = require("mini.map")
      return {
        symbols = {
          encode = require("mini.map").gen_encode_symbols.dot("4x2"),
        },
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.gitsigns(),
          map.gen_integration.diagnostic(),
        },
        window = {
          show_integration_count = false,
        },
      }
    end,
    keys = {
      { "<leader>mm", "<Cmd>lua MiniMap.toggle()<CR>", desc = "MiniMap" },
      { "<leader>mf", "<Cmd>lua MiniMap.toggle_focus()<CR>", desc = "MiniMap" },
      { "<leader>ms", "<Cmd>lua MiniMap.toggle_side()<CR>", desc = "MiniMap" },
    },
  },

  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim", -- For standard functions
      "MunifTanjim/nui.nvim", -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    remote = {
      app_name = "nvim", -- This directly maps to the value NVIM_APPNAME. If you use any other paths for configuration, also make sure to set this.
      -- List of directories that should be copied over
      copy_dirs = {
        -- What to copy to remote's Neovim config directory
        config = {
          base = vim.fn.stdpath("config"), -- Path from where data has to be copied
          dirs = "*", -- Directories that should be copied over. "*" means all directories. To specify a subset, use a list like {"lazy", "mason"} where "lazy", "mason" are subdirectories
          -- under path specified in `base`.
          compression = {
            enabled = false, -- Should compression be enabled or not
            additional_opts = {}, -- Any additional options that should be used for compression. Any argument that is passed to `tar` (for compression) can be passed here as separate elements.
          },
        },
        -- What to copy to remote's Neovim data directory
        data = {
          base = vim.fn.stdpath("data"),
          dirs = {},
          compression = {
            enabled = true,
          },
        },
        -- What to copy to remote's Neovim cache directory
        cache = {
          base = vim.fn.stdpath("cache"),
          dirs = {},
          compression = {
            enabled = true,
          },
        },
        -- What to copy to remote's Neovim state directory
        state = {
          base = vim.fn.stdpath("state"),
          dirs = {},
          compression = {
            enabled = true,
          },
        },
      },
    },
    config = true,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
      },
    },
    -- mason-nvim-dap is loaded when nvim-dap loads
    config = function() end,
  },
  { "linux-cultist/venv-selector.nvim", enabled = false },
}
