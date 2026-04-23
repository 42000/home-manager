-- 'nvim-treesitter/nvim-treesitter',
-- build = ':TSUpdate',
-- event = "BufReadPre",
-- requires = {'nvim-treesitter/nvim-treesitter-refactor'},
require 'nvim-treesitter.install'.compilers = { 'gcc' }
require 'nvim-treesitter.config'.setup({
    ensure_installed = { "regex", "yaml", "c", "markdown", "markdown_inline", "bash", "lua", "vim", },
    autoinstall = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false, },
    indent = {enable = true},
    -- vim.api.nvim_create_autocmd('BufReadPost, FileReadPost', {pattern="*", command = "normal zR"})
})
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
