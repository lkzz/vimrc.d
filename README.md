vim 配置说明
=======================

> 主要参考[wklken的配置](https://github.com/wklken/k-vim)

---------------------------------

# 截图

solarized主题

![solarized](https://github.com/wklken/gallery/blob/master/vim/solarized.png?raw=true)

molokai主题

![molokai](https://github.com/wklken/gallery/blob/master/vim/molokai.png?raw=true)

---------------------------------

---------------------------------

# 安装步骤

1. clone到本地,配置到linux个人目录（如果是从linux_config过来的，不需要clone）

        git clone https://github.com/vim-configs.git

2. 安装依赖包

        2.1 系统依赖

        # ubuntu
        sudo apt-get install ctags
        sudo apt-get install build-essential cmake python-dev  #编译YCM自动补全插件依赖

        # centos
        sudo yum install python-devel.x86_64
        sudo yum groupinstall 'Development Tools'

        # mac
        #brew install ctags


        2.2 使用Python
        sudo pip install pyflakes
        sudo pip install pylint
        sudo pip install pep8

        2.3 使用Javascript
        # 安装jshint和jslint,用于javascript语法检查
        # 需要nodejs支持,各个系统安装见文档 https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

        #ubuntu
        sudo apt-get install nodejs npm
        sudo npm install -g jslint
        sudo npm install jshint -g

        #mac
        brew install node
        npm install jshint -g
        npm install jslint -g



3. 安装

        3.1 进入目录
        cd vim-configs/

        3.2 执行安装
        # 会进入安装插件的列表，一一安装是从github clone的，完全取决于网速, 之后会自动编译 YCM, 编译失败的话需要手动编译, 见第4步

        sh -x install.sh


4. 可能遇到的问题:


    - 编译自动补全YouCompleteMe(耗时略长, 但绝对值得)


            cd ~/.vim/bundle/YouCompleteMe
            ./install.sh --clang-completer


    有任何问题见YCM[文档](https://github.com/Valloric/YouCompleteMe)

    这个插件需要Vim 7.3.584,所以,如果vim版本太低,需要[编译安装](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)


    - Go语言不能自动补全/tagbar

    依赖 [gotags](https://github.com/jstemmer/gotags)和 [gocode](https://github.com/nsf/gocode), 需要安装配置好, 并-> `$GOPATH` -> `$PATH`, `which`命令能正确返回

        which gotags
        which gocode
    - Javascript不能自动补全
    `vimrc.bundles`中`marijnh/tern_for_vim`默认没有打开, 需要打开安装插件, 需要依赖nodejs&npm, 具体见文档 [tern_for_vim](https://github.com/marijnh/tern_for_vim)

    - Macvim

            安装最新mac vim ,可以正常打开

            需要sudo
            mv /usr/bin/vim /usr/bin/vim.bk
            ln -s /usr/local/bin/mvim /usr/bin/vim

            在.bashrc/.bash_profile中加入
                alias vi='mvim -v'
                alias vim='mvim -v'


    - 其他问题: 键位/展现等存在问题, 使用`二分法`缩小范围, 排查到问题根源, 修改配置


5. 安装/卸载/更新插件：

    安装新插件

        1. vimrc.bundles中配置对应插件
            Bundle 'xxx/xxxx'
        2. 命令行模式，执行:
            :BundleInstall

    更新插件(注意如果YCM更新, 可能需要重编译, 否则自动补全可能失效)

        命令行模式，执行:
        :BundleUpdate

    删除插件

        1. vimrc.bundles中注释或删除对应插件bundle配置行(行首加一个双引号)
        2.命令行模式，执行: (会物理上删除插件文件)
            :BundleClean



---------------------------------

---------------------------------

# 自定义快捷键

    注意, 以下 `,` 代表<leader>
    1. 可以自己修改vimrc中配置，决定是否开启鼠标

    set mouse-=a           " 鼠标暂不启用, 键盘党....
    set mouse=a            " 开启鼠标

    2. 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 如果不需要可以关掉
       好处：误删什么的，如果以前屏幕打开，可以找回....惨痛的经历

    set t_ti= t_te=

    3. 可以自己修改vimrc决定是否使用方向键进行上下左右移动，默认打开，可以注解
    hjkl  上下左右

    map <Left> <Nop>
    map <Right> <Nop>
    map <Up> <Nop>
    map <Down> <Nop>

    4. 上排F功能键

    F1 废弃这个键,防止调出系统帮助
    F2 开启目录树
    F3 set nu/nonu,行号开关，用于鼠标复制代码用
    F5 运行代码
    F6 格式化代码
    F8 打开tagbar
    F10 set paste/nopaste,粘贴模式paste_mode开关,用于有格式的代码粘贴

    5. 分屏移动

    <Leader> + j/k/h/l   进行上下左右窗口跳转,不需要ctrl+w+jkhl

    6. tab操作(重点推)
    ctrl+t 新建一个tab

    (hjkl)
    ,tn    下一个tab(next)
    ,tp    前一个tab(previous)

    ,td    关闭tab
    ,te    tabedit
    ,tm    tabm
    ,tt 最近使用两个tab之间切换

    9. 按键修改
    Y         =y$   复制到行尾
    ,sa       select all,全选
    ,v        选中段落
    <C-j>        代替<Esc>，不用到角落去按esc了

    ,q     :q，保存并退出vim
    ,a     到行首
    ,e     到行尾

    更多优化:
        1. j/k 对于换行展示移动更友好
        2. HL 修改成 ^$, 更方便在同行移动
        3. ; 修改成 : ，一键进入命令行模式，不需要按shift
        4. 命令行模式 ctrl+a/e 到开始结尾
        5. <和> 代码缩进后自动再次选中, 方便多次缩进, esc退出
        6. 对py文件，保存自动去行尾空白，打开自动加行首代码
        7. 交换#/*号功能,#号为正向查找,*反向
        8. `w!!`强制保存, 即使readonly
        9. 去掉错误输入提示
        10. 交换`和', '能跳转到准确行列位置
        11. python/ruby 等, 保存时自动去行尾空白
        12. 统一所有分屏打开的操作位v/s[nerdtree/ctrlspace] (特殊ctrlp ctrl+v/x)

    废弃:
    t         新起一行，下面，不进入插入模式
    T         新起一行，上面


---------------------------------

---------------------------------