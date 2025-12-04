return {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>cc", "<cmd>Alpha<cr>", desc = "go home" },
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local logo = {
            [[                                               ]],
            [[    ______      __    __                       ]],
            [[   / ____/___ _/ /_  / /_  ____ _____ ____     ]],
            [[  / /   / __ `/ __ \/ __ \/ __ `/ __ `/ _ \    ]],
            [[ / /___/ /_/ / /_/ / /_/ / /_/ / /_/ /  __/    ]],
            [[ \____/\__,_/_.___/_.___/\__,_/\__, /\___/     ]],
            [[                              /____/           ]],
            [[                                               ]],
        }

        dashboard.section.header.val = logo
        dashboard.section.header.opts.hl = "String"

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find File", function()
                require("telescope").extensions.file_browser.file_browser({
                    path = "%:p:h",
                    select_buffer = true,
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    initial_mode = "insert",
                })
            end),
            dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("u", "  Update Plugins", ":Lazy sync<CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }
        local function make_padding()
            local header_height = #logo
            local button_height = #dashboard.section.buttons.val * 2
            local footer_height = 2
            local content_height = header_height + button_height + footer_height
            local win_height = vim.api.nvim_win_get_height(0)
            local padding = math.floor((win_height - content_height) / 2)
            return math.max(2, padding)
        end

        dashboard.section.footer.val = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        end
        dashboard.section.footer.opts.hl = "Comment"

        dashboard.config.layout = {
            { type = "padding", val = make_padding },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }

        alpha.setup(dashboard.config)
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                vim.opt.cmdheight = 0
                vim.opt.laststatus = 0
                vim.opt.showtabline = 0
            end,
        })
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.cmdheight = 1
                vim.opt.laststatus = 3
                vim.opt.showtabline = 2
            end,
        })
    end,
}
