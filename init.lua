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
vim.keymap.set('i', "<C-s>", '<Esc>:w<CR>a')
vim.o.shada = "!,'2000000,<10000,s1000000,h"
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
  'neovim/nvim-lspconfig',
  "mason-org/mason-lspconfig.nvim",
  "mason-org/mason.nvim",
  { "rcarriga/nvim-dap-ui",                dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  "mfussenegger/nvim-dap",
  "leoluz/nvim-dap-go",
  "jay-babu/mason-nvim-dap.nvim",
  "elentok/format-on-save.nvim",
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Test under cursor",
      },
      {
        "<leader>tR",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug Test under cursor",
      },
    },
  },
  "klen/nvim-test",
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  "ruifm/gitlinker.nvim",
  {
    "roobert/action-hints.nvim",
    config = function()
      require("lualine").setup({
        sections = {
          lualine_x = { require("action-hints").statusline },
        },
      })
    end,
  },
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
  {
    "OXY2DEV/markview.nvim",
    lazy = false,        -- load immediately (for markdown editing)
    ft = { "markdown" }, -- optional: load only for markdown
    opts = {
      -- put any plugin-specific configuration here
    },
    dependencies = {
      -- markview.nvim depends on nui.nvim
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
      config = function()
    require('img-clip').setup {
      -- Options for saving/embedding images
      save_method = 'base64', -- or 'file' for saving as a file
      -- Optional: configure image processing
      process_cmd = 'convert - -resize 50% png:-', -- Example: resize image to 50%
      -- Optional: configure directory for saved files (if save_method is 'file')
      dir_path = function()
        return vim.fn.expand("%:t:r") .. '_images'
      end,
    }
  end,
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                     -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim",         -- For standard functions
      "MunifTanjim/nui.nvim",          -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
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
          highlight_current_scope = { enable = false },
        },
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
              --
              -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
              ["]o"] = "@loop.*",
              -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
              --
              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
              ["]d"] = "@conditional.outer",
            },
            goto_previous = {
              ["[d"] = "@conditional.outer",
            }
          },
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["an"] = "@function.name", -- custom name object
              ["ac"] = "@class.outer",
              ["ag"] = "@call.outer",
              ["ig"] = "@call.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["ii"] = "@conditional.inner",
              ["ai"] = "@conditional.outer",
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
              ['@function.outer'] = 'V',  -- linewise
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
            include_surrounding_whitespace = false,
          },
        },
      })
    end
  },
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-context',

  { "lukas-reineke/indent-blankline.nvim", main = "ibl",                                                       opts = {} },
  'github/copilot.vim',
  --'hrsh7th/cmp-nvim-lsp',
  "ellisonleao/gruvbox.nvim",
  "prichrd/refgo.nvim",
  { 'glacambre/firenvim',        build = ":call firenvim#install(0)" },
  "christoomey/vim-tmux-navigator",
  "f-person/auto-dark-mode.nvim",
  "nanotee/zoxide.vim",
  'vladdoster/remember.nvim',
  'lewis6991/gitsigns.nvim',
  {
    "ray-x/go.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("go").setup({
        dap_debug = true, -- enable DAP integration
      })
    end,
  },
  "nvim-tree/nvim-web-devicons",
  "sindrets/diffview.nvim",
  "gpanders/editorconfig.nvim",
  "rbgrouleff/bclose.vim",
  {
    "cseickel/diagnostic-window.nvim",
    dependencies = { "MunifTanjim/nui.nvim" }
  },
  {
    "mikavilpas/yazi.nvim",
    version = "*",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
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
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "muniftanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- optional image support in preview window: see `# preview mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.config?
    opts = {
      -- fill any relevant options here
    },
  },
  {
    "oskarrrrrrr/symbols.nvim",
    config = function()
      local r = require("symbols.recipes")
      require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
        -- custom settings here
        -- e.g. hide_cursor = false
      })
      vim.keymap.set("n", ",s", "<cmd> Symbols<CR>")
      vim.keymap.set("n", ",S", "<cmd> SymbolsClose<CR>")
    end
  },
  "andymass/vim-matchup",
  { 'akinsho/git-conflict.nvim', version = "*",                      config = true },
  "nat-418/boole.nvim",
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
    keys = {
      "ga", -- Default invocation prefix
      { "<C-x><C-c>", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
      "ga", -- Default invocation prefix
      { "ga.",        "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    },
    cmd = {
      -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
    -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
    -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
    -- available after the first executing of it or after a keymap of text-case.nvim has been used.
    lazy = false,
  },
  "LunarVim/bigfile.nvim",
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },    -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken",       -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  "junegunn/fzf.vim",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        version = "^1.0.0",
      },
      "princejoogie/dir-telescope.nvim",
    },
    config = function()
      local telescope = require("telescope")

      -- first setup telescope
      telescope.setup({
        pickers = {
          find_files = {
            previewer = false,
          },
          oldfiles = {
            previewer = false,
          },
          git_status = {
            previewer = false,
          },
          buffers = {
            previewer = false,
            mappings = {
              i = {
                ["<c-d>"] = "delete_buffer",
              },
              n = {
                ["dd"] = "delete_buffer",
              },
            },
          },
        },
      })

      -- then load the extension
      telescope.load_extension("live_grep_args")
      telescope.load_extension("dir")
    end
  },
  {
    'LukasPietzschmann/telescope-tabs',
    config = function()
      require('telescope').load_extension 'telescope-tabs'
      require('telescope-tabs').setup {
        -- Your custom config :^)
      }
    end,
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    'chomosuke/term-edit.nvim',
    lazy = false,
    version = '1.*',
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      win_options = {
        signcolumn = "yes:2",
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "refractalize/oil-git-status.nvim",

    dependencies = {
      "stevearc/oil.nvim",
    },

    config = true,
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
require("gitlinker").setup()
require('boole').setup({
  mappings = {
    increment = '<C-a>',
    decrement = '<C-x>'
  },
  -- User defined loops
  additions = {
    { 'Foo', 'Bar' },
    { 'tic', 'tac', 'toe' }
  },
  allow_caps_additions = {
    { 'enable', 'disable' }
    -- enable → disable
    -- Enable → Disable
    -- ENABLE → DISABLE
  }
})

local wk = require("which-key")
wk.add {
  { '<leader>g',    group = 'Git' },
  { '<leader>gh',   group = 'Github' },
  { '<leader>ghc',  group = 'Commits' },
  { '<leader>ghcc', '<cmd>GHCloseCommit<cr>',    desc = 'Close' },
  { '<leader>ghce', '<cmd>GHExpandCommit<cr>',   desc = 'Expand' },
  { '<leader>ghco', '<cmd>GHOpenToCommit<cr>',   desc = 'Open To' },
  { '<leader>ghcp', '<cmd>GHPopOutCommit<cr>',   desc = 'Pop Out' },
  { '<leader>ghcz', '<cmd>GHCollapseCommit<cr>', desc = 'Collapse' },
  { '<leader>ghi',  group = 'Issues' },
  { '<leader>ghip', '<cmd>GHPreviewIssue<cr>',   desc = 'Preview' },
  { '<leader>ghl',  group = 'Litee' },
  { '<leader>ghlt', '<cmd>LTPanel<cr>',          desc = 'Toggle Panel' },
  { '<leader>ghp',  group = 'Pull Request' },
  { '<leader>ghpc', '<cmd>GHClosePR<cr>',        desc = 'Close' },
  { '<leader>ghpd', '<cmd>GHPRDetails<cr>',      desc = 'Details' },
  { '<leader>ghpe', '<cmd>GHExpandPR<cr>',       desc = 'Expand' },
  { '<leader>ghpo', '<cmd>GHOpenPR<cr>',         desc = 'Open' },
  { '<leader>ghpp', '<cmd>GHPopOutPR<cr>',       desc = 'PopOut' },
  { '<leader>ghpr', '<cmd>GHRefreshPR<cr>',      desc = 'Refresh' },
  { '<leader>ghpt', '<cmd>GHOpenToPR<cr>',       desc = 'Open To' },
  { '<leader>ghpz', '<cmd>GHCollapsePR<cr>',     desc = 'Collapse' },
  { '<leader>ghr',  group = 'Review' },
  { '<leader>ghrb', '<cmd>GHStartReview<cr>',    desc = 'Begin' },
  { '<leader>ghrc', '<cmd>GHCloseReview<cr>',    desc = 'Close' },
  { '<leader>ghrd', '<cmd>GHDeleteReview<cr>',   desc = 'Delete' },
  { '<leader>ghre', '<cmd>GHExpandReview<cr>',   desc = 'Expand' },
  { '<leader>ghrs', '<cmd>GHSubmitReview<cr>',   desc = 'Submit' },
  { '<leader>ghrz', '<cmd>GHCollapseReview<cr>', desc = 'Collapse' },
  { '<leader>ght',  group = 'Threads' },
  { '<leader>ghtc', '<cmd>GHCreateThread<cr>',   desc = 'Create' },
  { '<leader>ghtn', '<cmd>GHNextThread<cr>',     desc = 'Next' },
  { '<leader>ghtt', '<cmd>GHToggleThread<cr>',   desc = 'Toggle' },
}

require("mason").setup()
require("mason-lspconfig").setup(
  { ensure_installed = { "ts_ls" } }
)
local lspconfig = require('lspconfig')
require('lspconfig').ts_ls.setup({
  on_attach = function(client, bufnr)
    -- Additional on_attach settings can go here
  end,
  -- Extra env for tsserver logs + memory
  cmd_env = {
    -- tsserver logging (created by typescript-language-server)
    TSS_LOG = "-logToFile true -file /tmp/tsserver.log -level verbose",
    NODE_OPTIONS = "--max-old-space-size=4096",
  },
  init_options = {
    maxTsServerMemory = 32384,
  }
})

lspconfig.gopls.setup({
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
   cmd_env = {
    -- Soft cap for Go runtime memory used by gopls:
    -- accepts plain bytes or units like KiB, MiB, GiB
    GOMEMLIMIT = "50GiB",
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})

require("mason-nvim-dap").setup()
require("oil").setup({
  win_options = {
    signcolumn = "yes:2",
  },
})

vim.keymap.set('n', '<leader>y', ':Yazi<CR>')
vim.keymap.set('n', '<leader>d', ':DiagWindowShow<CR>')

ssh_con = os.getenv("SSH_CONNECTION")
if not ssh_con or string.len(ssh_con) == 0 then
  require("auto-dark-mode").setup()
end
require('nvim-test').setup()
require 'term-edit'.setup {
  prompt_end = '➜ '
}
require("ibl").setup()
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
  model = 'gpt-4o',
}
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.cmd([[colorscheme gruvbox]])
-- todo move mappings into a separate file
vim.keymap.set('n', '<leader>rr', ':source $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>re', ':tabnew ~/.config/nvim/init.lua<CR>')

-- git setup {{{
require('gitsigns').setup {
  signs                        = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged                 = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable          = true,
  signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    follow_files = true
  },
  auto_attach                  = true,
  attach_to_untracked          = false,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,   -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach                    = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', 'gn', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', 'gp', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', 'gs', gitsigns.stage_hunk)
    map('n', 'gu', gitsigns.reset_hunk)

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', 'gu', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', 'gS', gitsigns.stage_buffer)
    map('n', 'gSR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>gbs', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>td', gitsigns.toggle_deleted)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end
}
--- }}}
--- telescope setup {{{
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = {         -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          -- freeze the current list and start a fuzzy search in the frozen list
          ["<C-space>"] = actions.to_fuzzy_refine,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}
telescope.load_extension("live_grep_args")
-- }}}

-- todo get this to work
require("neotest").setup({
  adapters = {
    require("neotest-jest")({
      -- jestCommand = require('neotest-jest.jest-util').getJestCommand(vim.fn.expand '%:p:h'),
      jestCommand = "npx jest --verbose",
      jestConfigFile = function(file)
        if string.find(file, "/packages/") then
          return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
        end
        return vim.fn.getcwd() .. "/jest.config.ts"
      end,
    })
  }
})

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fw', function()
  builtin.git_status({
    timeout = 10000,
    enable_preview = true,
  })
end, { desc = "change files" })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
vim.keymap.set('n', '<C-e>', ':e!<CR>')
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set("n", "<leader>fa", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fr', function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Buffers',
  })
end, { desc = '[S]earch with [G]rep (open buffers only)' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>hc', builtin.command_history, {})
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lt", "<cmd>Telescope telescope-tabs list_tabs<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>glc', function()
  require('telescope.builtin').find_files({
    find_command = { 'git', 'diff', '--name-only', 'HEAD^', 'HEAD' },
  })
end, { desc = 'File changed in last commit' })

vim.keymap.set('n', '<leader>gbl', function()
  require('telescope.builtin').git_branches({
    show_remote_tracking = true,
  })
end, { desc = 'Checkout [G]it [B]ranch' })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', "<leader>e", vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next)
vim.keymap.set('n', "<leader>q", vim.diagnostic.setloclist)

-- copilot
vim.keymap.set('i', '<C-Space>', '<Plug>(copilot-accept-word)')
--todo remap this to prevent conflict with tmux mapping
--the remote vim tmux mappings don't work any way so might as well get some
--use out of C-l (todo find something better)
vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-line)')


--'go.nvim setup'
-- require('go').setup()
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
    vim.keymap.set('n', 'gy', '<cmd>Telescope lsp_type_definitions<CR>', opts)
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
    vim.keymap.set('n', "<C-x>f", ':GoTestFunc<CR>', opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
require('remember')
local formatters = require("format-on-save.formatters")
require('format-on-save').setup({
  experiments = {
    partial_update = 'diff', -- or 'line-by-line'
  },
  formatter_by_ft = {
    css = formatters.lsp,
    html = formatters.lsp,
    java = formatters.lsp,
    javascript = formatters.lsp,
    json = formatters.shell({ cmd = { "jq" } }),
    lua = formatters.lsp,
    markdown = formatters.prettierd,
    openscad = formatters.lsp,
    python = formatters.black,
    rust = formatters.lsp,
    scad = formatters.lsp,
    scss = formatters.lsp,
    sh = formatters.shfmt,
    terraform = formatters.lsp,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    yaml = formatters.lsp,
    golang = formatters.lsp,
  }
})
vim.keymap.set('n', "<leader>ga", ':GoDebug -a<CR>')
vim.keymap.set('n', "<leader>bb", ':GoBreakToggle<CR>')
vim.cmd([[colorscheme gruvbox]])
-- cool if this works
if ssh_con and string.len(ssh_con) > 0 then
  if vim.fn.executable("pbcopy") == 0 then
    print("pbcopy not found, clipboard integration won't work")
  else
    vim.g.clipboard = {
      name = "hackers_clipboard",
      copy = {
        ["+"] = 'pbcopy',
        ["*"] = 'pbcopy',
      },
      paste = {
        ["+"] = (function()
          return vim.fn.systemlist('pbpaste|sed -e "s/\r$//"', { '' }, 1) -- '1' keeps empty lines
        end),
        ["*"] = (function()
          return vim.fn.systemlist('pbpaste|sed -e "s/\r$//"', { '' }, 1)
        end),
      },
      cache_enabled = true
    }
  end
end
-- default config
require("bigfile").setup {
  filesize = 2,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
  pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  features = {       -- features to disable
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "syntax",
    "matchparen",
    "vimopts",
    "filetype",
  },
  lines = 12000,
}
-- thank you chatgpt for when git breaks
-- Delete the path(s) under cursor or in the current visual selection.
-- Uses `rm -rf` (POSIX). Works with relative paths listed in the buffer.

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function collect_targets()
  local mode = vim.fn.mode()
  local bufnr = 0
  if mode == "V" or mode == "v" then
    -- Visual selection: get start/end rows (1-indexed)
    local srow = vim.fn.getpos("'<")[2]
    local erow = vim.fn.getpos("'>")[2]
    if srow > erow then srow, erow = erow, srow end
    local lines = vim.api.nvim_buf_get_lines(bufnr, srow - 1, erow, false)
    return lines, srow, erow
  else
    -- Normal mode: just the current line
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local line = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)[1]
    return { line }, row, row
  end
end

local function delete_paths_under_cursor_or_visual()
  local lines, srow, erow = collect_targets()
  -- Build target list (trim and drop empty)
  local targets = {}
  for _, l in ipairs(lines) do
    local p = trim(l or "")
    if p ~= "" then table.insert(targets, p) end
  end
  if #targets == 0 then
    print("No paths to delete.")
    return
  end

  local msg
  if #targets == 1 then
    msg = string.format("Delete: %s ?", targets[0 or 1] or targets[1])
  else
    msg = string.format("Delete %d paths?", #targets)
  end
  local ok = vim.fn.confirm(msg, "&Yes\n&No", 2)
  if ok ~= 1 then return end

  -- Delete each path with rm -rf (no shell, so no quoting issues)
  local failures = {}
  for _, p in ipairs(targets) do
    vim.fn.system({ "rm", "-rf", p })
    if vim.v.shell_error ~= 0 then
      table.insert(failures, p)
    end
  end

  -- Remove the lines from the buffer (even if some failed—optional)
  vim.api.nvim_buf_set_lines(0, srow - 1, erow, false, {})

  if #failures > 0 then
    vim.notify("Failed to delete:\n" .. table.concat(failures, "\n"),
      vim.log.levels.ERROR)
  else
    vim.notify("Deleted " .. #targets .. " path(s).")
  end
end

-- Keymaps: Normal = delete current line path; Visual = delete all selected lines
vim.keymap.set({ "n", "v" }, "<leader>D", delete_paths_under_cursor_or_visual,
  { desc = "Delete file/dir for current line(s)" })
-- Chatgpt generated will hopefully help with opening stuff from the lsp
vim.opt.directory = vim.fn.stdpath("state") .. "/swap//"
vim.opt.shortmess:append("A")
vim.opt.confirm = true
