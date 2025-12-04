return {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
        require("project_nvim").setup({
            manual_mode = false,
            patterns = { ".git", "Cargo.toml", "CMakeLists.txt", "Makefile" },
            exclude_dirs = { "node_modules", "target" },
        })
    end,
}
