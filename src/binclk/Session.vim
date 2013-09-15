let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <SNR>22_yrrecord =YRRecord3()
inoremap <silent> <SNR>19_yrrecord =YRRecord3()
inoremap <silent> <SNR>24_yrrecord =YRRecord3()
imap <F5> <Plug>ToggleBackground
noremap! <F1> 
map! <S-Insert> <MiddleMouse>
nnoremap <silent>  :YRReplace '-1', P
map  :bp
map  :bn
xnoremap <silent>  :call multiple_cursors#new("v")
nnoremap <silent>  :call multiple_cursors#new("n")
nnoremap <silent>  :YRReplace '1', p
noremap  :YRShow
nnoremap <silent> ,t :CtrlPMixed
map ,q :Bclose
map ,cd :cd %:p:h
noremap ,s :call MakeSession()
noremap ,p :CtrlPBuffer
noremap ,f :CtrlP
map ,ba :1,300 bd!
map ,bd :Bclose
nmap <silent> ,sv :so $MYVIMRC
nmap <silent> ,ev :e $MYVIMRC
nnoremap ; :
nmap @ :YRMapsMacro
xnoremap <silent> P :YRPaste 'P', 'v'
nnoremap <silent> P :YRPaste 'P'
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
xnoremap <silent> d :YRDeleteRange 'v'
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> gp :YRPaste 'gp'
nnoremap <silent> gP :YRPaste 'gP'
nnoremap j gj
nnoremap k gk
xnoremap <silent> p :YRPaste 'p', 'v'
nnoremap <silent> p :YRPaste 'p'
xnoremap <silent> x :YRDeleteRange 'v'
xnoremap <silent> y :YRYankRange 'v'
nnoremap <silent> <SNR>22_yrrecord :call YRRecord3()
nnoremap <silent> <SNR>19_yrrecord :call YRRecord3()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <SNR>24_yrrecord :call YRRecord3()
map <C-Left> :bp
map <C-Right> :bn
vmap <F5> <Plug>ToggleBackground
nmap <F5> <Plug>ToggleBackground
map <S-Insert> <MiddleMouse>
inoremap  u
noremap ì l
noremap ë k
noremap ê j
noremap è h
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set complete=.,w,b,u,t
set copyindent
set display=lastline
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fileformats=unix,dos,mac
set guifont=Droid\ Sans\ Mono\ 11
set guioptions=
set helplang=en
set hidden
set history=1024
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:⇥\ ,trail:␣,extends:⇉,precedes:⇇,nbsp:·
set mouse=a
set nrformats=hex
set pastetoggle=<F2>
set ruler
set runtimepath=~/.vim,~/.vim/bundle/vim-colors-solarized,~/.vim/bundle/vim-colors-xoria256,~/.vim/bundle/vim-ctrlp,~/.vim/bundle/vim-multiple-cursors,~/.vim/bundle/vim-sensible,~/.vim/bundle/vim-yankring,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,~/.vim/after
set scrolloff=1
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set sidescrolloff=5
set smarttab
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabpagemax=50
set tabstop=4
set termencoding=utf-8
set title
set ttimeout
set ttimeoutlen=50
set undolevels=1024
set viminfo=!,'100,<50,s10,h
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class,*.hi
set wildmenu
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 def.h
badd +1 usartprimitive.c
badd +5 main.c
badd +1 usartprimitive.h
badd +1 ds1302.c
badd +1 BitPort.h
badd +1 bit_operations.h
badd +1 compat.h
badd +1 main.h
badd +1 datetimeconvert.c
badd +1 ds1302.h
badd +1 macros.h
badd +1 datetimeconvert.h
badd +1 ds1302_settings.h
args def.h usartprimitive.c main.c usartprimitive.h ds1302.c BitPort.h pinout.h bit_operations.h compat.h main.h datetimeconvert.c ds1302.h macros.h datetimeconvert.h ds1302_settings.h
edit bit_operations.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit bit_operations.h
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
