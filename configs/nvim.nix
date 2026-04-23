{ pkgs, ... }:
{
  programs.neovim = 
    # This just enables Nixvim.
    # If all you have is this, then there will be little visible difference
    # when compared to just installing NeoVim.
    let
        toLua = str: "lua << EOF\n${str}\nEOF\n";
        toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    #extraConfig = builtins.readFile ./nvim/init.lua;
    # initLua = builtins.readFile ./nvim/init.lua;
    plugins = with pkgs.vimPlugins; [
        comment-nvim
        {
            plugin = nvim-surround;
            config = ''
require("nvim-surround").setup({
    aliases = { ["q"] = "'", ["Q"] = '"', },
})
            '';
        }
        {
            plugin = snacks-nvim;
            config = builtins.readFile ./nvim/snacks.lua;
        }
        {
            plugin = oil-nvim;
            config = builtins.readFile ./nvim/oil.lua;
        }
        {
            plugin = blink-cmp;
            config = builtins.readFile ./nvim/blink.lua;
        }
        {
            plugin = nvim-treesitter;
            config = builtins.readFile ./nvim/treesitter.lua;
        }
        typst-preview-nvim
        indent-blankline-nvim
        which-key-nvim
        nvim-lspconfig
        # (nvim-treesitter.withPlugins (p: [
        #     p.tree-sitter-nix
        #     p.tree-sitter-vim
        #     p.tree-sitter-bash
        #     p.tree-sitter-lua
        #     p.tree-sitter-typst
        #     ]))
        gruvbox-nvim
        onedark-nvim
    ];
    initLua = ''
        -- la config en lua
        ${builtins.readFile ./nvim/keymaps.lua}
        ${builtins.readFile ./nvim/options.lua}
        ${builtins.readFile ./nvim/autocommands.lua}
        ${builtins.readFile ./nvim/lsp.lua}
        vim.cmd("colorscheme gruvbox")
    '';
  };
    home.packages = with pkgs; [
        tinymist
        lua-language-server
        nixd
        tree-sitter
    ];
}
