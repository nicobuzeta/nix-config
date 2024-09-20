---@type LazySpec
return {
  'benlubas/molten-nvim',
  version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
  dependencies = { '3rd/image.nvim' },
  build = ':UpdateRemotePlugins',
  init = function()
    -- this is an example, not a default. Please see the readme for more configuration options
    vim.g.molten_image_provider = 'image.nvim'
    vim.g.molten_output_win_max_height = 12
  end,
}
