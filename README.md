# My Neovim Configuration

## Quick start

    
- Ensure you have neovim installed on your machine
    - [Neovim instalation guide](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- Ensure you have git installed on your machine 
    - [Git instalation guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Run the following set of commands in your terminal
    - if you want to preserve your current config make sure to rename your "nvim" directory before running
```zsh
cd ~/.config
rm -rf nvim
git clone https://github.com/jasonboyett/nvim-config nvim
```

## Key features

### [Lazy package manager](https://github.com/folke/lazy.nvim)

I chose to use the Lazy package manager for this config. As of the time of writing it is the most popular
package manager for modern Neovim configureations. Aside from that I belive the patterns it allows you to use 
for setting up plugin configureations to be more intuetive and easy to manage than other package managers.

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)


Telescope is an incredibly useful fuzzy finding plugin that allows you to quickly and easily navigate
your code base.

### [Tree Sitter](https://github.com/nvim-treesitter/nvim-treesitter)

Tree sitter creates text objects in your neovim buffers that allow for enhanced syntax hilighting and motions.

### [LSP completions and snippets](https://github.com/hrsh7th/nvim-cmp)

Neovim has a built in LSP client. This plugin allows that client to provide code completions and
snippets around common patterns.

### [Mason](https://github.com/williamboman/mason.nvim)

Mason is a package manager for formatters, debuggers, linters, and LSPs in many different programing and
markup languages.


### [Copilot Lua](https://github.com/zbirenbaum/copilot.lua)

Copilot is one of the best tools for developer productivity in the modern programing world, second only to LSP.
The problem with the standard copilot interface for neovim is that it is hard to configure and intigrate in a Lua
config. That's where this plugin comes in handy.

### [Noice UI](https://github.com/folke/noice.nvim)

Noice is a highly experimental UI for neovim. I personally find if offers some nice quality of life features for
the editing experience.

### [Fugetive git manager](https://github.com/tpope/vim-fugitive)

Fugetive makes working with git inside of neovim a breeze.
