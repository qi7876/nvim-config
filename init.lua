-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("dap-python").setup("python")
-- If using the above, then `python -m debugpy --version`
-- must work in the shell
