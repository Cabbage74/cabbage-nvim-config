vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        if vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
             vim.cmd("silent! update")
        end
    end,
})
