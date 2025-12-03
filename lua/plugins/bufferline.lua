return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local indicator = " "
                for level, number in pairs(diagnostics_dict) do
                    local symbol
                    if level == "error" then
                        symbol = " "
                    elseif level == "warning" then
                        symbol = " "
                    else
                        symbol = " "
                    end
                    indicator = indicator .. number .. symbol
                end
                return indicator
            end
        }
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
    end,
    keys = {
        { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true, desc = "prev buffer" },
        { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true, desc = "next buffer" },
        { "<leader>bd", ":bdelete!<CR>", silent = true, desc = "delete buffer" },
        { "<leader>bp", ":BufferLinePick<CR>", silent = true, desc = "pick buffer" },
    },
    lazy = false,
}

