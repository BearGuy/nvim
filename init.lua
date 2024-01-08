-- autoload packer
package.path = package.path .. ';/usr/local/share/lua/5.4/?.lua' -- Modify this path as per your LuaRocks installation
package.path = package.path .. ';/usr/local/share/lua/5.4/?/init.lua'
package.cpath = package.cpath .. ';/usr/local/lib/lua/5.4/?.so' -- Modify this path as per your LuaRocks installation

vim.cmd [[packadd packer.nvim]]
vim.g.loaded_python3_provider = 0

require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', opt = true}

  use 'navarasu/onedark.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  --use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  -- writing plugins
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  --use 'SirVer/ultisnips'
  --use 'honza/vim-snippets'
  use { "kkharji/sqlite.lua" }
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}
  use 'stevearc/dressing.nvim'
  use 'scrooloose/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'preservim/nerdcommenter'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {'mg979/vim-visual-multi', branch = 'master'}
  use 'github/copilot.vim'
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
  use 'simrat39/rust-tools.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'wuelnerdotexe/vim-astro'
  use 'mhanberg/elixir.nvim'
end)

vim.opt.syntax = "on"
vim.g.onedark_config = {
  style = 'deep',
  toggle_style_key = '<leader>ts',
  ending_tildes = true,
  diagnostics = {
    darker = false,
    background = false,
  },
}
vim.cmd [[colorscheme onedark]]

-- Vim options
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "v"
vim.opt.hlsearch = false
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmode = { "longest", "list" }
vim.cmd('filetype plugin indent on')
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.hidden = true
vim.wo.wrap = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8


-- Globals
vim.g.mapleader = ' '
vim.g.python3_host_prog = '/Users/stephenpeterkins/.pyenv/versions/3.9.11/bin/python3'
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'
vim.g.go_fmt_command = "gofmt"
vim.g.syntastic_go_checkers = {'golint', 'govet', 'errcheck'}
vim.g.astro_typescript = 'enable'
vim.g.NERDTreeShowHidden = 1
vim.g.netrw_banner = 0
vim.g.copilot_no_tab_map = true
vim.g.yui_api_key = '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'

-- Set runtimepath for Yui
--vim.opt.runtimepath:prepend('~/.config/nvim/lua/yui.nvim/lua')

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep hidden=true<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers hidden=true<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags hidden=true<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>nn', ':NERDTreeToggle<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>nb', ':NERDTreeFromBookmark', {})
vim.api.nvim_set_keymap('n', '<leader>nf', ':NERDTreeFind<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>nr', ':NERDTreeRefreshRoot<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>ef', '<cmd>Explore<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>sf', '<cmd>Sexplore<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>vf', '<cmd>Vexplore<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>Texplore<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>gb', ':lua require("gitlab_commands").gbrowse_line() <cr>', {})

-- Yui bindings
vim.api.nvim_set_keymap('n', '<leader>yu', ':lua require("yui").chat.new_chat_session()<cr>', {})
vim.api.nvim_set_keymap('v', '<leader>yu', ':lua require("yui").chat.new_chat_session_with_vis_selection()<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>yi', ':lua require("yui").chat.new_message_from_buffer()<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>yc', ':lua require("yui").chat.show_chat_win()<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>yn', ':lua require("yui").chat.create_chat()<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>yl', ':lua require("yui").chat.list_chats()<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>yd', ':lua require("yui").chat.delete_chat()<cr>', {})

-- Window bindings
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})

-- Set clipboard options
vim.opt.clipboard = "unnamedplus"

-- Load the custom modules
require("lsp_config")

-- Completeopt settings
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append("c")
require("auto_complete")

-- Tree sitter configuration
require("tree_sitter")

-- Goyo writing config
local function GoyoBefore()
  --vim.cmd("silent !tmux set status off")
  vim.cmd("setlocal spell spelllang=en_ca")
  vim.cmd("set tw=78")
  vim.cmd("Limelight")
  --vim.cmd("color off")
end

local function GoyoAfter()
  --vim.cmd("silent !tmux set status on")
  vim.cmd("set tw=0")
  vim.cmd("Limelight!")
  --vim.cmd("color gruvbox")
end

vim.g.goyo_callbacks = {GoyoBefore, GoyoAfter}

-- vim Input and Select UI
require('dressing').setup({
  input = {
    -- Other configuration options

    -- These are passed to nvim_open_win
    relative = "editor",
    width = 0.2,
    height = 0.6,
    min_width = 20,
    min_height = 10,
  },

})

-- Define TrimWhitespace function
function TrimWhitespace()
    local save = vim.fn.winsaveview()
    vim.cmd('%s/\\s\\+$//e')
    vim.fn.winrestview(save)
end

function ReloadYui()
    local reload = require('plenary.reload').reload_module

    -- Use the module name here
    local module_name = 'yui'

    -- This will clear the module from the cache
    reload(module_name)

    -- Now you can require it again, and the updated version will be loaded
    local yui = require(module_name)
end

vim.api.nvim_exec([[
  autocmd BufWritePost ]]..vim.fn.expand("<sfile>:p:h")..[[/lua/yui/*.* lua ReloadYui()
]], false)

-- Define autocmd
vim.cmd([[
    augroup BEARGUY
        autocmd!
        autocmd BufWritePre * lua TrimWhitespace()
    augroup END
]])

-- Go commands
require("go").setup()
vim.cmd('autocmd BufWritePre *.go :silent! lua require(\'go.format\').gofmt()')
