vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- netrw
-- vim.keymap.set({'n','v'}, '<leader>e', ':Explore<CR>', {desc='netrw', silent=true})

-- tabs
vim.keymap.set({'n','v'}, '<leader>t', ':tabnew<CR>', {desc='new tab', silent=true})

vim.keymap.set({'n', 'v'}, '<leader>?', ':noh<CR>', {silent=true})
vim.keymap.set({'n', 'v'}, '<leader>/', ':noh<CR>', {silent=true})

-- vim.keymap.set({'n', 'v'}, '<C-j>', '<C-d>', {silent=true})
-- vim.keymap.set({'n', 'v'}, '<C-k>', '<C-u>', {silent=true})

-- INSIDE/AROUND QUOTE
vim.keymap.set({'x','o'}, 'iQ', 'i"', {noremap=true, desc="inner \""})
vim.keymap.set({'x','o'}, 'iq', "i'", {noremap=true, desc="inner '"})
vim.keymap.set({'x','o'}, 'ia', "i<", {noremap=true, desc="inner <>"})
vim.keymap.set({'x','o'}, 'ir', "i[", {noremap=true, desc="inner []"})
vim.keymap.set({'x','o'}, 'aQ', 'a"', {noremap=true, desc="around \""})
vim.keymap.set({'x','o'}, 'aq', "a'", {noremap=true, desc="around '"})
vim.keymap.set({'x','o'}, 'aa', "a<", {noremap=true, desc="around <>"})
vim.keymap.set({'x','o'}, 'ar', "a[", {noremap=true, desc="around []"})

-- COPY/PASTE
vim.keymap.set('v', '<leader>c', '"+y<Esc>', {desc= "copy clipboard", silent=true})
vim.keymap.set({'v','n'}, '<C-S-c>', '"+y', {desc= "copy clipboard + motion", silent=true})
vim.keymap.set('i', '<S-Insert>', '<Esc>"+pi', {silent=true})

-- SPELL
vim.keymap.set('n', '<leader>s','', {silent=true, desc='spell'})
vim.keymap.set('n', '<leader>ss',':set spell!<CR>',{silent=true, desc='toggle'})
vim.keymap.set('n', '<leader>sf',':set spelllang=fr<CR>',{silent=true, desc='fr'})
vim.keymap.set('n', '<leader>se',':set spelllang=en<CR>',{silent=true, desc='en'})

-- BufNext/Prev
vim.keymap.set('n', '<C-n>',':bNext<CR>', {silent=true, desc='buffer next'})
vim.keymap.set('n', '<C-p>',':bprevious<CR>', {silent=true, desc='buffer prev'})
vim.keymap.set('n', '<BS>', '<C-^>', {desc='buf Switch', silent=true})

local function lightswitch()
    if vim.o.background == 'dark' then
        vim.o.background = 'light'
    else
        vim.o.background = 'dark'
    end
end

vim.keymap.set({"n", "v"}, "<F5>", lightswitch)
vim.keymap.set({'n','c','i','v'}, "<F2>", '<cmd>set rnu!<CR>')

local cpath = vim.fn.stdpath("config")
vim.keymap.set("n","<leader>c", "", {desc = "config"})
vim.keymap.set("n","<leader>cd", ":cd" .. cpath .. "<CR>", {desc = "config directory"})
vim.keymap.set("n","<leader>ci", ":e" .. cpath .. "/init.lua<CR>", {desc = "init.lua"})
vim.keymap.set("n","<leader>cc", ":cd %:h<CR>", {desc = "set to current"})

vim.keymap.set("n","<leader>f",function () vim.diagnostic.open_float() end, {desc = "Diagnostic"})
vim.keymap.set("n","<C-c>","`", {desc = "marks", remap = true})

-- MARKDOWN
vim.keymap.set({"n", "v"}, "<leader>m", "<NOP>", {desc = "markdown"})
vim.keymap.set({"n", "v"}, "<leader>mw", "<cmd>e ~/Notes/index.md<CR>", {desc = "ouvrir notes"})
