return {
    "folke/which-key.nvim",
    lazy = false,
    opts = {
        win = {
            -- don't allow the popup to overlap with the cursor
            no_overlap = false,
            -- width = 1,
            -- height = { min = 4, max = 25 },
            -- col = 0,
            -- row = math.huge,
            border = "rounded",
            padding = { 0, 0 }, -- extra window padding [top/bottom, right/left]
            title = false,
            zindex = 1000,
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
        layout = {
            width = { min = 20, max = 30 }, -- min and max width of the columns
            spacing = 1, -- spacing between columns
        },
    },
}
