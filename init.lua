-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Registers copilot-chat filetype for markdown rendering
require("render-markdown").setup({
    file_types = { "markdown", "copilot-chat" },
})
