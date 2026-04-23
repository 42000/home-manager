local options = {
    termguicolors = true, -- couleur du terminal

    -- NUMEROS DE LIGNE
    ruler = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    backspace = '2',
    showcmd = true,
    laststatus = 2,
    autowrite = true,
    cursorline = true,
    autoread = true,
    winborder = "single",

    -- TABS
    tabstop = 4, -- taille des indents
    shiftwidth = 4,
    shiftround = true,
    expandtab = true, -- convert tab -> spaces
    autoindent = true,
    smartindent = true,
    -- vim.o.showtabline = 2
    -- sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

    -- SEARCH
    incsearch = true,
    ignorecase = true, -- ignorer les majuscule lors d'une recherche
    smartcase = true,
    -- clipboard = unnamedplus
    cmdheight = 1,
    spelllang = 'fr',
    virtualedit = "block",

    conceallevel = 3,

    -- retirer le timeout des commandes, on verra si ca pete
    -- c'est pour les raccourcis de iQ -> i" et aQ -> a"
    -- peut-être qu'il faut plutôt augmenter le timeoutlen jsp
    timeout = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Line numbers etc in Netrw
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])
