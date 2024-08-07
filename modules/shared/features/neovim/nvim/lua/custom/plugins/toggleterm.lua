return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'double',
      },
    }
    function _lazygit_toggle()
      lazygit:toggle()
    end
    vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
  end,
}
