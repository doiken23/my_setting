" showin
set number
set cursorline
set virtualedit=onemore
set smartindent
set autoindent
colorscheme koehler
set listchars=tab:^\ ,trail:~
set showmatch
set title
syntax on

" Tab
set expandtab
set tabstop=4
set shiftwidth=4

" search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'w0rp/ale'
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'tomasr/molokai'
NeoBundle 'dracula/vim'

call neobundle#end()

" color scheme
colorscheme dracula
syntax enable
set t_Co=256

" インデントラインの設定
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray

" python syntax
let g:python_highlight_command = ""

" ale tool
let g:ale_linters = {
    \   'python': ['flake8'],
    \}
let g:ale_fixers = {
    \   'python': ['autopep8']
    \}

" vim-gitgutter
if exists('&signcolumn')
    set signcolumn=yes
else
    let g:gitgutter_sign_column_always = 1
endif

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
