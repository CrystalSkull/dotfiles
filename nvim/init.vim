let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


"NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=/home/simon/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/simon/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
" automatically close parentheses and so on
NeoBundle 'jiangmiao/auto-pairs'

NeoBundle 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1

NeoBundle 'ervandew/supertab'

NeoBundle 'junegunn/fzf', {
      \ 'directory' : 'fzf',
      \ 'name' : 'fzf',
      \ 'regular_name' : 'fzf',
      \ }
map <c-p> :FZF<cr>
let $FZF_DEFAULT_COMMAND='rg --files'

NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'

NeoBundle 'rhysd/vim-clang-format'
let g:clang_format#style_options = {"Standard" : "C++11"}
" auto format on buffer save
" let g:clang_format#auto_format = 1

NeoBundle 'neomake/neomake'
" cpp compiler and arguments for neomake
let g:neomake_c_enable_markers=['gcc']
let g:neomake_c_gcc_args=['-ansi', '-pedantic', '-Wall', '-Wextra']
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-Wpedantic"]
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_args= ['--fix']
" run neomake on every buffer write
autocmd! BufWritePost * Neomake

" Used to browse buffers
" Default keybind <leader>b
NeoBundle 'jeetsukumaran/vim-buffergator'

NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
let g:airline_powerline_fonts = 1

NeoBundle 'lervag/vimtex'

" Javascript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundleLazy 'flowtype/vim-flow', {
            \ 'autoload': {
            \     'filetypes': 'javascript'
            \ }}
NeoBundle 'carlitux/deoplete-ternjs', { 'build': { 'mac': 'npm install -g tern', 'unix': 'npm install -g tern' }}

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax on

set relativenumber
set number
set smartindent

set softtabstop=0 expandtab
set tabstop=2
set shiftwidth=2
set smarttab

set ignorecase
set smartcase

set tags+=./.tags

set undodir=$HOME/.config/nvim/undo
set undofile

" Use ESC to remove highlight from search
nnoremap <silent> <Esc> :nohlsearch<CR>:echo<CR>

" webpack only notices file changes with this setting
autocmd FileType javascript,javascript.jsx set backupcopy=yes

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

let g:tex_flavor = "latex"
autocmd FileType tex nnoremap <buffer> j gj
autocmd FileType tex nnoremap <buffer> k gk
autocmd FileType tex setlocal spell
autocmd BufRead COMMIT_EDITMSG setlocal spell
autocmd BufNewFile,BufRead *.md,*.tex set spell spelllang=en_us
