return {
    {
        "zbirenbaum/copilot.lua",
        enable = false,
        -- event = "InsertEnter",
        -- opts = {
        --     suggestion = {
        --         enabled = true,
        --         auto_trigger = true,
        --     },
        -- },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        cmd = "CopilotChat",
        opts = function()
            local user = vim.env.USER or "User"
            user = user:sub(1, 1):upper() .. user:sub(2)
            return {
                model = "claude-3.5-sonnet",
                show_help = false,
                question_header = "  " .. user .. " ",
                answer_header = "  Copilot ",
                window = {
                    width = 0.4,
                },
                selection = function(source)
                    local select = require("CopilotChat.select")
                    return select.visual(source) or select.buffer(source)
                end,
            }
        end,
    },
}
