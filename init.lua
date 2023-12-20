-- Nvim Settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true

-- Pckr
local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
	'nvim-treesitter/nvim-treesitter',
	'neovim/nvim-lspconfig',
	'ellisonleao/gruvbox.nvim',
	'yamatsum/nvim-cursorline',

	{ 'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-signature-help'
		}
	},

	{ 'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	},

	{ 'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		requires = {
			'nvim-lua/plenary.nvim',
			'BurntSushi/ripgrep',
			'nvim-tree/nvim-web-devicons',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		}
	},
}

-- Lualine
local lualine = require("lualine");
lualine.setup{
    options = {
		icons_enabled = false,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
};

-- Nvim-cmp
local cmp = require("cmp");

cmp.setup({
   enabled = function()
    local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
    if in_prompt then  -- this will disable cmp in the Telescope window (taken from the default config)
      return false
    end
    local context = require("cmp.config.context")
    return not(context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
   end,
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  completion = {
        keyword_length = 2,  -- Min word length before showing result
    },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
	["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      else
        fallback()
	  end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
	  { name = 'path' },
	  { name = 'vsnip' },
	  { name = 'buffer' },
	  { name = 'nvim_lsp' }, 
	  { name = 'nvim_lsp_signature_help' }
	}),
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' }
			}
		}
	})
})

-- Lspconfig
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup {
	cmd = {'/opt/nicola/clangd_16.0.2/bin/clangd'},
	capabilities = capabilities
}

-- Colorscheme
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- Cursorline
require('nvim-cursorline').setup {
  cursorline = {
    enable = false,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

-- Keymap
vim.g.mapleader = ','

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
