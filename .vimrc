" 个人说明
" session无论手动配置或插件都有不完美的地方，尤其是和vimlite一起适用时，更为突
" 出，因此决定注释掉其代码，仅供参考。另外是tabbar和minibufexplor有bug，因此注
" 释代码，使用quickbuf暂时不尽完美的代替。最后是鬼佬的colorizer和依云的
" colorizer都对文件读取速度影响很大，尤其是加载时，因此都不使其自动运行，保留
" 依云版可以手动工作，鬼佬的虽然功能更强，但对速度影响更大，这个功能也不怎么用
" 得到。
" date 2012-04-25

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"latex
:command Latex :!latex "%:p"

"xetex
:command Xetex :!xelatex "%:p"

"dvips
:command Dvips :!dvips "%:p:r.dvi"

"dvipdf
:command Dvipdf :!dvipdf "%:p:r.dvi"

"ps2pdf
:command Ps2pdf :!ps2pdfwr "%:p:r.ps"

"pdflatex
:command Pdflatex :!pdflatex "%:p"

"bibtex
:command Bibtex :!bibtex "%:p:r"

"dvi view
:command Dvi :!xdvi "%:p:r.dvi"

"pdf view
:command Pdf :!okular "%:p:r.pdf"

"pdf2djvu(A4)
:command Pdf2djvu :!pdf2djvu -o %<.djvu --dpi=300 --page-size=2480x3508 --anti-alias --verbose %<.pdf

"djvu view
:command Djvu :!evince "%:p:r.djvu"

"各种设置
"========"
au VimEnter * winpos 0 0 | set lines=49 columns=193

set nu

set tabstop=4
set shiftwidth=4
set softtabstop=4
colorscheme lilydjwg_dark
set t_Co=256

"快捷键前导变量
let mapleader=","
let g:mapleader=","

"快速保存
nmap <leader>s :w!<CR>

"快速编辑.vimrc
map <leader>e :e! ~/.vimrc<CR>
map <leader>g :e! ~/.gvimrc<CR>

"启动持久撤销并设置持久撤销目录
set undodir=~/.vim/undodir
set undofile
"==============="

map <leader>p i(<Esc>ea)<Esc>
map <leader>P i{<Esc>ea}<Esc>
map <F9> "+y
map <F10> "+gp

set whichwrap=b,s

set backupdir=/home/kaji331/.vim_backup

"swp文件目录
set dir=/home/kaji331/.vim/swp

" 增强模式中的命令行自动完成操作
set wildmenu

"搜索不分大小写
set ic

"设置语法折叠
set foldmethod=syntax
set foldcolumn=3 "设置折叠区域的宽度
"set foldclose=all "设置为自动关闭折叠

" 用空格键来开关折叠
set foldenable
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"设置帮助语言
set helplang=cn

"以当前文件目录为工作目录
set autochdir
autocmd VimEnter * lch /home/kaji331
autocmd VimEnter * lch %:p:h

"60秒不操作就存盘保存一次到swp文件中
set updatetime=60000

set list	"显示制表符
"set listchars=tab:▸\ ,eol:¬
set listchars=tab::\ ,eol:¬
"set listchars=tab:\|-,eol:¬
"set listchars=tab:..,eol:$	"显示制表符为....
"set cursorcolumn	"高亮光标列
set colorcolumn=81	"高亮第81列

"automatically detected character encodings
"http://www.vim.org/scripts/script.php?script_id=1708提供一个插件可以自动或手动检测中日韩编码
set fencs=ucs-bom,gb2312,gbk,gb18030,utf-8,default.latin1

"xterm model
set noguipty

" 能够漂亮地显示.NFO文件
set encoding=utf-8
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

"中文整词问题
set formatoptions=croqn2mMl

"拼写检查（美语）
":set spellfile=/media/Linux_Storage/.vim/spellfile.add
:setlocal spell spelllang=en_us

"好玩
map <F8> ggVGg?

"VimLite相关设置
"=============="
"快速开始IDE
nmap <F4> :VLWorkspaceOpen<CR>

"绑定一键编译运行
nmap <F5> :VLWBuildAndRunActiveProject<CR>

"每次退出自动Parse该文件（即生成代码自动补全内容）
let g:VLWorkspaceParseFileAfterSave = 1

"编译前保存所有文件
let g:VLWorkspaceSaveAllBeforeBuild = 1

"使用python加快code completion
let g:VLOmniCpp_UsePython = 1

"是否使用libCxxParser.so来补全
let g:VLOmniCpp_UseLibCxxParser = 0

"----------------
"关闭cscope功能，因为需要安装
let g:VLWorkspaceEnableCscope = 0

"关闭Symbol Database(默认为1->cscope，需要安装，不能自动刷新；2->GNU global，对
"symbol links有bug，需要安装gtag)
let g:VLWorkspaceSymbolDatabase= 0

"----------------
"使用VIMCCC补全
"let g:VLWorkspaceUseVIMCCC = 1

"clang设置
"let g:VIMCCC_CompleteMacros = 1
"let g:VIMCCC_CompletePatterns = 1

"----------------
"补全按键绑定
inoremap <C-j> <C-x><C-p>
inoremap <C-k> <C-x><C-o>

"补全弹出窗口按键绑定
inoremap <expr> j pumvisible()?"\<C-n>":"\j"
inoremap <expr> k pumvisible()?"\<C-p>":"\k"

"=============="

"自动启动tagbar
augroup filetypedetect
	au VimEnter * nested TagbarOpen
	"au BufReadPost * nested ColorHighlight "自动启动依云版Colorizer
	au VimEnter *.txt setlocal ft=txt | TlistOpe | TagbarClose "Txtbrowser设置
	au VimEnter *.TXT setlocal ft=txt | TlistOpe | TagbarClose "Txtbrowser设置
	"为session载入后自动打开tagbar
	"au SessionLoadPost * nested TagbarOpen
augroup END

"让tagbar识别根据~/.ctags处理txt（但是效果不好）
let g:tagbar_type_txt = {
			\'ctagstype' : 'txt',
			\'kinds'     : [
				\'c:content:0',
				\'f:figure:1',
				\'t:table',
			\],
		\}

"整个session保存载入有时候都有问题，恢复的buffer中有时会有被关闭的文件。可能与VIM本身有关。
"====================================================================
"生成载入session文件
"set sessionoptions=folds,buffers,curdir,help
"nmap <F6> :mksession! ~/.vim/sessions/project.vim
"nmap <F7> :source ~/.vim/sessions/project.vim
"exe 'nnoremap <F7> :CloseSession<CR>'.maparg('<F7>', 'n')

"手工自动保存载入session
"augroup auto_session
"	if argc() == 0
"		au VimEnter * nested source ~/.vim/sessions/default.vim
"	endif
"	au VimLeave * nested mksession! ~/.vim/sessions/default.vim
"augroup END

"session.vim增强插件设置
"================="
"augroup auto_session
"	if argc() == 0
"		au VimEnter * nested OpenSession! default
"	endif
"	au VimLeave * nested SaveSession! default
"augroup END
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'

"Tagbar设置
"=========="
nmap <leader>f :TagbarToggle<CR>

"tabbar设置，各buf切换使用ALT+number
"=========="
"让tabbar不占用不可修改的buf，避免和taglist及tagbar等插件冲突
"let g:Tb_ModSelTarget = 1

"一组buf切换按键映射
nmap > :bnext<CR>
nmap < :bprevious<CR>

"一组tab切换按键映射
nmap ) :tabn<CR>
nmap ( :tabp<CR>
nmap <leader>t :tabnew<CR>
nmap <leader>T :tabc<CR>

"利用cmd.vim实现光标所在单词查词典
map <leader>w :Sdcv '<cword>' <CR>

"自动启动colorizer（非依云版）显示文本中颜色代码的颜色，并支持X11颜色名
"let g:colorizer_auto_color = 1
"let g:colorizer_x11_names = 1

"colorizer（依云版）取消默认键盘映射
let g:colorizer_nomap = 1

"自定义QuickBuf快捷键
let g:qb_hotkey="<leader>b"

"MRU相关设置
let MRU_File = '/home/kaji331/.vim/.vim_mru_files'
let MRU_Max_Entries = 50
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Max_Menu_Entries = 5
let MRU_Window_Height = 5
let MRU_Add_Menu = 0
nmap <leader>h :MRU<CR>

"设置 gnome-terminal 的光标
if &term == "xterm"
	silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
	autocmd! InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
	autocmd! InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
	autocmd! VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

"powerline font
let g:Powerline_symbols = 'fancy'
set laststatus=2

"fcitx.vim终端下延迟
set ttimeoutlen=100

"multiple-cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-m>'
let g:multi_cursor_prev_key = '<C-b>'
let g:multi_cursor_skip_key = '<C-i>'
let g:multi_cursor_quit_key = '<Esc>'
