# Carbon.nvim

<p align="center">
  <img src="/art/welcome.png" alt="Welcome to Carbon" />
</p>

A modern Lua-based Neovim colorscheme based on the [Carbon](https://plugins.jetbrains.com/plugin/12280-carbon) theme for IntelliJ IDEs by [Luis Fernando Jiménez](https://github.com/luisfer0793).

This is a rewrite of [michaeldyrynda/carbon.vim](https://github.com/michaeldyrynda/carbon.vim) with full Lua implementation, Treesitter support, and extensive plugin integrations.

## Features

- Modern Lua-based implementation for Neovim
- Treesitter support
- LSP semantic highlighting
- Plugin integrations (Telescope, NvimTree, Neo-tree, WhichKey, Cmp, and more)
- Lualine theme included
- Ghostty terminal theme included
- Customizable colors and highlight groups
- Terminal colors support

## Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled

## Installation

### Using lazy.nvim (recommended)

```lua
{
  "akthe-at/carbon.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("carbon").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
    })
    vim.cmd.colorscheme("carbon")
  end,
}
```

### Using packer.nvim

```lua
use {
  "akthe-at/carbon.nvim",
  config = function()
    require("carbon").setup()
    vim.cmd.colorscheme("carbon")
  end
}
```

### Using vim-plug

```vim
Plug 'akthe-at/carbon.nvim'
```

Then add to your config:

```lua
require("carbon").setup()
vim.cmd.colorscheme("carbon")
```

### Manual Installation

Clone the repository and add to your runtime path:

```bash
git clone https://github.com/akthe-at/carbon.nvim ~/.local/share/nvim/site/pack/plugins/start/carbon.nvim
```

## Configuration

Carbon comes with sensible defaults, but you can customize it:

```lua
require("carbon").setup({
  transparent = false,      -- Enable transparent background
  terminal_colors = true,   -- Enable terminal colors
  dim_inactive = false,     -- Dim inactive windows

  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
  },

  -- Override colors
  on_colors = function(colors)
    colors.bg = "#1a1a1a"
  end,

  -- Override highlight groups
  on_highlights = function(highlights, colors)
    highlights.Function = { fg = colors.func, bold = true }
  end,
})

vim.cmd.colorscheme("carbon")
```

## Lualine Integration

Carbon includes a lualine theme that matches the colorscheme:

```lua
require("lualine").setup({
  options = {
    theme = "carbon",
  },
})
```

## Ghostty Terminal Theme

Carbon includes theme files for the [Ghostty](https://ghostty.org/) terminal emulator.

### Installation

Copy the theme file to your Ghostty config directory:

```bash
# For dark theme
cp ~/.local/share/nvim/lazy/carbon.nvim/extras/ghostty/carbon ~/.config/ghostty/themes/

# For light theme
cp ~/.local/share/nvim/lazy/carbon.nvim/extras/ghostty/carbon-day ~/.config/ghostty/themes/
```

Then add to your Ghostty config (`~/.config/ghostty/config`):

```
theme = carbon
# or
theme = carbon-day
```

## Plugin Support

Carbon includes highlight groups for popular plugins:

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [Snacks.nvim](https://github.com/folke/snacks.nvim)
- [Neogit](https://github.com/NeogitOrg/neogit)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [WhichKey](https://github.com/folke/which-key.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Flash](https://github.com/folke/flash.nvim)
- [Mini.nvim](https://github.com/echasnovski/mini.nvim)
- And more...

## Screenshots

<p align="center">
  <img src="/screenshots/php.png" alt="PHP Sample" />
  <span>PHP</span>
</p>

<p align="center">
  <img src="/screenshots/blade.png" alt="HTML/Blade Sample" />
  <span>HTML/Blade</span>
</p>

<p align="center">
  <img src="/screenshots/css.png" alt="CSS Sample" />
  <span>CSS</span>
</p>

<p align="center">
  <img src="/screenshots/react.png" alt="React Sample" />
  <span>React</span>
</p>

<p align="center">
  <img src="/screenshots/vue.png" alt="Vue Sample" />
  <span>Vue</span>
</p>

<p align="center">
  <img src="/screenshots/go.png" alt="Go Sample" />
  <span>Go</span>
</p>

<p align="center">
  <img src="/screenshots/ruby.png" alt="Ruby Sample" />
  <span>Ruby</span>
</p>

<p align="center">
  <img src="/screenshots/python.png" alt="Python Sample" />
  <span>Python</span>
</p>

## Credits

- Original [Carbon theme](https://plugins.jetbrains.com/plugin/12280-carbon) by [Luis Fernando Jiménez](https://github.com/luisfer0793)
- Original Vim port by [Michael Dyrynda](https://github.com/michaeldyrynda/carbon.vim)

## License

[Apache License 2.0](LICENSE)

See [NOTICE](NOTICE) for attribution details.
