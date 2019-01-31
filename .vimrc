" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" tab and indent
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

" appearence
set cursorline
syntax on
set number
set ruler
hi Comment ctermfg=blue

" setting of dein.vim
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
 call dein#begin('~/.vim/dein')

 " about toml file
 let g:dein_dir = expand('~/.vim/dein')
 let s:toml = g:dein_dir . '/dein.toml'
 let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'

 " plod toml file
 call dein#load_toml(s:toml, {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})

 " 自分のプラグイン

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

"もし未インストールがあればインストール
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
set background=dark

colorscheme molokai
"colorscheme gruvbox
"colorscheme moonshine_lowcontrast
"colorscheme splatoon
set t_Co=256

"quickrn
let g:quickrun_config = {}
