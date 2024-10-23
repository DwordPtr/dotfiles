vim.wo.number = true
vim.cmd("set fileformat=unix")
vim.o.clipboard = "unnamedplus"
-- Change leader to a comma
vim.g.mapleader = "\\"
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', ':!!sh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-y>', ':let @+ = expand("%:p")<CR>')
vim.keymap.set('n', "<left>", "gT")
vim.keymap.set('n', "<right>", "gt")
vim.keymap.set('n', "<C-c>", ":q<CR>")
vim.keymap.set('n', "<leader>re", ":tabnew ~/.config/nvim/init.lua<CR>")
vim.keymap.set('n', "<leader>rr", ":source $MYVIMRC<CR>")
vim.keymap.set('n', "<C-s>", ':w<CR>')
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
plugins = {
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  'endel/vim-github-colorscheme',
  'neovim/nvim-lspconfig',
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  "theHamsta/nvim-dap-virtual-text",
  "mfussenegger/nvim-dap",
  "jay-babu/mason-nvim-dap.nvim",
  "pmizio/typescript-tools.nvim",
  --'tpope/vim-surround',
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  'williamboman/nvim-lsp-installer',
  {
     "amitds1997/remote-nvim.nvim",
     version = "*", -- Pin to GitHub releases
     dependencies = {
         "nvim-lua/plenary.nvim", -- For standard functions
         "MunifTanjim/nui.nvim", -- To build the plugin UI
         "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
     },
     config = true,
  },
  'mfussenegger/nvim-jdtls',
  {'nvim-treesitter/nvim-treesitter', build= ':TSUpdate', 
   config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "jsonc", "markdown", "lua", 
          "vim", "vimdoc", "query", "go", "typescript", "javascript", "html" 
        },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
          refactor = {
            smart_rename = {
              enable = true,
              -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
              keymaps = {
                smart_rename = "grr",
              },
            },
           highlight_definitions = {
              enable = true,
              -- Set to false if you have an `updatetime` of ~100.
              clear_on_cursor_move = true,
            },
            highlight_current_scope = { enable = true },
          },
          textobjects = {
            select = {
              enable = true,

              -- Automatically jump forward to textobj, similar to targets.vim
              lookahead = true,

              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
              },
              -- You can choose the select mode (default is charwise 'v')
              --
              -- Can also be a function which gets passed a table with the keys
              -- * query_string: eg '@function.inner'
              -- * method: eg 'v' or 'o'
              -- and should return the mode ('v', 'V', or '<c-v>') or a table
              -- mapping query_strings to modes.
              selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
              },
              -- If you set this to `true` (default is `false`) then any textobject is
              -- extended to include preceding or succeeding whitespace. Succeeding
              -- whitespace has priority in order to act similarly to eg the built-in
              -- `ap`.
              --
              -- Can also be a function which gets passed a table with the keys
              -- * query_string: eg '@function.inner'
              -- * selection_mode: eg 'v'
              -- and should return true or false
              include_surrounding_whitespace = true,
            },
                },})
            end},
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/nvim-treesitter-textobjects',
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  'github/copilot.vim',
  --'hrsh7th/cmp-nvim-lsp',
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",
  "shaunsingh/solarized.nvim",
  "sainnhe/everforest",
  "prichrd/refgo.nvim",
  "christoomey/vim-tmux-navigator",
  "f-person/auto-dark-mode.nvim",
  "nanotee/zoxide.vim",
  "tpope/vim-dadbod",
  'vladdoster/remember.nvim',
  "tanvirtin/vgit.nvim",
  "scottmckendry/cyberdream.nvim",
  "ray-x/go.nvim",
  "francoiscabrol/ranger.vim",
  "nvim-tree/nvim-web-devicons",
  "sindrets/diffview.nvim",
  "gpanders/editorconfig.nvim",
  "rbgrouleff/bclose.vim",
  "mikavilpas/yazi.nvim",
  {'akinsho/git-conflict.nvim', version = "*", config = true},
  "nat-418/boole.nvim",
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  "junegunn/fzf.vim",
  config = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
      vim.cmd("colorscheme gruvbox")
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'chomosuke/term-edit.nvim',
    lazy = false,
    version = '1.*',
  },
  "ldelossa/gh.nvim",
  dependencies = {
    {
      "ldelossa/litee.nvim",
      config = function()
        require("litee.lib").setup()
      end,
    },
  },
  config = function()
    require("litee.gh").setup()
  end,
  'jeffkreeftmeijer/neovim-sensible',
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  },
  "rcarriga/nvim-notify",  -- optional
  "stevearc/dressing.nvim" -- optional, UI for :JupyniumKernelSelect
}

require("lazy").setup(plugins, {})
require('boole').setup({
  mappings = {
    increment = '<C-a>',
    decrement = '<C-x>'
  },
  -- User defined loops
  additions = {
    {'Foo', 'Bar'},
    {'tic', 'tac', 'toe'}
  },
  allow_caps_additions = {
    {'enable', 'disable'}
    -- enable → disable
    -- Enable → Disable
    -- ENABLE → DISABLE
  }
})
require("lspconfig").pylsp.setup {}
require("mason").setup()
require("mason-lspconfig").setup()
lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})
require("mason-nvim-dap").setup()
require("nvim-dap-virtual-text").setup()
require("auto-dark-mode").setup()
vim.o.background = "light"
require 'term-edit'.setup {
  prompt_end = '➜ '
}
require("ibl").setup()
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
-- Setup language servers.
require("nvim-lsp-installer").setup {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'gopls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
vim.cmd([[set foldmethod=syntax]])
vim.cmd([[colorscheme gruvbox]])
-- todo move mappings into a separate file
vim.keymap.set('n', '<leader>rr', ':source $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>re', ':tabnew ~/.config/nvim/init.lua<CR>')

vgit = require('vgit')
vgit.setup()
vim.keymap.set('n', 'gn', vgit.hunk_down)
vim.keymap.set('n', 'gp', vgit.hunk_up)
vim.keymap.set('n', 'gs', vgit.buffer_hunk_stage)
vim.keymap.set('n', 'gu', vgit.buffer_hunk_reset)
vim.keymap.set('n', '<leader>gb', vgit.buffer_gutter_blame_preview)


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', "<leader>e", vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next)
vim.keymap.set('n', "<leader>q", vim.diagnostic.setloclist)

--'go.nvim setup'
require('go').setup()
--below is broken rn
--require("go.format").goimports()  -- goimports + gofmt
---- Run gofmt + goimports on save
--local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*.go",
--  callback = function()
--   require('go.format').goimports()
--  end,
--  group = format_sync_grp,
--})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>gt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})
    vim.keymap.set('n', "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', "<leader>gt", ':GoFuncTest<CR>', opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
require('remember')
