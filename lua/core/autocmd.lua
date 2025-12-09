vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        if vim.fn.expand("%") ~= "" and vim.bo.buftype == "" and vim.bo.modified then
            vim.schedule(function()
                vim.cmd("silent! write")
            end)
        end
    end,
})
