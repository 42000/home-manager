require("snacks").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	bigfile = { enabled = false },
	dashboard = { enabled = false },
	explorer = { enabled = false },
	indent = { enabled = false },
	input = { enabled = false },
	picker = {
	    enabled = true,
	    win = {
		input  = {
		    keys = {
			["<Esc>"] = { "close", mode = { "n", "i" } },
			["<C-[>"] = { "close", mode = { "n", "i" } },
		    }
		}
	    },
	},
	notifier = { enabled = false },
	quickfile = { enabled = false },
	scope = { enabled = false },
	scroll = { enabled = false },
	statuscolumn = { enabled = false },
	terminal = { enabled = false },
	words = { enabled = false },
})
vim.keymap.set('n', '<Tab>', "", {noremap=true, desc="Snacks Picker"})
vim.keymap.set('n', '<Tab>f', function() Snacks.picker.files() end, {desc="Files"})
vim.keymap.set('n', '<Tab>o', function() Snacks.picker.recent() end, {desc="Old files"})
vim.keymap.set('n', '<Tab>e', function() Snacks.picker.buffers() end, {desc="Buffers"})
vim.keymap.set('n', '<Tab><Tab>', function() Snacks.picker() end, {desc="pickers"})
