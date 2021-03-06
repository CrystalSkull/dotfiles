call plug#begin()
" Nice defaults
Plug 'tpope/vim-sensible'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'

" TAB completion
Plug 'ervandew/supertab'

" Linting
Plug 'w0rp/ale'

" vim keybindings for tmux navigation
Plug 'christoomey/vim-tmux-navigator'

Plug 'jiangmiao/auto-pairs'

" color scheme
Plug 'ajh17/Spacegray.vim'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" c++
" switch between headers and source files
Plug 'vim-scripts/a.vim'


call plug#end()

" color scheme
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 1
colorscheme spacegray

" Enable auto complete at startup
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'
" let's do without this one for now, apparently slow
"let g:deoplete#sources#clang#clang_complete_database = 'build/compile_commands.json'

" Show types of JS auto complete suggestions
let g:deoplete#sources#ternjs#types = 1

let g:ale_fix_on_save = 1
map <leader>d :ALEDetail<cr>

" javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" Fuzzy find
map <c-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files'

" Tab as 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Hide search highlight on espace
nnoremap <ESC> :noh<CR>

" Better searching
set ignorecase
set smartcase

" Save undos
set undodir=$HOME/.config/nvim/undo
set undofile

" Line number
set relativenumber
set number
