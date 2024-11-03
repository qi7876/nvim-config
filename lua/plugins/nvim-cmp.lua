return {
    "nvim-cmp",
    opts = {
        window = {
            completion = require("cmp").config.window.bordered(),
            documentation = require("cmp").config.window.bordered(),
        },
        experimental = {
            ghost_text = false, -- this feature conflict with copilot.vim's preview.
        },
    },
}
