return {
    "nvimdev/lspsaga.nvim",
    cmd = "Lspsaga",
    opts = {
        definition = {
            edit = "<CR>",
            quit = "q",
            close_on_float_click = true,
        },
        finder = {
            keys = {
                toggle_or_open = "<CR>",
                quit = "q",
            },
        },
    },
    keys = {
        { "<leader>lr", ":Lspsaga rename<CR>", desc = "lsp rename" },
        { "<leader>lc", ":Lspsaga code_action<CR>", desc = "lsp code action" },
        { "<leader>lh", ":Lspsaga hover_doc<CR>", desc = "lsp hover doc" },
        { "gd", ":Lspsaga goto_definition<CR>", desc = "goto definition" },
        { "gi", ":Lspsaga finder<CR>", desc = "goto implementation/references" },
    }
}
