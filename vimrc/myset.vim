"=======================================快捷键设置
nmap a ggVG
map b  :bn<CR>
vmap c "+y
map d  :bdelete<CR>
vmap o y:edit <C-R>"<CR>
map p  "+p
nmap q  q
nmap r Vy:!<C-R>"
vmap s y:%s/<C-R>"/rep/g<left><left>
nmap s  :split<CR>
nmap v  :vsplit<CR>
nmap w  w
map 1  :buffer 1<CR>
map 2  :buffer 2<CR>
map 3  :buffer 3<CR>
map 4  :buffer 4<CR>
map 5  :buffer 5<CR>
map 6  :buffer 6<CR>
map 7  :buffer 7<CR>
map 8  :buffer 8<CR>
map f  :bfirst<CR>
map l  :blast<CR>
map >  4>
map <  4<
map -  4-
map =  4+
cmap a" let @a=@"
cmap rs w! tmp<CR>gvd:exec RunS()
cmap rc w! tmp.c<CR>gvd:exec RunC()
func RunS()
	w
	!chmod u+x tmp
	r !./tmp
	!rm tmp
endfunc
func RunC()
	!sed -i -e '1i \#include <stdio.h>' -e '1i \int main() {' -e '$a \	return 0;' -e '$a \}' tmp.c
	!gcc tmp.c
	r !./a.out
	!rm tmp.c a.out
endfunc
"==========================================================O
set dictionary=$HOME/.vim/dic/mydic
set dictionary+=$HOME/.vim/dic/nim012.dict

"laststatus 设置
set laststatus=2
set showcmd
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set number  
"检测文件类型
filetype off
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on
"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
set t_ti= t_te=
" 取消换行。
set nowrap
"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"打开回到上次位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set showcmd

