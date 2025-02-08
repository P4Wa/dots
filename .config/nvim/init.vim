set number
set incsearch
set wildmenu

call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v2.x'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

colorscheme nord

nnoremap <leader>e :NeoTreeFocusToggle<CR>

lua << EOF
  -- Require nvim-cmp for auto-completion
  local cmp = require'cmp'

  -- Configure nvim-cmp
  cmp.setup({
    -- Snippet expansion settings (using LuaSnip)
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)  -- Expands snippets using LuaSnip
      end,
    },
    -- Key mappings for completion navigation and actions
    mapping = {
      ['<C-n>'] = cmp.mapping.select_next_item(),    -- Move to the next item in the completion list
      ['<C-p>'] = cmp.mapping.select_prev_item(),    -- Move to the previous item in the completion list
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),       -- Scroll documentation up
      ['<C-f>'] = cmp.mapping.scroll_docs(4),        -- Scroll documentation down
      ['<C-Space>'] = cmp.mapping.complete(),        -- Trigger auto-completion
      ['<C-e>'] = cmp.mapping.close(),              -- Close the completion menu
    },
    -- Define the sources for auto-completion
    sources = {
      { name = 'nvim_lsp' },   -- Completion source from the Language Server Protocol (LSP)
      { name = 'buffer' },     -- Completion source from the current buffer (file content)
      { name = 'path' },       -- Completion source for file paths
      { name = 'luasnip' },    -- Completion source for LuaSnip snippets
    },
    -- Formatting of the completion menu
    formatting = {
      format = function(entry, vim_item)
        -- Modify the format of the completion item, e.g., add the source name
        vim_item.kind = string.format('%s %s', vim_item.kind, entry.source.name)
        return vim_item
      end,
    },
  })
EOF
