"pathogen 插件开启
execute pathogen#infect()
"let NERDTreeWinWidth=170
"====================laststatus 设置
"将状态行显示在窗口底部倒数第二行
set laststatus=2
"当前文件名，文件格式(DOS, Unix)，文件类型 (XHTML)，当前位置和文件总行数。
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=%F\ "\  "
"================================
"=======================================快捷键设置
"nnoremap <c-s> :w<CR>   
"<CR>表示不需要回车确认
map b  :bn<CR>
map p  :bp<CR>
vmap {  VdO{}<Esc>kpkddk=%
"==========================================================O
"设置缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
"打开回到上次位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"检测文件类型
filetype off
set number  
"===============================有关Vundle的配置
filetype off
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe' 
""强大的自动补全，谁用谁知道
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
"漂亮的状态栏
Bundle 'terryma/vim-multiple-cursors'
""多光标同时编辑
Bundle 'luochen1990/rainbow'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Lokaltog/vim-easymotion'
"强大的搜索定位
Bundle 'winmanager' 
"窗口管理
Bundle 'a.vim'
"cpp 和 hpp之间跳转
"Bundle 'flazz/vim-colorschemes'
"Bundle 'Chiel92/vim-autoformat'
"Bundle 'minibufexpl.vim' 
""buffer管理
"Bundle 'comments.vim' 
""快速注释
"Bundle 'kien/ctrlp.vim' 
""强大的文件搜索
"Bundle 'godlygeek/tabular' 
""快速对齐
"Bundle 'tpope/vim-haml' 
""sass scss haml等css开发语言支持
"Bundle 'genoma/vim-less' 
"less支持css扩充
"Bundle 'Raimondi/delimitMate' 
""自动补全引号 括号等
"Bundle 'hail2u/vim-css3-syntax' 
""css3语法高亮
"Bundle 'othree/html5.vim' 
""html5标签支持
"Bundle 'docunext/closetag.vim' 
""html xml自动闭合标签
"Bundle 'gregsexton/MatchTag' 
"自动高亮匹配标签
"Bundle 'terryma/vim-expand-region' 
""自动选择括号等符号中的内容
"Bundle 'tpope/vim-surround' 
""符号自动环绕
"Bundle 'tpope/vim-repeat' 
""更为强大的重做功能
"Bundle 'bronson/vim-trailing-whitespace' 
""显示以及去除行尾空格
"Bundle 'SirVer/ultisnips' 
""代码片段补全
"Bundle 'honza/vim-snippets' 
""内置了一堆语言的自动补全片段
"Bundle 'rstacruz/vim-ultisnips-css' 
""css的补全
"Bundle 'tacahiroy/ctrlp-funky' 
""基于ctrlp的搜索函数等变量名
"Bundle 'dyng/ctrlsf.vim' 
""基于ctrlp的文件内容搜索，配合vim－multiple－cursors可以很方便一次修改多个文件的内容
"Bundle 'pangloss/vim-javascript'
""更好的js语法 锁进支持
"Bundle 'othree/yajs.vim' 
""更好的js语法高亮
"Bundle 'othree/javascript-libraries-syntax.vim' 
""js各类框架 库的高亮支持
"Bundle 'maksimr/vim-jsbeautify' 
""格式化js css等
"Bundle 'marijnh/tern_for_vim' 
"牛逼的基于语法分析的补全
"Bundle 'mbriggs/mark.vim' 
"标记高亮
"Bundle 'gorodinskiy/vim-coloresque' 
""颜色符号显示对应颜色
"Bundle 'scrooloose/nerdtree' 
""文件树浏览
"Bundle 'Xuyuanp/nerdtree-git-plugin' 
""git支持
"Bundle 'majutsushi/tagbar' 
""ctags标签提取显示
"================================
"=======================================rainbow
let g:rainbow_active = 1 
"0 if you want to enable it later via :RainbowToggle"
"=========================================

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
"在状态栏显示正在输入的命令
set showcmd
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"======================================================superTab
"let g:SuperTabDefaultCompletionType="context" 
let g:SuperTabRetainCompletionType=1
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"================================================syntastic 配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_c_checkers=['make']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
set statusline+=%*gbar
"======================================================
"==========================================================设置默认添加代码
autocmd BufNewFile *.py,*.c,*.sh,*.java,*.php,*.html exec ":call SetTitle()"  
"新建.py,.cc,.java,.sh,  
"定义函数SetTitle，自动插入文件头  
func SetTitle()  
	
	if expand("%:e") == 'cpp'  
		call setline(1,"#include <iostream>")  
		call setline(2,"")  
		call setline(3,"using namespace std;")  
		call setline(4,"")  
		call setline(5,"int main()")
		call setline(6,"cout <<\"Hello world!\" << endl;");
		call setline(7,"");
		call setline(8,"	return 0;");
		call setline(9,"}");
	endif  

	if expand("%:e") == 'c'
		let g:SuperTabDefaultCompletionType="<C-P>"
		call setline(1,"#include <stdio.h>")  
		call setline(2,"int main() {")  
		call setline(3,"")  
		call setline(4,	"	return 0;")  
		call setline(5,"}")  
	endif

	if expand("%:e") == 'java'
		call setline(1,"public class {")  
		call setline(2,"	public static void main(String args[]){")  
		call setline(3,"	}")  
		call setline(4,"}")  
	endif

	if expand("%:e") == 'sh'
		"call setline(1,"#!/bin/sh")  
		let g:SuperTabDefaultCompletionType="<C-P>"
	endif
	if expand("%:e") == 'py'
		"call setline(1,"#!/bin/sh")  
		call setline(1,"#coding=utf-8")
	endif
	
	if expand("%:e") == 'h'
		call setline(1,"#ifndef <>")
		call setline(2,"#define <>")  
		call setline(3,"")  
		call setline(4,"#endif ")  
	endif

	if expand("%:e") == 'php'
		let g:SuperTabDefaultCompletionType="<C-X><C-O>"
		"call setline(1,"<html>")
		"call setline(2,"<title> page </title>")
		"call setline(3,"<body>")
		call setline(1,"<?php")
		call setline(2,"?>")
		"call setline(6,"</body>")
		"call setline(7,"</html>")
	endif
	if expand("%:e") == 'html'
		call setline(1,"<html>")
		call setline(2,"<head>")
		call setline(3,"<title> page </title>")
		call setline(4,"</head>")
		call setline(5,"<body>")
		call setline(6,"</body>")
		call setline(7,"</html>")
	endif

endfunc  
inoremap <C-1> zfap
"================================================================
"==============================================================omminfunc
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType sh set omnifunc=shcomplete#Complete
"================================================================
"=============================================youcompleteme
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>	"open locationlist
" nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第3个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
			\ 'tagbar' : 1,
			\ 'nerdtree' : 1,
			\}
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<c-n>','<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>','<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
"let g:ycm_key_invoke_completion = '<M-;>'

"============================================================
"==================================================UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-e>"
"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]
"function! g:UltiSnips_Complete()
	"call UltiSnips#ExpandSnippet()
	"if g:ulti_expand_res == 0
	"if pumvisible()
	"return "\<C-n>"
	"else
	"call UltiSnips#JumpForwards()
	"if g:ulti_jump_forwards_res == 0
	"return "\<TAB>"
	"endif
	"endif
	"endif
	"return ""
"endfunction
"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

"Expand snippet or return
"let g:ulti_expand_res = 1
"function! Ulti_ExpandOrEnter()
	"call UltiSnips#ExpandSnippet()
	"if g:ulti_expand_res
	"return ''
	"else
	"return "\<return>"
"endfunction
"Set <space> as primary trigger
"inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>"
"==========================================================================
"===============================================折叠保存设置
"au BufWinLeave  * silent mkview
"au BufWinEnter  * silent loadview
"----------------------------------------------------
