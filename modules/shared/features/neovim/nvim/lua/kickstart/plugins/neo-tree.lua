-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    's1n7ax/nvim-window-picker'
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>0', ':Neotree reveal<CR>', desc = 'Focus Neotree on current file' },
    { '<leader>E', ':Neotree action=focus toggle<CR>', desc = 'Toggle Neotree' },
  },
  -- Broken Lazy with Neotree
  lazy = false,
  opts = {
    window = {
      mappings = {
        ['l'] = 'open',
      },
    },
    filesystem = {
      follow_current_file = {
        enable = true,
      },
      hijack_netrw_behaviour = 'open_current',
    },
  },
}
