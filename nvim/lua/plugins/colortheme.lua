local M = {}

M.transparent = false -- Track the state of the background

local function apply_catppuccin()
    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = M.transparent,
    })
    vim.cmd.colorscheme("catppuccin")
end

M.toggle_transparency = function()
    M.transparent = not M.transparent -- Toggle the state
    apply_catppuccin() -- Reapply the configuration
end

return {
    {
        "catppuccin/nvim",
        priority = 1001,
        config = function()
            apply_catppuccin() -- Initial setup
            -- Bind the toggle function to <leader>bg
            vim.keymap.set("n", "<leader>bg", M.toggle_transparency, { noremap = true, silent = true, desc = "Toggle Transparent Background" })
        end,
    },
    {
        "akinsho/bufferline.nvim",
        after = "catppuccin",
        config = function()
            local mocha = require("catppuccin.palettes").get_palette "mocha"
            require("bufferline").setup({
                highlights = require("catppuccin.groups.integrations.bufferline").get({
                    styles = { "italic", "bold" },
                    custom = {
                        all = {
                            fill = { bg = "#000000" },
                        },
                        mocha = {
                            background = { fg = mocha.text },
                        },
                        latte = {
                            background = { fg = "#000000" },
                        },
                    },
                }),
            })
        end,
    },
}

