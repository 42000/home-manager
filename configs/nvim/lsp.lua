-- TROP LE BORDEL MANUELLEMENT
ENSURED_LSP = {
    'lua_ls',
    -- "texlab",
    'tinymist',
    'nixd',
    -- "typst",
    -- "clangd",
    -- "pyright",
    -- "vhdl_ls",
}


vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities()
})
-- for k in ENSURED_LSP do
-- local cfg = vim.lsp.config.(k)
--     vim.lsp.config(k, cfg)
--     vim.lsp.config(k, {
--     capabilities = require('blink.cmp').get_lsp_capabilities()
-- })
-- end
vim.lsp.enable(ENSURED_LSP)

-- diagnostics c'est les msgs d'erreurs
vim.diagnostic.config({ virtual_text = true })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'lsp definition'})
vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {desc = 'lsp rename'})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
