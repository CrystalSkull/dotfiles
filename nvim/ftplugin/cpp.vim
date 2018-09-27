let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra -Wpedantic -I third-party -I third-party/benchmark/include'
let g:ale_cpp_gcc_options =   '-std=c++17 -Wall -Wextra -Wpedantic -I third-party -I third-party/benchmark/include'
let b:ale_linters = ['clang', 'clangcheck' , 'clangtidy', 'gcc']
let b:ale_fixers = ['clang-format']
