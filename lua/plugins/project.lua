return {
  "ahmedkhalf/project.nvim",
  config = function(_, opts)
    require("project_nvim").setup(opts)
    LazyVim.on_load("telescope.nvim", function()
      require("telescope").load_extension("projects")
    end)
  end,
}
