set nocompatible

" Do not use system locale
if has("unix")
	language en_US.UTF-8
endif

" Increase history limits
set history=128
set undolevels=2048

" Backup properties
set nobackup
set writebackup
if has("win32")
	set backupdir=~\\vimfiles\\backup
else
	set backupdir=~/.vim/backup
endif

" Save swap files in separate folder
if has("win32")
	set directory=~\\vimfiles\\swap
else
	set directory=~/.vim/swap
endif

if has("win32")
	set viminfo='128,/64,:64,<64,s10,h,n~\\vimfiles\\viminfo
else
	set viminfo='128,/64,:64,<64,s10,h,n~/.vim/viminfo
endif

" Shorten timeout for key codes
set ttimeoutlen=100


" Use 256-color terminal palette
set t_Co=256

" Allow using backspace in insert mode
set backspace=indent,eol,start

if !&diff
	syntax enable
endif

if has("autocmd")
	filetype plugin on
	filetype plugin indent on
endif

" Automatically set working directory to the directory of currently opened file
set autochdir
set autoread
set cmdheight=2
set cmdwinheight=16
set hidden
set matchpairs+=<:>
set matchtime=1
set modeline
set nojoinspaces
set number
set numberwidth=5
set ruler
set showcmd
set showmatch
set showmode
set wrap
" Always show the line with tabs
set showtabline=2
" Use dialogs instead of failing with error messages
set confirm

" Status line
" Always show the status line
set laststatus=2
" File name and flags
set statusline=%1*%m%*%2*%r%*%3*%h%w%*%f\ %<
" File position
set statusline+=%=Col:%3*%03c%*\ Ln:%3*%04l/%04L%*
" File type and attributes
set statusline+=%(\ File:%3*%{join(filter([&filetype,&fileformat!=split(&fileformats,',')[0]?&fileformat:'',&fileencoding!=split(&fileencodings,',')[0]?&fileencoding:''],'!empty(v:val)'),'/')}%*%)

" Title
set title
set titlestring=%t%(\ %m%)%(\ %r%)%(\ %h%)%(\ %w%)%(\ (%{expand(\"%:p:~:h\")})%)\ -\ VIM

" The cursor is not allowed to be positioned one character past the line
set selection=old

" Set up tab behavior
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab

" paranoid mode
" set secure

" Use shortened dialogs
set shortmess=fimnrxoOtTI

" Always show the number of lines changed
set report=0

set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase

" Preserve the cursor column position when jumping around
set nostartofline

" Scroll settings
set scrolloff=3
set scrolljump=10
set sidescrolloff=3
set sidescroll=10

set splitbelow
set splitright
set noequalalways

if has("unix")
	set encoding=utf-8
endif

" File encoding check order
set fileencodings=ucs-bom,utf-8,cp1251,koi8-r,latin1


if has("unix")
	" Support cyrillic keyboard mapping for commands and shortcuts
	set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~
endif

" Allow to switch line after reaching end of current line
set whichwrap=b,s,h,l,<,>,~,[,]

" Disable auto-wrap during text formatting
set formatoptions-=t

set wildmenu
set wildcharm=<TAB>

if has("mouse")
	set mouse=a
endif

if has("clipboard")
	set clipboard=autoselect
endif

if has("folding")
	set foldmethod=indent
	set foldlevel=99
endif

" --- GUI-specific settings ---

if has("gui_running")
	aunmenu *
	set lines=45 columns=140
	set guioptions=aci
	set mousemodel=popup
	set mousefocus
	set nomousehide
	set browsedir=buffer
endif

" ------------------------ Key mappings start
" Toggle Paste mode
nnoremap <C-P> :set invpaste paste?<CR>
set pastetoggle=<C-P>

" Open VIM config
nnoremap <silent>,v :tabnew $MYVIMRC<CR>

" Preserve selection while shifting
vnoremap < <gv
vnoremap > >gv

" Search for the word under cursor
nnoremap * g*N
nnoremap # g#N

" Search in selected region
vnoremap g/ <ESC>/\%V

" Fix gg and G when nostartofline enabled
nnoremap gg gg<HOME>
vnoremap gg gg<HOME>
nnoremap G G<END>
vnoremap G G<END>

" Do not skip long wrapped lines while navigating
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <DOWN> gj
nnoremap <UP> gk
vnoremap <DOWN> gj
vnoremap <UP> gk
inoremap <DOWN> <C-O>gj
inoremap <UP> <C-O>gk

" Paging
nnoremap <PAGEUP> <C-U>
nnoremap <PAGEDOWN> <C-D>
inoremap <PAGEUP> <C-O><C-U>
inoremap <PAGEDOWN> <C-O><C-D>
vnoremap <PAGEUP> <C-U>
vnoremap <PAGEDOWN> <C-D>

" new tab
nnoremap <C-T> :tabnew<CR>
inoremap <C-T> <C-O>:tabnew<CR>
vnoremap <C-T> <ESC>:tabnew<CR>

" go to left tab
nnoremap <silent><A-LEFT> :call TabAction("jump", "left")<CR>
inoremap <silent><A-LEFT> <C-O>:call TabAction("jump", "left")<CR>
vnoremap <silent><A-LEFT> <ESC>:call TabAction("jump", "left")<CR>

" go to right tab
nnoremap <silent><A-RIGHT> :call TabAction("jump", "right")<CR>
inoremap <silent><A-RIGHT> <C-O>:call TabAction("jump", "right")<CR>
vnoremap <silent><A-RIGHT> <ESC>:call TabAction("jump", "right")<CR>

" go to first tab
nnoremap <A-UP> :tabfirst<CR>
inoremap <A-UP> <C-O>:tabfirst<CR>
vnoremap <A-UP> <ESC>:tabfirst<CR>

" go to last tab
nnoremap <A-DOWN> :tablast<CR>
inoremap <A-DOWN> <C-O>:tablast<CR>
vnoremap <A-DOWN> <ESC>:tablast<CR>

" move tab to far left position
nnoremap <A-S-UP> :tabmove 0<CR>
inoremap <A-S-UP> <C-O>:tabmove 0<CR>
vnoremap <A-S-UP> <ESC>:tabmove 0<CR>

" move tab to far right position
nnoremap <A-S-DOWN> :tabmove<CR>
inoremap <A-S-DOWN> <C-O>:tabmove<CR>
vnoremap <A-S-DOWN> <ESC>:tabmove<CR>

" move tab to the left
nnoremap <silent><A-S-LEFT> :call TabAction("move", "left")<CR>
inoremap <silent><A-S-LEFT> <C-O>:call TabAction("move", "left")<CR>
vnoremap <silent><A-S-LEFT> <ESC>:call TabAction("move", "left")<CR>

" move tab to the right
nnoremap <silent><A-S-RIGHT> :call TabAction("move", "right")<CR>
inoremap <silent><A-S-RIGHT> <C-O>:call TabAction("move", "right")<CR>
vnoremap <silent><A-S-RIGHT> <ESC>:call TabAction("move", "right")<CR>

" search for a text under cursor
vnoremap <silent>* <ESC>:call VisualSearch("?")<CR>?<CR>/<CR>
vnoremap <silent># <ESC>:call VisualSearch("/")<CR>/<CR>?<CR>

" remove trailing spaces
nnoremap <silent>,t :call RemoveTrailingSpaces()<CR>:echo "trailing spaces removed"<CR>

" stop highlighting search results
nnoremap <C-H> :nohlsearch<CR>:echo "nohlsearch"<CR>
inoremap <C-H> <C-O>:nohlsearch<CR><C-O>:echo "nohlsearch"<CR>
vnoremap <C-H> <ESC>:nohlsearch<CR>:echo "nohlsearch"<CR>

" ------------------------ Key mappings end

" Setting omnifunc as default syntaxComplete
set ofu=syntaxcomplete#Complete

if has("autocmd")

	autocmd! filetype help,man setlocal nonumber

	autocmd! bufreadpost * call LastPosition()

	autocmd! bufwritepost $MYVIMRC source $MYVIMRC


	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Pretty-print XML files
	autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

	" Highlight trailing whitespaces
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()

endif


if exists("*function")

	" tab management
	function! TabAction(action, direction)
		let l:tablen=tabpagenr("$")
		let l:tabcur=tabpagenr()
		if a:direction=="left" && l:tabcur>1
			if a:action=="jump"
				execute "tabprevious"
			elseif a:action=="move"
				execute "tabmove" l:tabcur-2
			endif
		elseif a:direction=="right" && l:tabcur!=l:tablen
			if a:action=="jump"
				execute "tabnext"
			elseif a:action=="move"
				execute "tabmove" l:tabcur
			endif
		endif
	endfunction

	" search in selection
	function! VisualSearch(dirrection)
		let l:register=@@
		normal! gvy
		let l:search=escape(@@, "^$.*/\\[]")
		if a:dirrection=="/"
			execute "normal! /".l:search
		else
			execute "normal! ?".l:search
		endif
		let @/=l:search
		normal! gV
		let @@=l:register
	endfunction

	" go to last cursor position
	function! LastPosition()
		if line("'\"") && line("'\"")<=line("$")
			normal! `"
		endif
	endfunction

	function! RemoveTrailingSpaces()
		normal! mzHmy
		execute "%s:\\s\\+$::ge"
		normal! 'yzt`z
	endfunction

endif

" auto-create folders
if !isdirectory(&backupdir)
	call mkdir(&backupdir, "p", 0700)
endif

if !isdirectory(&directory)
	call mkdir(&directory, "p", 0700)
endif

" read extra config from vimrc.local
if filereadable($HOME.'/.vimrc.local')
	source $HOME.'/.vimrc.local'
endif

set autoindent
set cindent

set guioptions-=T
set guioptions-=m

if has('gui')
	if has('win32')
		set guifont=Terminus:h12:cRUSSIAN
	else
		set guifont=Terminus\ 14
	endif
endif

" Plugin related configs

" TagList
nnoremap <silent> <S-TAB> :TlistToggle<CR>

" NERDTree
nnoremap <silent> <TAB> :NERDTreeToggle<CR>

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
let g:SuperTabDefaultCompletionType = "context"

let ropevim_guess_project=1
let ropevim_goto_def_newwin=1
let ropevim_vim_completion=0
let ropevim_extended_complete=1

imap \/ <C-R>=RopeCodeAssistInsertMode()<cr>

call pathogen#runtime_append_all_bundles("bundle-enabled")

" Color scheme
if has('gui')
	" Enable solarized colorscheme in GUI
	let g:solarized_italic=0
	colorscheme solarized
else
	" Use 256-jungle in terminal
	colorscheme 256-jungle
endif

" vim:tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
