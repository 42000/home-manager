local oilc = require("oil")
oilc.setup({
              default_file_explorer = true,
        columns = {
            -- "permissions",
            -- "mtime",
            -- "size",
            "icon",
        },
        win_options = {
            wrap = false,
            signcolumn = "yes",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        keymaps = {
            ["<C-q>"] = {"actions.send_to_qflist", opts = {}},
        },
})

local function v_open()
    oilc.open(nil,{
        preview = {vertical = true},
    })
end
vim.keymap.set('n', '<leader><S-e>',v_open, {desc='oil split', silent=true})
vim.keymap.set('n', '<leader>e',function () oilc.open() end, {desc='oil', silent=true})
