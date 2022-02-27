local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Language Servers
  use {
    'lspcontainers/lspcontainers.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/lsp_extensions.nvim',
    },
    config = function ()
      require'lspcontainers'.setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "html",
          "pylsp",
          "rust_analyzer",
          "sumneko_lua",
          "yamlls"
        }
      })

      require'Jordi.plugins.lspconfig'.init()
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    config = function ()
      require'Jordi.plugins.treesitter'.init()
    end,
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'ray-x/cmp-treesitter',
      {
        'tzachar/cmp-tabnine',
        run = "./install.sh",
      },
      'onsails/lspkind-nvim'
    },
    config = function ()
      require'Jordi.plugins.cmp'.init()
      require'Jordi.plugins.cmp_tabnine'.init()
      require'Jordi.plugins.lspkind'.init()
    end
  }

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'rmagatti/session-lens',
    config = function ()
      require'Jordi.plugins.telescope'.init()
    end
  }

  -- Themes
  use {
    'folke/tokyonight.nvim',
    config = function ()
      require'Jordi.plugins.tokyonight'.init()
    end
  }

  -- Git Support
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require'Jordi.plugins.gitsigns'.init()
    end
  }

  -- Utilities
  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require'Jordi.plugins.lualine'.init()
    end
  }

  use 'preservim/nerdcommenter'

  use 'romgrk/nvim-treesitter-context'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require"trouble".setup()
    end
  }

  use {
    'folke/lsp-colors.nvim',
    config = function()
      require("lsp-colors").setup()
    end
  }

  use {
    'voldikss/vim-floaterm',
    config = function ()
      require'Jordi.plugins.floaterm'.init()
    end
  }

  use {
    'weilbith/nvim-code-action-menu',
    requires = {
      'kosayoda/nvim-lightbulb'
    },
    cmd = 'CodeActionMenu',
    config = function ()
      require'Jordi.plugins.code_action_menu'.init()
    end
  }
end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
