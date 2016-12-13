set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" 方便查看git commit信息
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"find file"
Plugin 'kien/ctrlp.vim'
"php syntax check
Plugin 'joonty/vim-phpqa'
"自动补全
Plugin 'AutoComplPop'
"批量注释代码
Plugin 'tomtom/tcomment_vim'
"自动生成注释
Plugin 'PDV--phpDocumentor-for-Vim'
""括号、引号自动补全
Plugin 'raimondi/delimitmate'
"代码查找
" Plugin 'dyng/ctrlsf.vim'
"类似于Sublime的ctrl+d,重构代码很有用
Plugin 'terryma/vim-multiple-cursors'

Plugin 'mattn/emmet-vim'
" Plugin 'spf13/vim-autoclose'
""Plugin 'sirver/ultisnips'
""Plugin 'tobyS/pdv'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
syntax on
""set foldmethod=indent
""au BufWinLeave * silent mkview  " 保存文件的折叠状态
""au BufRead * silent loadview    " 恢复文件的折叠状态
set nocompatible
set number
set autoindent
set mouse=a
set hls
set incsearch
set clipboard=unnamed
set shiftwidth=4
set ts=4
set ruler
set mousehide
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set visualbell
set cursorline
set cursorcolumn
set showcmd

autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.less set filetype=css
" 方便阅读代码
nnoremap j jzz
nnoremap k kzz
""""""""""""""""""""""""设置新文件头注释""""""""""""""""""""""""""""""""""
func! SetTitle()
     if &filetype=='php'
            call append(0 ,"<?php")
                call append(1,"/*")
            call append(2,"* @Title")
            call append(3,"* @Author    JiangyaoFeng")
            call append(4,"* @Date      ".strftime("%c"))
                call append(5,"*/")
         endif
         autocmd BufNewFile * mormal G
endfunc
autocmd BufNewFile *.php exec ":call SetTitle()"
"""""""""""""""""""""""""手动设只文件头部注释""""""""""""""""""""""""""""

""Ctrl-Left or Ctrl-Right to go to the previous or next tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
""diable autocheck for phpqa
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
" PHP documenter script bound to Control-P
autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR>
:imap jj <Esc>

""autocmd BufWritePre * :%s/\s\+$//e}
autocmd BufRead,BufNewFile *.php setlocal spell
"配置文件修改后自动重新载入使生效"
autocmd! bufwritepost .vimrc source ~/.vimrc
"设置重新载入.vimrc快捷键"
map <silent> <leader>ss :source ~/.vimrc<cr>
"设置快速编辑.vimrc快捷键"
map <silent> <leader>ee :e ~/.vimrc<cr>
