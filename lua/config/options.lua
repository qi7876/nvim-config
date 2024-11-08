-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- use telescope as picker
vim.g.lazyvim_picker = "telescope"
vim.o.expandtab = true
vim.opt.relativenumber = false

-- enable long line warping
vim.opt.wrap = true
vim.opt.pumblend = 0
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- -- use OSC 52 clipboard
-- vim.opt.clipboard = ""
--
-- vim.g.clipboard = {
--     name = "OSC 52",
--     copy = {
--         ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--         ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--     },
--     paste = {
--         ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--         ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--     },
-- }

local function paste()
    return function()
        local content = vim.fn.getreg('"')
        return vim.split(content, "\n")
    end
end

if os.getenv("SSH_TTY") == nil then
    -- local env
    vim.opt.clipboard = "unnamedplus"
else
    -- remote env
    vim.opt.clipboard = "unnamedplus"
    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
            ["+"] = paste(),
            ["*"] = paste(),
        },
    }
end
