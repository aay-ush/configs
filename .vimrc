set ai	" auto indenting on.
set smartindent
set copyindent " Copy previous indent on autoindent.

set showmatch " automatically show matching brackets.
set vb " turn on Visual Bell
set laststatus=2	" Make the last line 2 lines deep.
set showmode	" Show Current Mode on
syntax on 	" turn on syntax highlight
set number	" turn on lie numbers

" Change leader
:let mapleader = ","

" Better escape from insert mode:
:vnoremap jk <Esc>
:onoremap jk <Esc>
:noremap! jk <ESc>

" Use jk for wrapped lines
:nnoremap j gj
:nnoremap k gk

" Ctrl-jk for tab movement
:nnoremap <C-j> :tabnext<CR>
:inoremap <C-j> :tabnext<CR>
:nnoremap <C-k> :tabprevious<CR>
:inoremap <C-k> :tabprevious<CR>
:nnoremap <C-t> :tabnew<CR>
:inoremap <C-t> :tabnew<CR>

" Toggle folds
set foldenable	" enable folding
:nnoremap <Space> za
:vnoremap <Space> za

" Search easy
:set ignorecase

" Tab options
set smarttab	" insert tabs on start of line according to shiftwidth, instead of tabstop.
set tabstop=4
set softtabstop=4 " hitting backspace removes 4 spaces.
set expandtab	" expand tabs by default'
set shiftwidth=4 " number of spaces for autoindent.

" Search highlighting
set incsearch
set hlsearch
:map <silent> <leader><space> : noh<cr>

"Colorscheme
set background=dark
"colorscheme <colorscheme>

" Quick edit/load vimrc
:nnoremap <leader>ev : vsplit ~/.vimrc<cr>
:nnoremap <leader>sv : source ~/.vimrc<cr>

" Show hidden chars
set list
" Set hidden chars to use based on file encoding
if &l:encoding ==? "latin1"
    set showbreak='^'
    set listchars=tab:\|>,space:~,nbsp:.,trail:_,extends:>,precedes:<
else
    set showbreak=↪\ 
    set listchars=tab:\|→,space:·,nbsp:␣,trail:•,extends:→,precedes:←
endif
" Cursor line
"set cursorline
"hi clear CursorLine
"hi CursorLine cterm=underline ctermbg=black ctermfg=gray gui=underline
"guibg=black guifg=gray"


