return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      filtered_items = {
        hide_dotfiles = false,
      },
    },
    window = {
      mappings = {
        ['<space>'] = 'none',
      },
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { position = "float", toggle = true }
      end,
      desc = 'Toggle NeoTree',
    },
    {
      "<leader>nc",
      function()
        require("neo-tree.command").execute({ position = "float", reveal = true, toggle = true })
      end,
      desc = "Git Explorer",
    },
    {
      "<leader>ng",
      function()
        require("neo-tree.command").execute({ source = "git_status", position = "float", toggle = true })
      end,
      desc = "Git Explorer",
    },
    {
      "<leader>nb",
      function()
        require("neo-tree.command").execute({ source = "buffers", position = "float", toggle = true })
      end,
      desc = "Buffer Explorer",
    }
  },
}
