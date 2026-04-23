local on_attach = function(_,_)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {desc = 'lsp rename'})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = 'code action'})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'definition'})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {desc = 'implementations'})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

    local ensured_lsp = {
        "lua_ls",
        -- "texlab",
        "tinymist",
        -- "typst",
        "clangd",
        -- "pyright",
        -- "vhdl_ls",
    }
    local lcfg = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    lcfg.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
