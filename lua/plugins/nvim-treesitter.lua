return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
        branch = "master",
        ensure_installed = { "lua", "toml", "rust", "cpp" },
        highlight = { enable = true },
    },
    config = function (_, opts)
        require("nvim-treesitter").setup({opts})
    end
}
