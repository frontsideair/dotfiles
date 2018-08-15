set nocompatible                " choose no compatibility with legacy vi
syntax enable                   " syntax highlighting
set encoding=utf-8
set showcmd                     " display incomplete commands
set number                      " show line numbers
set hidden                      " switch buffer without saving
set history=1000                " it's good to have a large command history
set wildmode=longest,list       " wild mode completion, complete longest match, list others
set laststatus=2
set backupcopy=yes
set autoread                    " automatically load file if changed
set noswapfile                  " i hate swap files

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Remapping
nnoremap <leader><leader> <c-^> " set double-leader to prev-next file
nnoremap <esc><esc> :nohlsearch<CR>
nnoremap Q gq
nnoremap <leader>f :FlowType<CR>

"" Navigation overrides
"" nnoremap <left> <nop>
"" nnoremap <right> <nop>
"" nnoremap <up> <nop>
"" nnoremap <down> <nop>
"" nnoremap jk <ESC>
"" inoremap <left> <nop>
"" inoremap <right> <nop>
"" inoremap <up> <nop>
"" inoremap <down> <nop>
inoremap jk <ESC>
"" vnoremap <left> <nop>
"" vnoremap <right> <nop>
"" vnoremap <up> <nop>
"" vnoremap <down> <nop>
vnoremap jk <ESC>
"" inoremap <ESC> <nop>

" anytime ‘lorem’ is typed in, replace it with placeholder text
abbr lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a ornare metus. In justo metus, auctor nec semper in, laoreet porttitor augue. Maecenas tortor libero, dignissim vel placerat sit amet, malesuada ut quam. Curabitur vitae velit lacus, sed imperdiet sapien. Sed posuere, odio nec pharetra adipiscing

"" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'hallison/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'LnL7/vim-nix'
Plug 'lambdatoast/elm.vim'
Plug 'flowtype/vim-flow'
Plug 'myusuf3/numbers.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'altercation/vim-colors-solarized'

""Bundle 'cypok/vim-sml'
""Bundle 'roman/golden-ratio'
""Bundle 'mileszs/ack.vim'
""Bundle 'scrooloose/syntastic'
""Bundle 'vim-scripts/closetag.vim'

call plug#end()

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

let g:prettier#autoformat = 1
autocmd BufWritePre *.js PrettierAsync

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'javascript.jsx': ['flow-language-server', '--stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
