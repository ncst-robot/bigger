---
title: VIM操作手册
date: 2018-9-6 16:06:52
tags: [Linux,常用工具]
---

## 常用命令及说明

### 在命令模式下编辑
|     命令      | 说明                                                         |
| :-----------: | ------------------------------------------------------------ |
|    Ctrl+u     | 向文件首翻半屏                                               |
|    Ctrl+d     | 向文件尾翻半屏                                               |
|    Ctrl+f     | 向文件尾翻一屏                                               |
|    Ctrl+b     | 向文件首翻一屏                                               |
|      Esc      | 从编辑模式切换到命令模式                                     |
|      ZZ       | 命令模式下保存当前文件所做的修改后退出vi                     |
|     :行号     | 光标跳转到指定行的行首                                       |
|      :$       | 光标跳转到最后一行的行首                                     |
|     x或X      | 删除一个字符，x删除光标后的，而X删除光标前的                 |
|       D       | 删除从当前光标到光标所在行尾的全部字符                       |
|      dd       | 删除光标行正行内容                                           |
|      ndd      | 删除当前行及其后n-1行                                        |
|     ?nyy      | 将当前行及其下n行的内容保存到寄存器 ? 中，其中 ? 为一个字母，n为一个数字 |
|       p       | 粘贴文本操作，用于将缓存区的内容粘贴到当前光标所在位置的下方 |
|       P       | 粘贴文本操作，用于将缓存区的内容粘贴到当前光标所在位置的上方 |
|    /字符串    | 文本查找操作，用于从当前光标所在位置开始向文件尾部查找指定字符串的内容，查找的字符串会被加亮显示 |
|     ?name     | 文本查找操作，用于从当前光标所在位置开始向文件头部查找指定字符串的内容，查找的字符串会被加亮显示 |
|   a，bs/F/T   | 替换文本操作，用于在第a行到第b行之间，将F字符串换成T字符串。其中，“s/”表示进行替换操作 |
|       a       | 在当前字符后添加文本                                         |
|       A       | 在行末添加文本                                               |
|       i       | 在当前字符前插入文本                                         |
|       I       | 在行首插入文本                                               |
|       o       | 在当前行后面插入一空行                                       |
|       O       | 在当前行前面插入一空行                                       |
|      :wq      | 在命令模式下，执行存盘退出操作                               |
|      :w       | 在命令模式下，执行存盘操作                                   |
|      :w!      | 在命令模式下，执行强制存盘操作                               |
|      :q       | 在命令模式下，执行退出vi操作                                 |
|      :q!      | 在命令模式下，执行强制退出vi操作                             |
|   :e文件名    | 在命令模式下，打开并编辑指定名称的文件                       |
|      :n       | 在命令模式下，如果同时打开多个文件，则继续编辑下一个文件     |
|      :f       | 在命令模式下，用于显示当前的文件名、光标所在行的行号以及显示比例 |
|  :set number  | 在命令模式下，用于在最左端显示行号                           |
| :set nonumber | 在命令模式下，用于在最左端不显示行号                         |
|w | 移动到下一个单词开头，这样就比单纯的使用l要好很多，快很多 |
|e | 移动到当前单词的末尾 |
|b | 光标向后移动一个单词，同理，比h要好 |
|0 | 光标移动到行首(并不会忽略空格和缩进) |
|^ | 光标移动到当前行第一个单词的开头，这个用得比0要多 |
|$ | 光标移动到行尾，不知道为什么，我一直觉得这个操作很麻烦，能有个其他相对简便的就好了 |
|( | 光标移动到下个句子，也就是说移动到下一个空白行 |
|) | 光标移动到上个句子 Ctrl + f：向下移动一屏。 |
|Ctrl + b|向上移动一屏。 |
|G|到文件尾 |
|numG|移动光标到指定的行（num）。（比如 10G 就是到第 10 行） |
|gg|到文件首 |
|H|移动光标到屏幕上面 |
|M|移动光标到屏幕中间 |
|L|移动光标到屏幕下面 |
|*|读取光标处的字符串，并且移动光标到它再次出现的地方。 |
|\\#|和上面的类似，但是是往反方向寻找。 |
|/text|从当前光标处开始搜索字符串 text，并且到达 text 出现的地方。必须使用回车来开始这个搜索命令。如果想重复上次的搜索的话，按 n。 |
|?text|和上面类似，但是是反方向。 |
|ma|在当前光标的位置标记一个书签，名字为 a。书签名只能是小写字母。你看不见书签的存在，但它确实已经在那里了。 |
|\`a|到书签 a 处。注意这个不是单引号，它一般位于大部分键盘的 1 的左边。| 
|`.|到你上次编辑文件的地方。这个命令很有用，而且你不用自己去标记它。|
|Ctrl+p|自动补全|
|Ctrl+n|自动补全|
|s/vim/vi/ | 表示替换当前行的第一个vim为vi|
|s/vim/vi/g | 表示替换当前行所有的vim为vi|
|dw|可以删除到下一个单词的开头|
|de|可以删除到本单词的末尾|
|dd|删除整行|
|3dd|删除3行|
|D|从光标处删除到该行末尾|
|d0|从光标处删除到该行开头|
|dd/yy/cc | 剪切/拷贝/剪切(并进入插入模式)当前行|

### 在VISUAL模式下编辑

|     命令      | 说明                                                         |
| :-----------: | ------------------------------------------------------------ |
| v | 按字符进行选择|
| V | 按行进行选择|
| Ctrl + v | 按块进行选择|
|d | 剪切|
|y | 拷贝|
|c | 剪切并且粘贴时会进入插入模式|

### 插入模式的编辑

直接编辑即可，简单


**语法**

```
vi(选项)(参数)
```

**选项**

```
+<行号>：从指定行号的行开始先是文本内容；
-b：以二进制模式打开文件，用于编辑二进制文件和可执行文件；
-c<指令>：在完成对第一个文件编辑任务后，执行给出的指令；
-d：以diff模式打开文件，当多个文件编辑时，显示文件差异部分；
-l：使用lisp模式，打开“lisp”和“showmatch”；
-m：取消写文件功能，重设“write”选项；
-M：关闭修改功能；
-n：不实用缓存功能；
-o<文件数目>：指定同时打开指定数目的文件；
-R：以只读方式打开文件；
-s：安静模式，不现实指令的任何错误信息。
```

**参数**

```
文件列表：指定要编辑的文件列表。多个文件之间使用空格分隔开。
```



## 配置VIM

> **适用于Windows下的gVIM**

**操作步骤**

- 打开VIM安装目录下的_vimrc文件
- 在文件末尾添加以下内容

```
" 解决Windows中的中文无法正常显示问题
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=prc
" 显示行号
set number
" 设置色方案
colorscheme desert
" 语法高亮度显示
syntax on
" 检测文件类型
filetype on
" vim使用自动对齐，也就是把当前行的对齐格式应用到下一行
set autoindent
" 依据上面的对齐格式，只能的选择对齐方式
set smartindent
" 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
" 当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set vb t_vb=
" 在编辑过程中，在右下角显示光标位置的状态行
set ruler
" 设置游标
set cursorline
" 找要匹配的单词。eg：如果要查找search单词，当输入到/s（回车确认选择）时，会自动找到第一个s开头的单词 
set incsearch
" 设置字体和大小
set guifont=Consolas:h12:cDEFAULT
" 取消自动生成 xxx.xx~ 文件
set noundofile
set nobackup

" **********************************************************************
" ******************************** 其他 *********************************
" **********************************************************************
"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2010年08月02日 15时13分 
"
" Version:     1.80
"
"=========================================================================
set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
colorscheme molokai         " 设定配色方案
set number                  " 显示行号
set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on   " 开启插件
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                            " 设置在状态行显示的信息
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
" set foldclose=all           " 设置为自动关闭折叠                            
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠


" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif
" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
" 设置字体 以及中文支持
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif
" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^zh\|ja\|ko'
        set ambiwidth=double
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>
" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>
"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>
"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>
" set fileformats=unix,dos,mac
" nmap <leader>fd :se fileformat=dos<CR>
" nmap <leader>fu :se fileformat=unix<CR>
" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result
" map <C-x>l <ESC>:cl<CR>
" map <C-x>n <ESC>:cn<CR>
" map <C-x>p <ESC>:cp<CR>
" map <C-x>c <ESC>:cc<CR>


" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1
" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict
"-----------------------------------------------------------------
" plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - taglist.vim  查看函数列表，需要ctags程序
" F4 打开隐藏taglist窗口
"-----------------------------------------------------------------
if MySys() == "windows"                " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1


"-----------------------------------------------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" \m  mark or unmark the word under (or before) the cursor
" \r  manually input a regular expression. 用于搜索.
" \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \*  当前MarkWord的下一个     \#  当前MarkWord的上一个
" \/  所有MarkWords的下一个    \?  所有MarkWords的上一个
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看


"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /*  */<LEFT><LEFT><LEFT>


"-----------------------------------------------------------------
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
"-----------------------------------------------------------------
"-----------------------------------------------------------------
" plugin – checksyntax.vim    JavaScript常见语法错误检查
" 默认快捷方式为 F5
"-----------------------------------------------------------------
let g:checksyntax_auto = 0 " 不自动检查
"-----------------------------------------------------------------
" plugin - NeoComplCache.vim    自动补全插件
"-----------------------------------------------------------------
let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
"-----------------------------------------------------------------
" plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"-----------------------------------------------------------------
"-----------------------------------------------------------------
" plugin - vcscommand.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" SVN/git管理工具
"-----------------------------------------------------------------
"-----------------------------------------------------------------
" plugin – a.vim
"-----------------------------------------------------------------
```

## 补充说明

保存文件快捷键 ZZ(大写)

vi hello.c +5 打开文件，光标定位到第五行

:! 暂时离开，执行其他命令，回车后回到编辑器

/String 查找String，n查找下一个，N查找上一个

dd 剪切

yy 复制

p 粘贴

u 撤销

gg 定位

G 定位

没有保存就关闭的文件，vi会自动生成一个交换文件(.swp),这是一个备份文件，可以恢复原文件后删除。


