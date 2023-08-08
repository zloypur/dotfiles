-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use { "wbthomason/packer.nvim" }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.2",
    -- or                            , branch = "0.1.x",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "debugloop/telescope-undo.nvim" },
    },
  }

  -- Spectre
  use {
    "nvim-pack/nvim-spectre",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  -- File tree
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  }

  -- UndoTree
  use { "mbbill/undotree" }

  -- Git
  use {
    "kdheepak/lazygit.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  }

  -- Tabs
  use {
    "romgrk/barbar.nvim",
    requires = {
      { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
      { "lewis6991/gitsigns.nvim" },     -- OPTIONAL: for git status
    },
  }

  -- LSP
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },         -- Required
      { "hrsh7th/cmp-nvim-lsp" },     -- Required
      { "hrsh7th/cmp-buffer" },       -- Optional
      { "hrsh7th/cmp-path" },         -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" },     -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" },             -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional

      -- Java specific packages
      { "mfussenegger/nvim-jdtls" },
    }
  }
  use { "folke/neodev.nvim", config = function()
    require("trouble").setup {
      icons = false,
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }

  -- Debug
  use {
    "rcarriga/nvim-dap-ui",
    requires = {
      { "mfussenegger/nvim-dap" },
    }
  }

  -- Color schemes
  use { "morhetz/gruvbox" }
end)
