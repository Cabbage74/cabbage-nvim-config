return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        latex = {
            enabled = true,
            converter = "latex2text",
            highlight = "RenderMarkdownMath",
            top_pad = 0,
            bottom_pad = 0,
        },
        anti_conceal = {
            enabled = true,
        },
    },
    config = function(_, opts)
        require('render-markdown').setup(opts)
        vim.keymap.set('n', '<leader>om', require('render-markdown').toggle, { desc = 'render markdown' })
    end,
}
