"""""""""""""""""""""""""""""""""""界面配置"""""""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        "set guifont=WenQuanYi\ Zen\ Hei\ Mono:style=Medium\ 11
        " set guifont=Liberation\ Mono:style=Medium\ 12
        " set guifont=Monospace\ 12
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" 主题配置 solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" 配色方案
set background=dark
set t_Co=256
colorscheme solarized
"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" 总是显示状态栏
set laststatus=2
" 状态行高度为2(默认为1)
set cmdheight=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
""在状态栏显示正在输入的命令
set showcmd"
set winwidth=79
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set shortmess=atI
"""""""""""""""""""""""""""""""""""使用Vundle安装管理插件""""""""""""""""""""
"插件配置和具体设置在vimrc.bundles中
" 开启语法高亮
syntax on

" install Vundle bundles
if filereadable(expand("$HOME/.vim/vimrc.bundles"))
    source $HOME/.vim/vimrc.bundles
endif

"""""""""""""""""""""""""""""""""""""常用功能设置""""""""""""""""""""""""""""
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
" 关闭文件类型侦测
filetype off
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
"required by Vundle
filetype plugin indent on
" 取消换行。
set nowrap
" 开启实时搜索功能
set incsearch
set hlsearch
" 搜索时大小写敏感
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 关闭兼容模式
set nocompatible
" Remember info about open buffers on close"
set viminfo^=%
"backspace设置
set backspace=eol,start,indent
" vim 自身命令行模式智能补全
set wildmenu
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 历史记录数
set history=1000
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace"
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 设置当文件被改动时自动载入
set autoread
"自动保存
set autowrite
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"""""""""""""""""""""""""""""""""""""快捷键设置"""""""""""""""""""""""""""""""定义快捷键的前缀，即<Leader>
let mapleader=","
let g:mapleader=","
"使用:代替:
nnoremap ; :
vnoremap ; :
"可视模式下移动设定
vnoremap < <gv
vnoremap > >gv
"以sudo权限写入文件
cmap w!! w !sudo tee % >/dev/null
"定以快捷键到行首和行尾
nmap <Leader>a 0
nmap <Leader>e $
" 使用左右方向键进行buffer跳转
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>
"使用方向键来进行buffer跳转
noremap <left> :bp<CR>
noremap <right> :bn<CR>
noremap <Up> :tabprev<CR>
noremap <Down> :tabnext<CR>
" map <Leader>n :tabnext<cr>
" map <Leader>p :tabprev<cr>
" 新建tab  Ctrl+t
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
"映射按键：剪切版、全选
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+gP
vmap <C-v> "+gP
nmap <C-a> ggVG
" 快速选中段落
nnoremap <Leader>v V`}
inoremap <c-q> <ESC>
"上下移动时移动折行
noremap j gj
noremap k gk
"定义快捷保存文件
nmap <Leader>w :w<CR>
"保存并退出文件
nmap <Leader>q :wq<CR>
"不保存，直接退出
nmap <Leader>Q :qa!<CR>
"窗口跳转设置
" 跳转至右边的窗口
nnoremap <c-l> <c-w>l
" 跳转至左边的窗口
nnoremap <c-h> <c-w>h
" 跳转至上方的子窗口
nnoremap <c-k> <C-W>k
" 跳转至下方的子窗口
nnoremap<c-j> <C-W>j
"快速打开目录，需安装nerdtree
nnoremap <F2> :NERDTreeTabsToggle<CR>
"定义<F3>用于开启/关闭行号
nnoremap <F3> :call HideNumber()<CR>
"按<F5>运行当前代码，CompileRun()在下文定义
map <F5> :call CompileRun()<CR>
"快速格式化代码，FormartSrc()在文件后面定义
map <F6> :call FormartSrc()<CR><CR>
"tagbar快捷键，需安装tagbar插件
nmap <F8> :TagbarToggle<CR>
"设置进入粘贴模式快捷键
set pastetoggle=<F10>
au InsertLeave * set nopaste
"打开最近编辑过的文件，依赖插件ctrlp
nnoremap <Leader>f :CtrlPMRUFiles<CR>
"进入对应的filetype编辑，依赖插件ultisnips
map <Leader>us :UltiSnipsEdit<CR>
"快速跳转，依赖插件easymotion
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
"查看文件编辑历史状态，依赖插件gundo
nnoremap <Leader>h :GundoToggle<CR>
"""""""""""""""""""""""""""""""""""""其他配置"""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

        "    elseif &filetype == 'mkd'
        "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "  > Author: ")
        call append(line(".")+2, "  > Mail: ")
        call append(line(".")+3, "  > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""""""""格式化代码""""""""""""""""""""""""""""
"代码格式优化化

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

"快速运行当前代码
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
        exec "!rm ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
        exec "!rm ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
        exec "!rm ./%<.class"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!chrome % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd' "MarkDown 解决方案为VIM + Chrome浏览器的MarkDown Preview Plus插件，保存后实时预览
        exec "!chrome % &"
    elseif &filetype == 'javascript'
        exec "!time node %"
    elseif &filetype == 'coffee'
        exec "!time coffee %"
    elseif &filetype == 'ruby'
        exec "!time ruby %"
    endif
endfunc

"高亮某些关键字
if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
endif

""为方便复制，开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
