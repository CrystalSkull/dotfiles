let g:ale_cpp_clang_options = '-I third-party'
let g:ale_cpp_gcc_options = '-I third-party'
let b:ale_linters = ['clang', 'clangcheck' , 'clangtidy', 'gcc']
let b:ale_fixers = ['clang-format']
