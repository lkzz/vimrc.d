" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
" }

" Use bundles config {
    if filereadable(expand("~/.vim/vimrc.bundles"))
        source ~/.vim/vimrc.bundles
    endif
" }

" General {
    "language
    set langmenu=zh_CN.UTF-8
    set helplang=cn
    set iskeyword+=.
    set termencoding=utf-8
    set encoding=utf8
    set fileencodings=utf8,gbk,gb2312,gb18030
    filetype off         " Disable file type detect
    filetype plugin on   " Load different plugin according to file type
    filetype indent on   " load indent file according to file type
    set viminfo^=%       " Remember info about open buffers on close"
    set backspace=eol,start,indent "set backspace
    set cindent
    set smarttab        " Use tab at the begining of line
    set history=1000    " history setting
    set noeb            " disable alert
    set confirm         " popup confirm window if file is read only
    set nobackup        " disable generate backup file
    set noswapfile
    set whichwrap+=<,>,h,l  " 允许backspace和光标键跨越行边界
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace"
    " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
    set mouse=a
    set selection=exclusive
    set selectmode=mouse,key
    set report=0        " 通过使用: commands命令，告诉我们文件的哪一行被改变过
    set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
    set autoread        " auto reload
    set autowrite       " auto save
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
" }

" Vim UI {

    if  filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme
    endif
    set background=dark
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set cmdheight=2             " Set cmd window hight
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif


    if has('statusline')
        set laststatus=2

        set showcmd
        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    syntax enable                   " syntax highlight
    set cursorline                  " Highlight current line
    set cursorcolumn                " Highlight current column
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set matchtime=1                 " Set show match time
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24

        if LINUX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        elseif OSX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif WINDOWS() && has("gui_running")
            set guifont=Andale_Mono:h12,Menlo:h12,Consolas:h12,Courier_New:h12
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set matchpairs+=<:>             " Match, to be used with %
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.before.local file:
    "   let g:spf13_keep_trailing_whitespace = 1
    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    "autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now.

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell,rust setlocal nospell

" }


" Key (re)Mappings {
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
"}


" Functions {

    " Initialize directories {
        function! InitializeDirectories()
            let parent = $HOME
            let prefix = 'vim'
            let dir_list = {
                        \ 'backup': 'backupdir',
                        \ 'views': 'viewdir',
                        \ 'swap': 'directory' }

            if has('persistent_undo')
                let dir_list['undo'] = 'undodir'
            endif

            " To specify a different directory in which to place the vimbackup,
            " vimviews, vimundo, and vimswap files/directories, add the following to
            " your .vimrc.before.local file:
            if exists('g:spf13_consolidated_directory')
                let common_dir = g:spf13_consolidated_directory . prefix
            else
                let common_dir = parent . '/.' . prefix
            endif

            for [dirname, settingname] in items(dir_list)
                let directory = common_dir . dirname . '/'
                if exists("*mkdir")
                    if !isdirectory(directory)
                        call mkdir(directory)
                    endif
                endif
                if !isdirectory(directory)
                    echo "Warning: Unable to create backup directory: " . directory
                    echo "Try: mkdir -p " . directory
                else
                    let directory = substitute(directory, " ", "\\\\ ", "g")
                    exec "set " . settingname . "=" . directory
                endif
            endfor
        endfunction
        call InitializeDirectories()
    " }

    " Initialize NERDTree as needed {
        function! NERDTreeInitAsNeeded()
            redir => bufoutput
            buffers!
            redir END
            let idx = stridx(bufoutput, "NERD_tree")
            if idx > -1
                NERDTreeMirror
                NERDTreeFind
                wincmd l
            endif
        endfunction
    " }

    " Strip whitespace {
        function! StripTrailingWhitespace()
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endfunction
    " }

    " Shell command {
        function! s:RunShellCommand(cmdline)
            botright new

            setlocal buftype=nofile
            setlocal bufhidden=delete
            setlocal nobuflisted
            setlocal noswapfile
            setlocal nowrap
            setlocal filetype=shell
            setlocal syntax=shell

            call setline(1, a:cmdline)
            call setline(2, substitute(a:cmdline, '.', '=', 'g'))
            execute 'silent $read !' . escape(a:cmdline, '%#')
            setlocal nomodifiable
            1
        endfunction

        command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
        " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
        " }

" }
