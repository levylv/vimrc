"Lv Wei
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
winpos 0 0   "窗口位置
set lines=250 columns=95  "窗口大小
set guioptions-=T  "不要菜单栏
set laststatus=2   "总是显示状态栏
set hlsearch  "搜索高亮
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

"omnicomplete
set completeopt=longest,menu " 关掉智能补全时的预览窗口

" 生成c++的tags,智能补全自己定义的类for omnicppcomplete插件
"nmap <silent> <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

"根据文件类型做不同处理
function HeaderPython()  "python加头注释
    call setline(1, "#!/usr/bin/env python")
    call append(1,  "# -*- coding: utf-8 -*-")
    call append(2,  "# Lv Wei @ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

function HeaderBash()  "shell脚本加注释
    call setline(1, "#!/bin/bash")
    call append(1,  "# Lv Wei @ " . strftime('%Y-%m-%d', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.sh call HeaderBash()

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
Plugin 'majutsushi/tagbar'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'suan/vim-instant-markdown'
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
nmap <F8> :TagbarToggle<CR>

"YouCompleteMe
nnoremap <F5> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'



"omnicppcomplete for C++全能补全,系统自带的模式无C++补全,故需下载插件
"let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
"let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
"let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
"let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
"let OmniCpp_ShowAccess=1 

""vim-instant-markdown
"let g:instant_markdown_slow = 0
"let g:instant_markdown_autostart = 0

"minibufexpl
let g:miniBufExplMapWindowNavVim = 1 "可以用<C-h,j,k,l>切换到上下左右的窗口 
let g:miniBufExplMapCTabSwitchBufs = 1 "<C-Tab>,<C-S-Tab>切换
let g:miniBufExplModSelTarget = 1 

"NERDTree
nnoremap <F4> :NERDTree<CR>




