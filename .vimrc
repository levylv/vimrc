"Wei Lyu
"levy_lv@hotmail.com
"levylv.github.io

"===================="
"        通用        "
"===================="
set nocompatible              " be iMproved, required
filetype plugin indent on
set nobackup "不备份 
set autochdir "自动切换当前目录
set mouse=a

"启动，语法高亮，配色
winpos 500 200   "窗口位置
set lines=30 columns=85  "窗口大小
set guioptions-=T  "不要菜单栏
set laststatus=2   "总是显示状态栏
set hlsearch  "搜索高亮
set ignorecase "搜索忽略大小写
syntax enable
syntax on
set t_Co=256
set cursorline "高亮光标行
set ruler   "显示光标位置状态栏
set number
set guifont=Ubuntu\ Mono\ 13
colorscheme molokai
set clipboard=unnamed "可以用系统剪贴板

"Tab相关
set expandtab "制表符扩展为空格
set tabstop=4 "制表符占用空格数
set softtabstop=4 "将连续数量的空格视为一个制表符
set shiftwidth=4 "格式化时制表符占用空格数
set cindent
set autoindent

"编码相关
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"使用CTRL+[hjkl]在窗口间导航"
map <C-c> <C-W>c
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"使用箭头导航buffer"
map <right> :bn<cr>
map <left> :bp<cr>
set autowrite "在切换buffer时自动保存当前的文件

""使用ALT+[jk]来移动行内容
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"根据文件类型做不同处理
function HeaderPython()  "python加头注释
    call setline(1, "#!/usr/bin/env python3")
    call append(1,  "# -*- coding: utf-8 -*-")
    call append(2,  "# mail:levy_lv@hotmail.com")
    call append(3,  "# Wei Lyu@ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

function HeaderBash()  "shell脚本加注释
    call setline(1, "#!/bin/bash")
    call append(1,  "# -*- coding: utf-8 -*-")
    call append(2,  "# mail:levy_lv@hotmail.com")
    call append(3,  "# Wei Lyu@ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.sh call HeaderBash()

function HeaderCpp() "C++文件加头文件
    call setline(1, "#include <iostream>")
    call append(1, "using namespace std;")
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.cpp,*.cc call HeaderCpp()

"C,C++单个文件调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

"===================="
"Vundle Configuration"
"===================="
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugin here:

" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'
Plugin 'luochen1990/rainbow'
"Plugin 'majutsushi/tagbar'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"==========================="
"Vundle Plugin Configuration"
"==========================="

"Rainbow
let g:rainbow_active = 1 " 0 if you want to enable it later via: RainbowTogglw

"Tagbar
"nmap <F8> :TagbarToggle<CR>

"YouCompleteMe
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
nnoremap <F5> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_autoclose_preview_window_after_completion = 1  " 补全后自动关闭preview

"minibufexpl
let g:miniBufExplMapWindowNavVim = 1 "可以用<C-h,j,k,l>切换到上下左右的窗口 
let g:miniBufExplMapCTabSwitchBufs = 1 "<C-Tab>,<C-S-Tab>切换
let g:miniBufExplModSelTarget = 1 

"NERDTree
nnoremap <F4> :NERDTreeToggle<CR>
