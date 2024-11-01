return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[
                               __ _._.,._.__
                         .o8888888888888888P'
                       .d88888888888888888K
         ,8            888888888888888888888boo._
        :88b           888888888888888888888888888b.
         `Y8b          88888888888888888888888888888b.
           `Yb.       d8888888888888888888888888888888b
             `Yb.___.88888888888888888888888888888888888b
               `Y888888888888888888888888888888CG88888P"'
                 `88888888888888888888888888888MM88P"'
"Y888K    "Y8P""Y888888888888888888888888oo._""""
  88888b    8    8888`Y88888888888888888888888oo.
  8"Y8888b  8    8888  ,8888888888888888888888888o,
  8  "Y8888b8    8888""Y8`Y8888888888888888888888b.
  8    "Y8888    8888   Y  `Y8888888888888888888888
  8      "Y88    8888     .d `Y88888888888888888888b
.d8b.      "8  .d8888b..d88P   `Y88888888888888888888
                                 `Y88888888888888888b.
                  "Y888P""Y8b. "Y888888888888888888888
                    888    888   Y888`Y888888888888888
                    888   d88P    Y88b `Y8888888888888
                    888"Y88K"      Y88b dPY8888888888P
                    888  Y88b       Y88dP  `Y88888888b
                    888   Y88b       Y8P     `Y8888888
                  .d888b.  Y88b.      Y        `Y88888
                                                 `Y88K
                                                   `Y8
                                                     '
                          QI                          ]]

        dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("r", " " .. "> Recent files",    LazyVim.pick("oldfiles")),
      dashboard.button("p", " " .. "> Projects",        [[<cmd> Telescope projects <cr>]]),
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
        dashboard.opts.layout[1].val = 1
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
