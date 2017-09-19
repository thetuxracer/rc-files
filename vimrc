" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)


" For plugins to load correctly
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
" NERDTree
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" Syntax checking, ruby
Plugin 'vim-syntastic/syntastic'
Plugin 'ngmy/vim-rubocop'
" Statusbar beautification
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'tpope/vim-cucumber'
Plugin 'easymotion/vim-easymotion'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-markdown'
"Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'Chiel92/vim-autoformat'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Turn on syntax highlighting
syntax on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
set mouse=a

" Cursor motion
" EVIL MODE ^(.)^
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2
let g:airline_powerline_fonts=1

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip
set cursorline

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme solarized
let g:airline_theme='solarized'

" NERDTree settings
autocmd TabEnter * :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
autocmd BufEnter * NERDTreeMirror
nmap ,n :NERDTreeFind<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" Syntastic + Rubocop settings
" for ruby syntax checking
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'
let g:syntastic_ruby_mri_exec = '~/.rbenv/shims/ruby'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_enable_ruby_rubocop_checker = 1
let g:vimrubocop_keymap = 0
nmap <Leader>r :SyntasticCheck rubocop<CR>

" ctrlp settings
let g:ctrlp_custom_ignore = 'vendor/bundle'

" vim-autoformat settings
let g:formatdef_rubocop_rb = '"rubocop --auto-correct"'
let g:formatters_ruby = ['rubocop_rb']
noremap <leader>f :Autoformat<CR>

" Easymotion settings
let g:EasyMotion_smartcase = 1

" Easy sourcecode navigation
" with ctags
set tags=.git/tags
