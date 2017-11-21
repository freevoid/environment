set nocompatible
filetype off

" Make sure VIM uses POSIX-compatible shell
if &shell =~# 'fish$'
	set shell=bash
endif

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim'
Plug 'Valloric/ListToggle'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'dart-lang/dart-vim-plugin'
Plug 'edkolev/tmuxline.vim'
Plug 'idanarye/vim-vebugger'
Plug 'jlanzarotta/bufexplorer'
Plug 'kana/vim-fakeclip'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/taglist.vim'
Plug 'wannesm/wmgraphviz.vim'

if filereadable(expand("~/.vimrc_local_plugins"))
	source ~/.vimrc_local_plugins
endif

call plug#end()

filetype off

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
set backupdir=~/.vim/backup

" Save swap files in separate folder
set directory=~/.vim/swap

" Allow using backspace in insert mode
set backspace=indent,eol,start

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

" Title
set title

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
set fileencodings=ucs-bom,utf-8,latin1

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

if has("clipboard") && !has("nvim")
	set clipboard=autoselect
endif

if has("folding")
	set foldmethod=indent
	set foldlevel=99
endif

set autoindent
set cindent

set guioptions-=T
set guioptions-=m

" ------------------------ Key mappings start
" Toggle Paste mode
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p

" Open VIM config
nnoremap <silent>,v :tabnew $MYVIMRC<CR>

" Preserve selection while shifting
vnoremap < <gv
vnoremap > >gv

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

nnoremap g1 1gt
nnoremap g2 2gt
nnoremap g3 3gt
nnoremap g4 4gt
nnoremap g5 5gt
nnoremap g6 6gt
nnoremap g7 7gt
nnoremap g8 8gt
nnoremap g9 9gt

" search for a text under cursor
vnoremap <silent>* <ESC>:call VisualSearch("?")<CR>?<CR>/<CR>
vnoremap <silent># <ESC>:call VisualSearch("/")<CR>/<CR>?<CR>

" stop highlighting search results
nnoremap <C-H> :nohlsearch<CR>:echo "nohlsearch"<CR>
inoremap <C-H> <C-O>:nohlsearch<CR><C-O>:echo "nohlsearch"<CR>
vnoremap <C-H> <ESC>:nohlsearch<CR>:echo "nohlsearch"<CR>

" location list navigation
nnoremap <leader>l] :lnext<cr>
nnoremap <leader>l[ :lprevious<cr>
nnoremap <leader>ll :ll<cr>
nnoremap <leader>le :Errors<cr>

" ------------------------ Key mappings end

" Setting omnifunc as default syntaxComplete
"set ofu=syntaxcomplete#Complete

if has("autocmd")

	autocmd! filetype help,man setlocal nonumber

	autocmd! bufreadpost * call LastPosition()

	autocmd! bufwritepost $MYVIMRC source $MYVIMRC


	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Pretty-print XML files
	autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

	autocmd FileType java nnoremap <buffer> <leader>gg :JavaSearchContext<cr>
	autocmd FileType java nnoremap <buffer> <leader>d :JavaDocSearch -x declarations<cr>
	autocmd FileType java nnoremap <buffer> <leader>jc :JavaCorrect <cr>
	autocmd FileType java nnoremap <buffer> <leader>js :SyntasticCheck <cr>
	autocmd FileType java nnoremap <buffer> <leader>i :JavaImport<cr>
	autocmd FileType java nnoremap <buffer> <leader>jo :JavaImportOrganize<cr>

	" Set this to have long lines wrap inside comments.
	setlocal textwidth=79
endif


if exists("*function")

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

endif

" auto-create folders
if !isdirectory(&backupdir)
	call mkdir(&backupdir, "p", 0700)
endif

if !isdirectory(&directory)
	call mkdir(&directory, "p", 0700)
endif

if has('gui_running')
	set guifont=Terminus\ 12
endif

" Plugin related configs

" NERDTree
nnoremap <silent> <S-TAB> :NERDTreeToggle<CR>

" BufExplorer
nnoremap <silent> <TAB> :ToggleBufExplorer<CR>

let g:SuperTabDefaultCompletionType = "context"

let ropevim_guess_project=1
let ropevim_goto_def_newwin=1
let ropevim_vim_completion=0
let ropevim_extended_complete=1

"imap \/ <C-R>=RopeCodeAssistInsertMode()<cr>

" base-16
if filereadable(expand("~/.vimrc_background"))
	set t_Co=256
	let base16colorspace=256
	source ~/.vimrc_background
else
	set t_Co=16
	set background=dark
	let g:solarized_italic=0
	colorscheme solarized
endif

" Eclim

let g:EclimCompletionMethod = 'omnifunc'
let g:EclimLoggingDisabled = 1

" CtrlP
let g:ctrlp_root_markers = ['.rootdir']
if executable("ag")
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ag
let g:ag_working_path_mode="r"

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 0
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_auto_trigger = 0

" Powerline
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

" Kythe LSP
nnoremap <leader>gd  :<c-u>LspDefinition<cr>

" Projectionist
nnoremap <silent> <S-A> :A<CR>

" Gundo
nnoremap <leader>u :<c-u>GundoToggle<CR>

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_theme='powerlineish'
call airline#parts#define_accent('linenr', 'none')
call airline#parts#define_accent('maxlinenr', 'none')

" read extra config from vimrc_local
if filereadable(expand("/.vimrc_local"))
	source ~/.vimrc_local
endif

filetype plugin indent on

" vim:tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
