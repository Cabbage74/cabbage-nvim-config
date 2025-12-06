return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = {
        { "<leader>ot", "<cmd>ToggleTerm<cr>", desc = "toggle terminal" },
    },
    opts = {
        direction = "float",
        start_in_insert = true,
        persist_mode = false,
    },
}
