return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[Qi's Vi]]

        dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
    dashboard.section.buttons.val = {
        dashboard.button("f", " " .. "> Find file",       LazyVim.pick()),
        dashboard.button("n", " " .. "> New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
        dashboard.button("r", " " .. "> Recent files",    LazyVim.pick("oldfiles")),
        dashboard.button("g", " " .. "> Find text",       LazyVim.pick("live_grep")),
        dashboard.button("c", " " .. "> Config",          LazyVim.pick.config_files()),
        dashboard.button("s", " " .. "> Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("q", " " .. "> Quit",            "<cmd> qa <cr>"),
    }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "Text"
            button.opts.hl_shortcut = "Text"
        end
        dashboard.section.header.opts.hl = "Error"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.opts.layout[1].val = 10
        return dashboard
    end,
    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        require("alpha").setup(dashboard.opts)
    end,
}
