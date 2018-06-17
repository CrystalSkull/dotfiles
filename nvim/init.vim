call plug#begin()
" Nice defaults
Plug 'tpope/vim-sensible'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Linting
Plug 'w0rp/ale'

" vim keybindings for tmux navigation
Plug 'christoomey/vim-tmux-navigator'

Plug 'jiangmiao/auto-pairs'

" color scheme
Plug 'ajh17/Spacegray.vim'

" javascript
Plug 'pangloss/vim-javascript'
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
" TAB auto complete
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : deoplete#manual_complete()

" Show types of JS auto complete suggestions
let g:deoplete#sources#ternjs#types = 1

let g:ale_fix_on_save = 1

" Fuzzy find
map <c-p> :FZF<CR>

" Tab as 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Hide search highlight on espace
nnoremap <ESC> :noh<CR>
