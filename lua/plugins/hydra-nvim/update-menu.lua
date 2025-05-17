local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd

local hint = [[
 ^  󰒲  ^ Update _l_azy       ^
 ^  󰭠  ^ Update _m_ason      ^
 ^  󰐅  ^ Update _t_reesitter ^
]]

local update_menu = Hydra({
    name = "Update Menu",
    hint = hint,
    config = {
        invoke_on_body = true,
        hint = {
            offset = -1,
            float_opts = {
                border = "rounded",
            },
        },
    },
    mode = "n",
    body = "u",
    heads = {
        {
            "l",
            function()
                require("lazy").sync()
            end,
            { exit = true, desc = "Update Plugins" },
        },
        {
            "m",
            cmd("MasonUpdateAll"),
            { exit = true, desc = "Update Mason tools" },
        },
        {
            "t",
            cmd("TSUpdate"),
            { exit = true, desc = "Update Treesitter" },
        },
        {
            "<Esc>",
            nil,
            { exit = true, desc = false },
        },
    },
})

return update_menu
