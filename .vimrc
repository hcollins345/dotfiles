" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"
" LINUX
""runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" VUNDLE REQUIREMENTS
set nocompatible              " be iMproved, required
filetype off                  " required

" WINDOWS Portable =======================
"source $VIMRUNTIME/vimrc_example.vim
"let $vundle = "D:/windows_tools/Vim/vimfiles/Vundle"
"set rtp+=$vundle
"call vundle#begin("D:/windows_tools/Vim/vimfiles")
"set encoding=utf-8 ""for YCM (windows)


" LINUX Desktop =======================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"----------------------------- Vundle PLUGINS ------------------------------------------
"run :PluginInstall after saving (might have to reload vimrc)
"Syntax and code completion
Plugin 'jmarkow/vim-matlab'
Plugin 'stevearc/vim-arduino'
Plugin 'elmanuelito/vim-matlab-behave'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-latex/vim-latex'
Plugin 'vivien/vim-linux-coding-style'
	
"rmarkdown
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-rmarkdown'

"Plugin 'sudar/vim-arduino-syntax'

"snippets
"Plugin 'SirVer/ultinips'   
"all arduino stuff looks to be in stevearc/vim-arduino
"Plugin 'sudar/vim-arduino-snippets'

"Plugin 'suan/vim-instant-markdown'

"Colorschemes
"Plugin 'vim-scripts/CSApprox'
"Plugin 'KevinGoodsell/vim-csexact'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

"Distraction free
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

"VIMWIKI
Plugin 'vimwiki/vimwiki'

"OTHER
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on
filetype plugin on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"END VUNDLE REQUIREMENTS

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif
:syntax enable

"======================== ColorScheme/ SynTax/ Spelling  =======================
"GRUVBOX
" Italics are disabled by default (has to be before colorscheme gruvbox), 
" also gruvbox has light and dark themes like solarized.
let g:gruvbox_italic=1 

" Gives terminal vim the same color options as 256???
set termguicolors


let g:pandoc#syntax#conceal#use = 1

colorscheme gruvbox
set background=dark

if has('gui_running')

else
	hi SpellBad guifg=Red
endif

hi SpellBad cterm=bold ctermfg=1 

"======================= Random Plugin Configs =============================
"VIM-LATEX
let g:tex_flavor='latex'
"I don't know what this is for but the $* creates an error message
"set grepprg=grep\ -nH $*
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown','ext': '.md', 'auto_tags': 1}]

"Pandoc/ Rmarkdown
let g:pandoc#folding#fdc = 0

"Arduino Directory
let g:arduino_dir = '~/Applications/Arduino'

"YouCompleteMe 
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1


"========================= FileType Indentation ========================
"
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
set ts=2 sts=2 sw=2
if has("autocmd")
  filetype on
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 
  autocmd FileType python setlocal ts=4 sts=4 sw=4 
  autocmd FileType html setlocal ts=2 sts=2 sw=2 
  autocmd FileType css setlocal ts=4 sts=4 sw=4 
  autocmd FileType matlab setlocal ts=4 sw=4 
  autocmd FileType tex setlocal sw=2 sts=2 ts=2
  autocmd FileType LaTex setlocal sw=2 sts=2 ts=2
	autocmd FileType sh setlocal sw=4 ts=4
	autocmd FileType markdown setlocal ts=4 sts=4 sw=4
	autocmd FileType rmd setlocal ts=4 sts=4 sw=4 
	autocmd BufRead,BufNewFile *.pde set filetype=arduino
	autocmd BufRead,BufNewFile *.ino set filetype=arduino
  filetype plugin indent on
endif

"======================= General Mappings =============================
" trigger line numbering
nmap <C-N><C-N> :set invnumber<CR>

" fold settings 
set foldlevel=1
nnoremap <space> za

" tmux settings
set splitright
" all this vimux stuff appears to be shit
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

"======================= FileType Mappings ============================
:let mapleader = ","

"MARKDOWN
  autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
  autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
  autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
  autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
  autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
  autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
  autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
  "autocmd Filetype markdown,rmd map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
  autocmd Filetype markdown,rmd map <F6> i---<CR>title: <++><CR>subtitle: <++><CR>author: Harry Collins<CR>date: '<C-r>=strftime('%c')<CR><++>'<CR>output: <++>pdf_document<CR>urlcolor: <++>blue<CR>linkcolor: <++>black<CR>---<CR><CR><++><C-j>
  autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
  autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO

  if exists('$TUX')
    autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--latex-engine=xelatex<space>-o<space>%:t:r.pdf<space>--verbose<Enter><Enter>
    autocmd Filetype rmd map <F5> :call VimuxRunCommand("echo<space>$'require(rmarkdown);<space>render('~/test.Rmd')'<space>\|<space>R<space>--vanilla")<CR>
    autocmd Filetype rmd map <F7> :!<space>xreader<space>%:t:r.pdf<space>&<CR>
  else 
    autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--latex-engine=xelatex<space>-o<space>%:t:r.pdf<space>--verbose<Enter><Enter>
    autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
    autocmd Filetype rmd map <F7> :!<space>xreader<space>%:t:r.pdf<space>&<CR>
  endif


"ARDUINO
	autocmd FileType arduino nnoremap <buffer> <leader>am :ArduinoVerify<CR>
	autocmd FileType arduino nnoremap <buffer> <leader>au :ArduinoUpload<CR>
	autocmd FileType arduino nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
	autocmd FileType arduino nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
	autocmd FileType arduino nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

	"Sparql
  autocmd BufRead,BufNewFile *.rq map <F5> :!<space>sparql.bat<space>--data=royal92.nt<space>--query=%<CR>



"======================== Vim configs ================================
"
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set backspace=indent,eol,start " allow backspacing over indent, start of line and start
set expandtab  " turns tabs to spaces
set clipboard=unnamed  " uses the OS clipboard for copying and pasting

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

