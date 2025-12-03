return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && "
                .. "cmake --build build --config Release && "
                .. "cmake --install build --prefix build",
        },
        "nvim-telescope/telescope-file-browser.nvim",
    },
    cmd = "Telescope",
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                file_browser = {
                    mappings = {
                        ["i"] = {
                            ["<Tab>"] = actions.select_default,
                        },
                        ["n"] = {
                            ["<Tab>"] = actions.select_default,
                        },
                    },
                },
            },
        })
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
    keys = {
        {
            "<leader>of",
            function()
                require("telescope").extensions.file_browser.file_browser({
                    path = "%:p:h",
                    select_buffer = true,
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    initial_mode = "insert",
                })
            end,
            desc = "find file"
        }
    }
}
