-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
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
      vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>', { desc = 'Nvimtree Toggle window' })
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
    end,
  },
  {
    'pboettch/vim-cmake-syntax',
  },
  {
    'ppeczus0405/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
          themable = false, -- allows highlight groups to be overriden i.e. sets highlights as default
          numbers = 'ordinal',
          close_command = function(n)
            require('mini.bufremove').delete(n, false)
            require('bufferline.ui').refresh()
          end,
          right_mouse_command = function(n)
            require('mini.bufremove').delete(n, false)
            require('bufferline.ui').refresh()
          end,
          left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
          middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
          indicator = {
            style = 'underline',
          },
          diagnostics = 'nvim_lsp',
          diagnostics_update_in_insert = false,
          -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match 'error' and ' ' or ' '
            return ' ' .. icon .. count
          end,
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'File Explorer',
              highlight = 'Directory',
              text_align = 'center',
              separator = true,
            },
          },
          color_icons = true, -- whether or not to add the filetype icon highlights
          show_buffer_icons = true, -- disable filetype icons for buffers
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          separator_style = 'slope',
          always_show_bufferline = true,
        },
      }
      vim.keymap.set('n', '<leader><leader>', '<CMD>Telescope scope buffers<CR>', { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<C-Left>', function()
        bufferline.cycle(-1)
      end, { desc = 'Previous Tab' })
      vim.keymap.set('n', '<C-Right>', function()
        bufferline.cycle(1)
      end, { desc = 'Next Tab' })
      vim.keymap.set('n', '<A-t>', function()
        vim.api.nvim_create_buf(true, false)
        bufferline.refresh_state()
        bufferline.go_to(bufferline.tabs_count())
      end, { desc = 'New Tab' })
      vim.keymap.set('n', '<A-d>', function()
        bufferline.close_current()
      end, { desc = 'Close Tab' })
    end,
  },
  {
    'sindrets/diffview.nvim',
  },
  {
    'ppeczus0405/vim-fugitive',
  },
  {
    'rbong/vim-flog',
    lazy = true,
    cmd = { 'Flog', 'Flogsplit', 'Floggit' },
    dependencies = {
      'ppeczus0405/vim-fugitive',
    },
  },
  {
    'weirongxu/plantuml-previewer.vim',
    dependencies = {
      'tyru/open-browser.vim',
      'aklt/plantuml-syntax',
    },
  },
  {
    'instant-markdown/vim-instant-markdown',
  },
}
