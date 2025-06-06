-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.expandtab = true
vim.opt.relativenumber = false
vim.opt.pumblend = 0
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.termguicolors = true
vim.g.autoformat = true
vim.g.snacks_animate = false

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
