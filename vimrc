syntax on

set encoding=utf-8
set nocompatible
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//


set mouse=a

filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim



"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


"------------ UTLITIES ------------------------

" Nerd tree
Plugin 'scrooloose/nerdtree'


" @depreciated not even sure I use it 
Plugin 'jistr/vim-nerdtree-tabs'

" Adds nice icons to vim
" First install https://github.com/ryanoasis/nerd-fonts#option-7-unofficial-arch-user-repository-aur
"Plugin 'ryanoasis/vim-devicons'

" These need to be tested
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'

"------------------ CODE ---------------------------
" Code formating 
" Plug 'sbdchd/neoformat' testing this to see if works

" PHP Support
Plugin 'phpvim/phpcd.vim'
Plugin 'tobyS/pdv'
Plugin 'shawncplus/phpcomplete.vim'
Bundle 'm2mdas/phpcomplete-extended'


" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
"Plugin 'jaxbot/github-issues.vim'
Plugin 'airblade/vim-gitgutter'


" Markdown / Writing
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'


" Drupal
Plugin 'https://git.drupal.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}


" Theme / Interface
Plugin 'AnsiEsc.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'junegunn/limelight.vim'
Plugin 'mkarmona/colorsbox'
Plugin 'romainl/Apprentice'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'AlessandroYorba/Sierra'
Plugin 'daylerees/colour-schemes'
Plugin 'effkay/argonaut.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'colepeters/spacemacs-theme.vim'


" Twig
Plugin 'nelsyeung/twig.vim'


" Css
Plugin 'flazz/vim-colorschemes'
Plugin 'shmargum/vim-sass-colors'


" Html5
Plugin 'othree/html5.vim'



" Javascript
Plugin 'kchmck/vim-coffee-script'
Plugin 'jelera/vim-javascript-syntax' 
Plugin 'ternjs/tern_for_vim'

call vundle#end()  
"-------------- PLUGINS END --------------------
filetype plugin indent on



"----- GENERAL SETTINGS-------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


"---------NERD-TREE SETTINGS----------

"Open in current directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" @depreciated Opens and close nerd tree
"nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" Opens on start up
let g:nerdtree_tabs_open_on_console_startup = 1


" Hilights Nerd  tree panel 
map <C-n> :NERDTreeToggle<CR>




"-------- SYNTASTIC SETTINGS---------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END


"-------- TAGS SETTINGS --------------------------------
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:tagbar_autoclose=2

nmap <silent> <leader>b :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1


"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2




"----------- Drupal  --------------
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on



"----------- LOADS NERD TREE INTO CURRENT DIR  --------------


"----------- LOADS PHP COMPLETE  --------------
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"----------- HOT KEYS --------------

"Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+


"Tabs
nmap <Left> gT
nmap <Right> gt
nmap <UP> :Te
nmap <DOWN> :vsp

