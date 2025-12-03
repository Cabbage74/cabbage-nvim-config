return { 
    "ellisonleao/gruvbox.nvim", 
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            italic = {
                strings = false,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
        })
        vim.cmd("colorscheme gruvbox")
        
        vim.api.nvim_set_hl(0, "TermCursor", { fg = "#fe8019", bg = "#fe8019" })
        vim.api.nvim_set_hl(0, "Cursor", { fg = "#fe8019", bg = "#fe8019" })
        vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor"
    end,
}
