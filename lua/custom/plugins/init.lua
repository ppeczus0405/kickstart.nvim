-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Guess indendation
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
  -- Autopair parenthesis
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  -- Neovim Tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup {}
      vim.keymap.set('n', '<C-n>', '<cmd>Neotree<CR>', { desc = 'Nvimtree Toggle window' })
    end,
  },
  -- Base 46 themes
  {
    'notken12/base46-colors',
    name = 'base46-colors',
    priority = 1000,
  },
  {
    'famiu/feline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'lewis6991/gitsigns.nvim',
      'Hitesh-Aggarwal/feline_theme.nvim',
    },
    config = function()
      vim.opt.termguicolors = true
      require('feline_theme').setup {}
    end,
  },
  {
    'tiagovla/scope.nvim',
    config = function()
      require('telescope').load_extension 'scope'
      vim.keymap.set('n', '<leader><leader>', '<CMD>Telescope scope buffers<CR>', { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<C-Left>', '<CMD>tabprevious<CR>', { desc = 'Previous Tab' })
      vim.keymap.set('n', '<C-Right>', '<CMD>tabnext<CR>', { desc = 'Next Tab' })
      vim.keymap.set('n', '<C-Up>', '<CMD>bprev<CR>', { desc = 'Previous buffer' })
      vim.keymap.set('n', '<C-Down>', '<CMD>bnext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<A-t>', '<CMD>tabnew<CR>', { desc = 'New Tab' })
      vim.keymap.set('n', '<A-q>', '<CMD>tabclose<CR>', { desc = 'Close Tab' })
      vim.keymap.set('n', '<A-d>', '<CMD>bdelete<CR>', { desc = 'Delete Buffer' })
    end,
  },
}
