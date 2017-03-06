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
" automaticly close paranthesis and so on
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
let $FZF_DEFAULT_COMMAND='ag -g ""'

NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'

NeoBundle 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/.notes/vim-wiki', 'syntax': 'markdown', 'ext': '.md'}]

NeoBundle 'rhysd/vim-clang-format'
let g:clang_format#style_options = {"Standard" : "C++11"}
" auto format on buffer save
" let g:clang_format#auto_format = 1

NeoBundle 'neomake/neomake'
" cpp compiler and arguments for neomake
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-Wpedantic"]
let g:neomake_javascript_enabled_makers = ['eslint']
" run neomake on every buffer write
autocmd! BufWritePost * Neomake

" Used to browse buffers
" Default keybind <leader>b
NeoBundle 'jeetsukumaran/vim-buffergator'

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
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
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
