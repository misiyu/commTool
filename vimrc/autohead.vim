"==========================================================设置默认添加代码
autocmd BufNewFile *.py,*.c,*.sh,*.java,*.php,*.html,*.cpp,*.h exec ":call SetTitle()"  
func SetTitle()  
	
	if expand("%:e") == 'cpp'  
		call setline(1,"#include <iostream>")  
		call setline(2,"")  
		call setline(3,"using namespace std;")  
		call setline(4,"")  
		call setline(5,"int main()")
		call setline(6,"{")
		call setline(7,"	cout <<\"Hello world!\" << endl;")
		call setline(8,"")
		call setline(9,"	return 0;")
		call setline(10,"}")
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
