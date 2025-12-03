return {
    "mason-org/mason.nvim",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig",
    },
    config = function()
        require("mason").setup({})

        local servers = {
            ["lua-language-server"] = {},
            ["rust-analyzer"] = {},
            ["clangd"] = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            },
        }

        local mason_lspconfig = require("mason-lspconfig")
        local mappings = mason_lspconfig.get_mappings()

        local ensure_list = {}
        for mason_name, _ in pairs(servers) do
            local lsp_name = mappings.package_to_lspconfig[mason_name] or mason_name
            table.insert(ensure_list, lsp_name)
        end

        mason_lspconfig.setup({
            ensure_installed = ensure_list,
        })

        for mason_name, config in pairs(servers) do
            local lsp_name = mappings.package_to_lspconfig[mason_name] or mason_name 
            vim.lsp.config(lsp_name, config)
            vim.lsp.enable(lsp_name)
        end

        vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
        })
    end,
}
