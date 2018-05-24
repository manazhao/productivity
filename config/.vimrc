set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
Plugin 'tomlion/vim-solidity'
Plugin 'Valloric/YouCompleteMe'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Plugin 'maksimr/vim-jsbeautify'
Plugin 'leafgarland/typescript-vim'
Plugin 'lepture/vim-jinja'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="Horizontal"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<Ctrl-Shift-Right>"
" let g:UltiSnipsJumpForwardTrigger="<Ctrl-Shift-Up>"
" let g:UltiSnipsJumpBackwardTrigger="<Ctrl-Shift-Down>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="Horizontal"
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
"Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
filetype plugin indent on    " required

"Theme related settings.
set expandtab
set tabstop=2
set shiftwidth=2

set nu
set cc=80
set textwidth=80
" automatically save before leaving a modified buffer.
set autowrite
" display buffer list and prompt to select by number.
nnoremap <F5> :buffers<CR>:buffer<Space>
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
set runtimepath^=~/.vim/bundle/ctrlp.vim
set autoread
set cursorline

" key map for switching between windows
" set your own personal modifier key to something handy

" use ,v to make a new vertical split, ,s for horiz, ,x to close a split
noremap <leader>v <c-w>v<c-w>l
noremap <leader>s <c-w>s<c-w>j
noremap <leader>q <c-w>c<c-w>j
noremap <leader>x :Sex<cr>
noremap <leader>qq <c-w>q
noremap <leader>ef :FormatCode<cr>
noremap <leader>w :wa<cr>
map <leader>wj <c-w>j
map <leader>wk <c-w>k
map <leader>wl <c-w>l
map <leader>wh <c-w>h
vmap s :sort<cr>
vmap <c-c> "+y
