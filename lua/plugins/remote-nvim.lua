return {
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
}
