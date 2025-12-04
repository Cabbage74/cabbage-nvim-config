if vim.fn.has("nvim-0.10") == 1 then
    vim.lsp.buf_get_clients = function(bufnr)
        return vim.lsp.get_clients({ bufnr = bufnr })
    end
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        actions = {
            open_file = {
                quit_on_open = true
            }
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
    },
    config = function (_, opts)
        require("nvim-tree").setup(opts)
    end,
    keys = {
        { "<leader>op", ":NvimTreeFindFileToggle<CR>", desc = "open nvim tree" }
    }
}
