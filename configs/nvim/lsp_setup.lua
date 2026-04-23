-- TROP LE BORDEL MANUELLEMENT
ENSURED_LSP = {
    "lua_ls",
    "texlab",
    -- "clangd",
    -- "pyright",
    -- "vhdl_ls",
}


vim.lsp.enable(ENSURED_LSP)
vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities()
})

-- OMNICOMPLETE (NATIVE) => un peu à chier
-- Mieux vaut utiliser blink, beaucoup plus fourni
-- sauf que blink nique des trucs gnr les digraph, ça me saoule
-- je suis une pute stupide, il fallait juste enlever C-k dans la config
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if client:supports_method('textDocument/completion') then
--             vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--         end
--     end,
-- })

-- diagnostics c'est les msgs d'erreurs
vim.diagnostic.config({ virtual_text = true })

-- FZF-LUA :
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'lsp definition'})
-- vim.keymap.set('n', 'gra', ":FzfLua lsp_code_actions<CR>", {desc = 'code action'})
-- vim.keymap.set('n', 'gri', ":FzfLua lsp_implementations<CR>", {desc = 'implementations'})
-- vim.keymap.set('n', 'grr', ":FzfLua lsp_references<CR>", {desc = 'references'})
vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {desc = 'lsp rename'})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

-- DEFAULT :
-- vim.keymap.set('n', 'grd', vim.lsp.buf.definition, {desc = 'definition'})
-- vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, {desc = 'code action'})
-- vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, {desc = 'implementations'})
-- vim.keymap.set('n', 'grr', vim.lsp.buf.references, {desc = 'references'})
-- vim.keymap.set('n', 'grn', vim.lsp.buf.rename, {desc = 'rename'})

--[[
-- COPIÉ D'INTERNET
vim.o.complete = ".,o" -- use buffer and omnifunc
vim.o.completeopt = "fuzzy,menuone,noselect" -- add 'popup' for docs (sometimes)
vim.o.autocomplete = true
vim.o.pumheight = 7

-- vim.lsp.enable({ "mylangservers" })
--
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
      -- Optional formating of items
      convert = function(item)
        -- Remove leading misc chars for abbr name,
        -- and cap field to 25 chars
        --local abbr = item.label
        --abbr = abbr:match("[%w_.]+.*") or abbr
        --abbr = #abbr > 25 and abbr:sub(1, 24) .. "…" or abbr
        --
        -- Remove return value
        --local menu = ""

        -- Only show abbr name, remove leading misc chars (bullets etc.),
        -- and cap field to 15 chars
        local abbr = item.label
        abbr = abbr:gsub("%b()", ""):gsub("%b{}", "")
        abbr = abbr:match("[%w_.]+.*") or abbr
        abbr = #abbr > 15 and abbr:sub(1, 14) .. "…" or abbr

        -- Cap return value field to 15 chars
        local menu = item.detail or ""
        menu = #menu > 15 and menu:sub(1, 14) .. "…" or menu

        return { abbr = abbr, menu = menu }
      end,
    })
  end,
})
]]
-- vim.lsp.config('*', {
--     capabilities = require('blink.cmp').get_lsp_capabilities()
-- })
