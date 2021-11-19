if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'L3MON4D3/LuaSnip'

  " File explorer
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  " Telescope
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'


  "Autocompletion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "" Vsnip
  Plug 'hrsh7th/vim-vsnip'
  

  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  "org mode
  Plug 'kristijanhusak/orgmode.nvim'


  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'

  Plug 'joshdick/onedark.vim'
  Plug 'sheerun/vim-polyglot'

  "colorizer 
  Plug 'norcalli/nvim-colorizer.lua'

  "vim-which-key
  Plug 'liuchengxu/vim-which-key'

  " Being able to save as root
  Plug 'lambdalisue/suda.vim'

  " Comment lines
  Plug 'winston0410/commented.nvim'

  "Harpoon
  Plug 'ThePrimeagen/harpoon'

  Plug 'tpope/vim-obsession'
  Plug 'rbong/vim-crystalline'
  Plug 'tpope/vim-surround'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()
