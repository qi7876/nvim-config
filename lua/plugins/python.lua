return {
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
}
