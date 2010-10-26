"
" Файл конфигурации VIM — ~/.vimrc
" Mon Aug  2 14:56:45 EEST 2010
"
" Nikolay Frantsev <code [at] frantsev (dot) ru>
" http://frantsev.ru/configs/vimrc.txt
" http://frantsev.ru/configs/vimrc.html
"

" --- параметры ---

" не совместимо с vi
set nocompatible

if has("unix")

	" использовать английский язык на любой системе
	language en_US.UTF-8

endif

" хранить больше истории команд ...
set history=128

" ... и правок
set undolevels=2048

" хранить резервные копии файлов ...
set backup

" ... в отдельном каталоге
set backupdir=~/.vim/backup/

" автоматически менять каталог на текущий
set autochdir

" хранить swap в отдельном каталоге
set directory=~/.vim/swap/

" меньше приоритета бинарным файлам при автодополнении
set suffixes+=.png,.gif,.jpg,.jpeg,.ico

" перерисовывать буфер менее плавно
set lazyredraw

" не ждать завершения escape-последовательностей
set ttimeoutlen=100

" читать параметры конфигурации из открытого файла
set modeline

" не выгружать скрытые буферы
set hidden

" перечитывать изменённые файлы автоматически
set autoread

" использовать больше цветов в терминале
set t_Co=256

" разрешить backspace в режиме вставки
set backspace=2

" наследовать отступы предыдущей строки
set autoindent

" умные отступы на основе синтаксиса
set smartindent

" умные отступы после некоторых слов
set cinwords+=elseif,foreach

if !&diff

	" подсвечивать синтаксис
	syntax enable

endif

if has("autocmd")

	" определять тип файла автоматически
	filetype plugin on

endif

" показывать строку с позицией курсора
set ruler

" показывать номера строк ...
set number

" ... в 4 символа минимум
set numberwidth=5

" показывать буфер вводимой команды
set showcmd

" показывать первую парную скобку после ввода второй ...
set showmatch

" ... чуть меньше времени
set matchtime=1

" показывать совпадающие скобки для HTML-тегов
set matchpairs+=<:>

" сделать строку команд больше
set cmdheight=2

" сделать окно команд больше
set cmdwinheight=16

" показывать строку вкладок всегда
set showtabline=2

" показывать строку статуса всегда
set laststatus=2

" информация о флагах файла и его пути в строке статуса
set statusline=%1*%m%*%2*%r%*%3*%h%w%*%f\ %<

" информация о положении курсора в строке статуса
set statusline+=%=Col:%3*%03c%*\ Ln:%3*%04l/%04L%*

" информация о типе и атрибутах файла в строке статуса
set statusline+=%(\ File:%3*%{join(filter([&filetype,&fileformat!=split(&fileformats,',')[0]?&fileformat:'',&fileencoding!=split(&fileencodings,',')[0]?&fileencoding:''],'!empty(v:val)'),'/')}%*%)

" показывать имя буфера в заголовке терминала
set title

" формат заголовка
set titlestring=%t%(\ %m%)%(\ %r%)%(\ %h%)%(\ %w%)%(\ (%{expand(\"%:p:~:h\")})%)\ -\ VIM

" не разрешать курсору выходить за последний символ при выделении
set selection=old

" использовать keyword для справки по VIM
set keywordprg=:help

" использовать табуляцию в 4 пробела ...
set tabstop=4

" ... для мягких табуляций ...
set softtabstop=4

" ... и сдвигов строк
set shiftwidth=4

" удалять лишние пробелы при отступе
set shiftround

" использовать диалоги вместо сообщений об ошибках
set confirm

" paranoid mode
" set secure

" использовать сокращённые диалоги
set shortmess=fimnrxoOtTI

" показывать все изменения буфера
set report=0

" использовать инкрементальный поиск
set incsearch

" использовать подсветку поиска
set hlsearch

" игнорировать регистр при поиске ...
set ignorecase

" ... если поисковый запрос в нижнем регистре
set smartcase

" предлагать авто-дополнение на основе уже введённого регистра
set infercase

" не переносить строки
set nowrap

" не менять позицию курсора при прыжках по буферу
set nostartofline

" расстояние до края при вертикальной прокрутке
set scrolloff=3

" размер прыжка при вертикальной прокрутке
set scrolljump=10

" расстояние до края при горизонтальной прокрутке
set sidescrolloff=3

" размер прыжка при горизонтальной прокрутке
set sidescroll=10

" разбивать окно горизонтально снизу
set splitbelow

" разбивать окно вертикально справа
set splitright

" не выравнивать размеры окон при закрытии
set noequalalways

" не вставлять лишних пробелов при объединении строк
set nojoinspaces

" подсвечивать некоторые символы
"set list

" установим символы для подсветки
if has("unix")
	"set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
else
	set listchars=tab:+-,trail:?,extends:>,precedes:<,nbsp:?
endif

if has("unix")

	" кодировка по-умолчанию
	set encoding=utf-8

endif

" порядок перебора кодировок
set fileencodings=utf-8,windows-1251,iso-8859-15,koi8-r

" порядок перебора типов EOL
set fileformats=unix,dos,mac

if has("unix")

	" фикс для русских клавиш
	set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~

endif

" разрешить переход на новую/предыдущую строку при достижении конца/начала текущей
set whichwrap=b,s,h,l,<,>,~,[,]

" переключение режима отступов при вставке
set pastetoggle=<F12>

" использовать wildmenu ...
set wildmenu

" ... с авто-дополнением
set wildcharm=<TAB>

" максимальное число вкладок
set tabpagemax=99

if has("mouse")

	" разрешить визуальное выделение мышью
	set mouse=nvir

endif

if has("clipboard")

	" использовать буфер мыши при выделении
	set clipboard=autoselect

endif

" настройки сессий
set viminfo='128,/64,:64,<64,s10,h,n~/.vim/viminfo

" настройки файлов с сессиями
set sessionoptions=buffers,tabpages,help

" отключить автоматический перенос строк
set formatoptions-=tc

" отключить автоматическое открытие новой строки комментария
set formatoptions-=o

if has("folding")

	" сворачивать по отступам
	set foldmethod=indent

	" не сворачивать рекурсивно
	set foldlevel=99

endif

if &loadplugins

	" не загружать все плагины...
	" set noloadplugins

	" ..., а загрузить только нужные мне
	" runtime! plugin/matchparen.vim plugin/netrwPlugin.vim plugin/spellfile.vim plugin/tohtml.vim

endif

" --- настройки для GUI ---

if has("gui_running")

	" удалить всё меню в GUI
	aunmenu *

	" размеры окна при открытии
	set lines=45 columns=140

	" основные параметры отображения
	set guioptions=aci

	" использовать контекстное меню
	set mousemodel=popup

	" разрешить фокусу прыгать за мышью между окнами
	set mousefocus

	" не скрывать указатель при печати
	set nomousehide

	" начинать обзор с каталога текущего буфера
	set browsedir=buffer

endif

" --- переменные ---

if exists("*function")

	" использовать CSS в TOhtml
	let g:html_use_css=1

	" строгий DOCTYPE для TOhtml
	let g:use_xhtml = 1

	" подсвечивать SQL в PHP коде
	let g:php_sql_query=1

	" подсвечивать теги в строковых переменных PHP
	let g:php_htmlInStrings=1

	" запретить использовании сокращённых тегов
	let g:php_noShortTags=1

	" подсвечивать незакрытые скобки в PHP
	let g:php_parent_error_close=1

	" не подсвечивать конструкции PHP после незакрытых скобок
	let g:php_parent_error_open=1

	" правильное сворачивание классов и функций PHP
	let g:php_folding=1

endif

" --- аббревиатуры ---

" дизайнерская рыба
inoreabbrev lorem Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.<C-O>:call EatChar()<CR>

" --- подсветка ---

" подсветка строки статуса
highlight user1 term=bold cterm=inverse,bold ctermbg=green gui=inverse,bold guibg=#8AE234
highlight user2 term=bold cterm=inverse,bold ctermbg=red gui=inverse,bold guibg=#EF2929
highlight user3 term=bold cterm=inverse,bold ctermbg=blue gui=inverse,bold guibg=#729FCF

" подсветка непечатаемых символов
highlight specialkey ctermfg=lightgray guifg=#D3D7CF
highlight nontext ctermfg=gray guifg=#D3D7CF

" подсветка вкладок
highlight tabline term=none cterm=none ctermbg=lightgray gui=none guibg=#D3D7CF
highlight tablinefill term=none cterm=none ctermbg=lightgray gui=none guibg=#D3D7CF

" --- горячие клавиши ---
" Показать TagList слева
nnoremap <silent> <S-TAB> :TlistToggle<CR>

" быстрое редактирование конфигурации VIM
nnoremap <silent>,v :tabnew $MYVIMRC<CR>

" быстрое восстановление конфигурации VIM
nnoremap <silent>,s :source $MYVIMRC<CR>

" исправить отступы при вставке из внешнего буфера
nnoremap <silent>,p u:set paste<CR>.:set nopaste<CR>:echo "pasted text fixed"<CR>

" сохранять выделение при визуальном изменении отступа
vnoremap < <gv
vnoremap > >gv

" более логичное копирование во внутренний буфер
nnoremap Y y<END>

" более логичная запись макроса
nnoremap Q qq

" поиск слова под курсором не целиком
nnoremap * g*N
nnoremap # g#N

" поиск в выделенном тексте
vnoremap g/ <ESC>/\%V

" фикс для gg при включённом nostartofline
nnoremap gg gg<HOME>
vnoremap gg gg<HOME>

" фикс для G при включённом nostartofline
nnoremap G G<END>
vnoremap G G<END>

" не перепрыгивать через длинные строки при включённом переносе строк
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

" сохранять строку курсора при page up/down
nnoremap <PAGEUP> <C-U>
nnoremap <PAGEDOWN> <C-D>
inoremap <PAGEUP> <C-O><C-U>
inoremap <PAGEDOWN> <C-O><C-D>
vnoremap <PAGEUP> <C-U>
vnoremap <PAGEDOWN> <C-D>

" новая вкладка
nnoremap <C-T> :tabnew<CR>
inoremap <C-T> <C-O>:tabnew<CR>
vnoremap <C-T> <ESC>:tabnew<CR>

" предыдущая вкладка
nnoremap <silent><A-LEFT> :call TabAction("jump", "left")<CR>
inoremap <silent><A-LEFT> <C-O>:call TabAction("jump", "left")<CR>
vnoremap <silent><A-LEFT> <ESC>:call TabAction("jump", "left")<CR>

" следующая вкладка
nnoremap <silent><A-RIGHT> :call TabAction("jump", "right")<CR>
inoremap <silent><A-RIGHT> <C-O>:call TabAction("jump", "right")<CR>
vnoremap <silent><A-RIGHT> <ESC>:call TabAction("jump", "right")<CR>

" первая вкладка
nnoremap <A-UP> :tabfirst<CR>
inoremap <A-UP> <C-O>:tabfirst<CR>
vnoremap <A-UP> <ESC>:tabfirst<CR>

" последняя вкладка
nnoremap <A-DOWN> :tablast<CR>
inoremap <A-DOWN> <C-O>:tablast<CR>
vnoremap <A-DOWN> <ESC>:tablast<CR>

" переместить вкладку в начало
nnoremap <A-S-UP> :tabmove 0<CR>
inoremap <A-S-UP> <C-O>:tabmove 0<CR>
vnoremap <A-S-UP> <ESC>:tabmove 0<CR>

" переместить вкладку в конец
nnoremap <A-S-DOWN> :tabmove<CR>
inoremap <A-S-DOWN> <C-O>:tabmove<CR>
vnoremap <A-S-DOWN> <ESC>:tabmove<CR>

" переместить вкладку назад
nnoremap <silent><A-S-LEFT> :call TabAction("move", "left")<CR>
inoremap <silent><A-S-LEFT> <C-O>:call TabAction("move", "left")<CR>
vnoremap <silent><A-S-LEFT> <ESC>:call TabAction("move", "left")<CR>

" переместить вкладку вперёд
nnoremap <silent><A-S-RIGHT> :call TabAction("move", "right")<CR>
inoremap <silent><A-S-RIGHT> <C-O>:call TabAction("move", "right")<CR>
vnoremap <silent><A-S-RIGHT> <ESC>:call TabAction("move", "right")<CR>

" умный прыжок в начало строки
nnoremap <silent><HOME> :call SmartHome("n")<CR>
inoremap <silent><HOME> <C-R>=SmartHome("i")<CR>
vnoremap <silent><HOME> <ESC>:call SmartHome("v")<CR>

" умный прыжок в конец строки
nnoremap <silent><END> :call SmartEnd("n")<CR>
inoremap <silent><END> <C-R>=SmartEnd("i")<CR>
vnoremap <silent><END> <ESC>:call SmartEnd("v")<CR>

" заворачиваем текст в теги
vnoremap <silent>,w <ESC>:call VisualTagsWrap()<CR>

" переходим в конец поискового совпадения
nnoremap <silent>,n //e<CR>:let @/=@/<CR>

" выделяем блок текста по разделителям
nnoremap <silent>,b <ESC>:call SelectBlock()<CR>

" поиск выделенного текста
vnoremap <silent>* <ESC>:call VisualSearch("?")<CR>?<CR>/<CR>
vnoremap <silent># <ESC>:call VisualSearch("/")<CR>/<CR>?<CR>

" добавление в не именованный регистр
nnoremap yY :call YankAppend("n")<CR>
vnoremap Y <ESC>:call YankAppend("v")<CR>

" удалить пробелы в конце строк
nnoremap <silent>,t :call RemoveTrailingSpaces()<CR>:echo "trailing spaces removed"<CR>

" быстрая справка
nnoremap <F1> :help<SPACE>
inoremap <F1> <C-O>:help<SPACE>
vnoremap <F1> <ESC>:help<SPACE>

" сохранить
nnoremap <F2> :w<CR>
inoremap <F2> <C-O>:w<CR>
vnoremap <F2> <ESC>:w<CR>

" сохранить всё
nnoremap <C-F2> :wall<CR>
inoremap <C-F2> <C-O>:wall<CR>
vnoremap <C-F2> <ESC>:wall<CR>

" скрыть результаты поиска
nnoremap <F3> :nohlsearch<CR>:echo "nohlsearch"<CR>
inoremap <F3> <C-O>:nohlsearch<CR><C-O>:echo "nohlsearch"<CR>
vnoremap <F3> <ESC>:nohlsearch<CR>:echo "nohlsearch"<CR>

" перенос строк
nnoremap <F4> :setlocal wrap! wrap?<CR>
inoremap <F4> <C-O>:setlocal wrap! wrap?<CR>
vnoremap <F4> <ESC>:setlocal wrap! wrap?<CR>

" меню выбора типа конца строк
nnoremap <F5> :emenu File.EOL.<TAB>
inoremap <F5> <C-O>:emenu File.EOL.<TAB>
vnoremap <F5> <ESC>:emenu File.EOL.<TAB>

" меню выбора кодировки сохранения
nnoremap <F6> :emenu File.Encoding.Write.<TAB>
inoremap <F6> <C-O>:emenu File.Encoding.Write.<TAB>
vnoremap <F6> <ESC>:emenu File.Encoding.Write.<TAB>

" меню выбора кодировки чтения
nnoremap <F7> :emenu File.Encoding.Read.<TAB>
inoremap <F7> <C-O>:emenu File.Encoding.Read.<TAB>
vnoremap <F7> <ESC>:emenu File.Encoding.Read.<TAB>

" меню проверки орфографии
nnoremap <F8> :emenu File.Spell.<TAB>
inoremap <F8> <C-O>:emenu File.Spell.<TAB>
vnoremap <F8> <ESC>:emenu File.Spell.<TAB>

" меню открытия внешней программой
nnoremap <F9> :emenu File.Preview.<TAB>
inoremap <F9> <C-O>:emenu File.Preview.<TAB>
vnoremap <F9> <ESC>:emenu File.Preview.<TAB>

" закрыть буфер
nnoremap <F10> :confirm q<CR>
inoremap <F10> <C-O>:confirm q<CR>
vnoremap <F10> <ESC>:confirm q<CR>

" закрыть всё
nnoremap <C-F10> :confirm qall<CR>
inoremap <C-F10> <C-O>:confirm qall<CR>
vnoremap <C-F10> <ESC>:confirm qall<CR>

" перенос строк
nnoremap <F12> :setlocal paste! paste?<CR>
inoremap <F12> <C-O>:setlocal paste! paste?<CR>
vnoremap <F12> <ESC>:setlocal paste! paste?<CR>

" --- меню ---

if has("menu")

	" меню выбора типа конца строк
	anoremenu &File.&EOL.&unix :setlocal fileformat=unix fileformat?<CR>
	anoremenu &File.&EOL.&dos :setlocal fileformat=dos fileformat?<CR>
	anoremenu &File.&EOL.&mac :setlocal fileformat=mac fileformat?<CR>

	" меню выбора кодировки сохранения
	anoremenu &File.E&ncoding.&Write.&utf-8 :setlocal fileencoding=utf-8 fileencoding?<CR>
	anoremenu &File.E&ncoding.&Write.&windows-1251 :setlocal fileencoding=windows-1251 fileencoding?<CR>
	anoremenu &File.E&ncoding.&Write.&iso-8859-15 :setlocal fileencoding=iso-8859-15 fileencoding?<CR>
	anoremenu &File.E&ncoding.&Write.&koi8-r :setlocal fileencoding=koi8-r fileencoding?<CR>

	" меню выбора кодировки чтения
	anoremenu &File.E&ncoding.&Read.&utf-8 :edit ++enc=utf-8<CR>:setlocal fileencoding?<CR>
	anoremenu &File.E&ncoding.&Read.&windows-1251 :edit ++enc=windows-1251<CR>:setlocal fileencoding?<CR>
	anoremenu &File.E&ncoding.&Read.&iso-8859-15 :edit ++enc=iso-8859-15<CR>:setlocal fileencoding?<CR>
	anoremenu &File.E&ncoding.&Read.&koi8-r :edit ++enc=koi8-r<CR>:setlocal fileencoding?<CR>

	" меню проверки орфографии
	anoremenu &File.&Spell.&Combined :setlocal spell spelllang=ru_yo,en_us spelllang?<CR>
	anoremenu &File.&Spell.&Russian :setlocal spell spelllang=ru_yo spelllang?<CR>
	anoremenu &File.&Spell.&English :setlocal spell spelllang=en_us spelllang?<CR>
	anoremenu &File.&Spell.&Off :setlocal nospell spelllang= spelllang?<CR>

	" меню открытия внешней программой
	anoremenu &File.&Preview.&Firefox :!firefox %<CR>
	anoremenu &File.&Preview.&Opera :!opera %<CR>
	anoremenu &File.&Preview.&Midori :!midori %<CR>

endif

" --- авто-команды ---

if has("autocmd")

	" переопределять переменные для некоторых типов файлов
	autocmd! filetype help,man setlocal nonumber

	" переопределять переменные для некоторых файлов по расширению
	autocmd! bufnewfile,bufread *.tpl_dev setlocal filetype=smarty

	" прыгать на последнюю позицию при открытии буфера
	autocmd! bufreadpost * call LastPosition()

	" сохранять умные резервные копии ежедневно
	autocmd! bufwritepre * call BackupDir()

	" закрывать preview автоматически при закрытии omni
	autocmd! cursormovedi,insertleave * if !pumvisible() | pclose | endif

	" автоматически перечитывать файл конфигурации VIM после его сохранения
	autocmd! bufwritepost $MYVIMRC source $MYVIMRC

endif

" --- функции ---

if exists("*function")

	" убиваем последний введённый символ
	function! EatChar()
		let l:char=getchar(0)
		return ""
	endfunction

	" управляем вкладками
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

	" умный прыжок в начало строки
	function! SmartHome(mode)
		let l:curcol=col(".")
		if l:curcol>indent(".")+2
			call cursor(0, l:curcol-1)
		endif
		if l:curcol==1
			if &wrap
				normal! g^
			else
				normal! ^
			endif
		else
			if &wrap
				normal! g0
			else
				normal! 0
			endif
		endif
		if a:mode=="v"
			normal! msgv`s
		endif
		return ""
	endfunction

	" умный прыжок в конец строки
	function! SmartEnd(mode)
		let l:curcol=col(".")
		let l:lastcol=col("$")
		if a:mode!="i"
			let l:lastcol-=1
		endif
		if l:curcol<l:lastcol-1
			call cursor(0, l:curcol+1)
		endif
		if l:curcol<l:lastcol
			if &wrap
				normal! g$
			else
				normal! $
			endif
		else
			normal! g_
		endif
		if a:mode=="i"
			call cursor(0, col(".")+1)
		elseif a:mode=="v"
			normal! msgv`s
		endif
		return ""
	endfunction

	" поиск выделенного текста
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

	" добавление в не именованный регистр
	function! YankAppend(mode)
		let l:register=@"
		if a:mode == "n"
			normal! yy
		else
			normal! gvy
		endif
		let l:yank=@"
		let @"=l:register.l:yank
	endfunction

	" прыгать на последнюю позицию при открытии буфера
	function! LastPosition()
		if line("'\"") && line("'\"")<=line("$")
			normal! `"
		endif
	endfunction

	" сохранять умные резервные копии ежедневно
	function! BackupDir()
		if !exists("g:backupdir_default")
			let g:backupdir_default=&backupdir
		endif
		let l:backupdir=g:backupdir_default
		if &backup
			if has("unix")
				let l:backupdir.=substitute(expand("%:p:h"), "^".$HOME, "~", "")
			else
				let l:backupdir.=substitute(expand("%:p:h"), ":", "$", "")
			endif
			if !isdirectory(l:backupdir)
				call mkdir(l:backupdir, "p", 0700)
			endif
		endif
		let &backupdir=l:backupdir
		let &backupext=strftime("~%Y-%m-%d~")
	endfunction

	" заворачиваем текст в теги
	function! VisualTagsWrap()
		if !exists("g:tags_to_wrap")
			let g:tags_to_wrap=[]
		endif
		let g:tags_to_wrap=split(input("space separated tags to wrap block: ", join(g:tags_to_wrap, " ")), "\s\+")
		if len(g:tags_to_wrap)>0
			let l:start=remove(getpos("'<"), 1, 2)
			let l:end=remove(getpos("'>"), 1, 2)
			let l:current=remove(getpos("."), 1, 2)
			execute "normal! `>a</".join(reverse(g:tags_to_wrap), "></").">"
			execute "normal! `<i<".join(reverse(g:tags_to_wrap), "><").">"
			let l:length=len(join(g:tags_to_wrap, "><"))+1
			if l:start[0]==l:end[0]
				if l:start==l:current
					execute "normal! `>".l:length."lv`<".(l:length+1)."lvh"
				else
					execute "normal! `<".(l:length+1)."lv`>".l:length."lv`<h"
				endif
			else
				if l:start==l:current
					execute "normal! `>v`<".(l:length+1)."lvh"
				else
					execute "normal! `<".(l:length+1)."lv`>v`<h"
				endif
			endif
		endif
	endfunction

	" выделяем блок текста по разделителям
	function! SelectBlock()
		if !exists("g:separators_to_select")
			let g:separators_to_select=""
		endif
		let g:separators_to_select=input("separator(s) to select block: ", g:separators_to_select)
		if len(g:separators_to_select)>0
			if len(g:separators_to_select)>1
				execute "normal! F".g:separators_to_select[0]."v"
				for n in range(1, len(g:separators_to_select)-1)
					execute "normal! f".g:separators_to_select[n]
				endfor
			else
				execute "normal! F".g:separators_to_select."vf".g:separators_to_select
			endif
		endif
	endfunction

	" удалить пробелы в конце строк
	function! RemoveTrailingSpaces()
		normal! mzHmy
		execute "%s:\\s\\+$::ge"
		normal! 'yzt`z
	endfunction

endif

" --- всячина ---

" проверим и создадим каталог под резервные копии
if !isdirectory(&backupdir)
	call mkdir(&backupdir, "p", 0700)
endif

" проверим и создадим каталог под swap
if !isdirectory(&directory)
	call mkdir(&directory, "p", 0700)
endif

" попробуем прочитать локальный файл конфигурации
if filereadable($HOME.'/.vimrc.local')
	source $HOME.'/.vimrc.local'
endif

set tabstop=4
set shiftwidth=4
set smarttab
set et " включим автозамену по умолчанию

set wrap " попросим Vim переносить длинные строки

set ai " включим автоотступы для новых строк
set cin " включим отступы в стиле Си

" Далее настроим поиск и подсветку результатов поиска и совпадения скобок
set showmatch
set hlsearch
set incsearch
set ignorecase

set lz " ленивая перерисовка экрана при выполнении скриптов

" Порядок применения кодировок и формата файлов

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" Взаимодействие и элементы интерфейса

if !has('gui_running')
set mouse=
endif

set guioptions-=T
set guioptions-=m

if has('gui')
colorscheme darkblue
if has('win32')
set guifont=Lucida_Console:h12:cRUSSIAN::
else
set guifont=Terminus\ 14
endif
endif

if has('gui')
if has('win32')
au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
elseif has('gui_gtk2')
au GUIEnter * :set lines=99999 columns=99999
endif
endif

if has('win32')
set makeprg=nmake
compiler msvc
else
set makeprg=make
compiler gcc
endif

colorscheme torte

" Plugin related configs
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
let g:SuperTabDefaultCompletionType = "context"

" vim:tabstop=4 softtabstop=4 shiftwidth=4
