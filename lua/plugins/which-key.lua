return {
    "folke/which-key.nvim",
    opts = {
        win = {
            -- don't allow the popup to overlap with the cursor
            no_overlap = false,
            -- width = 1,
            -- height = { min = 4, max = 25 },
            -- col = 0,
            -- row = math.huge,
            border = "single",
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            title = false,
            zindex = 1000,
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
    },
}
