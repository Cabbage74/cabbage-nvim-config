return {
    "smoka7/hop.nvim",
    config = function()
        require("hop").setup({
            hint_position = require("hop.hint").HintPosition.END
        })
    end,
    keys = {
        { "<leader>hw", ":HopWord<CR>", silent = true, desc = "hop word" }
    }
}
