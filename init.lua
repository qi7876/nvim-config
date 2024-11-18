-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMonoNL NFM:h15"
    vim.g.neovide_hide_mouse_when_typing = true
end
