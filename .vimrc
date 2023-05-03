" Set the current line number
set number
" Set the minimum width of the number displaying the current line
set numberwidth=1
" Set all rows number
set ruler
" Display line numbers relative to the current cursor position
set relativenumber

" Enable mouse support
set mouse=a

" Enable normaly copy-paste and also every deleted or yanked text is copied to
" the clipboard
set clipboard=unnamed

" Enable syntax highlighting
syntax enable

" Set the encoding of the text files being edited to UTF-8
set encoding=utf-8

" Highlight the matching bracket or parenthesis when the cursor is positioned over one
set showmatch

" Set the number of spaces that are used for each level of indentation
set sw=2

" Turn off all bell notifications
set belloff=all

" Change the color of line 80
set colorcolumn=89
" Highligh the current line where the cursor is located
set cursorline

" Set the status line to always be displayed at the bottom
set laststatus=2


" Highlight all Python syntax items
let python_highlight_all=1

" Plugins
call plug#begin('~/.vim/plugged')

" Color scheme / Theme
Plug 'morhetz/gruvbox'

" IDE
" Tree-like file explorer
Plug 'scrooloose/nerdtree'

" ??
Plug 'christoomey/vim-tmux-navigator'

" Real-time code completion suggestions
Plug 'Valloric/YouCompleteMe'

" Add a status line and raphical elements such as symbols
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Select the same word multiple times (like Sublime ctrl-d)
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Expand abbreviations (E.g. type h1 and expand it to <h1></h1>)
Plug 'mattn/emmet-vim'

" Syntax check
Plug 'vim-syntastic/syntastic'

" Flake8 check
Plug 'nvie/vim-flake8'

" Code formatter for a lot of languages
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Code formatter for Python
Plug 'psf/black', { 'branch': 'stable' }

" Navigate to specific parts of the text by highlighting characters or
" patterns
Plug 'easymotion/vim-easymotion'

" Navigate and search for files (like vscode ctrl + p)
Plug 'kien/ctrlp.vim'

" Undo history visualizer
Plug 'mbbill/undotree'

" Search for certain text in files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Add icons in the file tree
Plug 'ryanoasis/vim-devicons'
" Add color to devicons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Add closing pair for brackets, quotes and other characters
Plug 'jiangmiao/auto-pairs'

call plug#end()

let mapleader=" "

" Easily save and quit files
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Easily copy text from where the cursor is, onwards
nnoremap Y y$

" Center the screen after jumping to the next match
nnoremap n nzzzv
nnoremap N nzzzv

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u

" Add quotes around visual selection
noremap ' <esc>`>a'<esc>`<i'<esc>
noremap " <esc>`>a"<esc>`<i"<esc>
" Add brackets around visual selection
noremap [ <esc>`>a]<esc>`<i[<esc>
" Add parentheses around visual selection
noremap ( <esc>`>a)<esc>`<i(<esc>
" Add curly braces around visual selection
noremap { <esc>`>a}<esc>`<i{<esc>
" Add Python print statement around visual selection
noremap º <esc>`>a)<esc>`<iprint(<esc>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Make the cursor thiner in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" gruvbox
" Set which color scheme to use
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

" nerdtree
" Open file explorer
nmap <Leader>nt :NERDTreeFind<CR>
" Close the file explorer window as soon as opening a file
let NERDTreeQuitOnOpen=1
" Ignore files/paths
let NERDTreeIgnore=["__pycache__"]

" ctrlp
" Ignore node_modules when using ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|venv'

" Activate easymotion
nmap <Leader>s <Plug>(easymotion-s2)

" Jump to definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" undotree
" Open undo history visualizer
nnoremap <leader>u :UndotreeShow<CR>

" Emmet 
" main key, double press that key to expand
let g:user_emmet_leader_key=','

" vim-prettier 
" configurations
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'

" Black
" run Black on save
autocmd BufWritePre *.py execute ':Black'
nnoremap <Leader>b :Black<CR>

" Flake8
let g:flake8_ignore="E203"
let g:flake8_ignore="E501"

" Fugitive
nmap <Leader>Gd :Git diff<CR>
nmap <Leader>Gs :Gdiffsplit<CR>

" fzf
" start fzf
nmap <Leader>f :Rg<CR>

