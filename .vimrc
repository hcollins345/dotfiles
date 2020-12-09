" SHIT {{{
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
"" runtime! debian.vim
" }}}
" ===== INIT SETTINGS AND VUNDLE REQUIREMENTS {{{
set nocompatible              " be iMproved, required
filetype off                  " required
" WINDOWS Portable =======================
"source $VIMRUNTIME/vimrc_example.vim
"let $vundle = "D:/windows_tools/Vim/vimfiles/Vundle"
"set rtp+=$vundle
"call vundle#begin("D:/windows_tools/Vim/vimfiles")
" LINUX Desktop ==========================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
call vundle#begin()
" End OS choice===========================
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}
" ===== PLUGINS {{{
"run :PluginInstall after saving (might have to reload vimrc)
"Syntax and code completion
Plugin 'jmarkow/vim-matlab'
Plugin 'stevearc/vim-arduino'
Plugin 'elmanuelito/vim-matlab-behave'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-latex/vim-latex'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'Raimondi/delimitMate'

Plugin 'python_match.vim'
Plugin 'matchit.zip'
"T Pope
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
"rmarkdown
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-rmarkdown'
"Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
"Distraction free
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
"VIMWIKI
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown'
"NERDTree
Plugin 'scrooloose/nerdtree'
"MiniMap
"Plugin 'severin-lemaignan/vim-minimap'
"Folding
Plugin 'tmhedberg/SimpylFold' "python
"OTHER
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}

call vundle#end()            " required
filetype plugin indent on    " required
filetype indent on
filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"END VUNDLE REQUIREMENTS
if has("syntax")
  syntax on
endif
:syntax enable
" }}}
"===== ColorScheme/ SynTax/ Spelling  {{{ 
let g:gruvbox_italic=1 
set termguicolors " Gives terminal vim the same color options as 256???
let g:pandoc#syntax#conceal#use = 1
colorscheme gruvbox
set background=dark
if has('gui_running')
	set guifont=Lucida_Console:h12:cDEFAULT
else
	hi SpellBad guifg=Red
endif
hi SpellBad cterm=bold ctermfg=1 
" }}}
"===== Plugin Configs {{{
"vim fugitive
set diffopt+=vertical
"VIM-LATEX
let g:tex_flavor='latex'
"I don't know what this is for but the $* creates an error message
"set grepprg=grep\ -nH $*
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"VimWiki
let g:vimwiki_list = [{'path': '~/dotfiles/vimwiki/', 'syntax': 'markdown','ext': '.md', 'auto_tags': 1}]
let g:instant_markdown_autostart = 0
let g:vimwiki_ext2syntax = {'.md': 'markdown'}

"Pandoc/ Rmarkdown
let g:pandoc#folding#fdc = 0
"Arduino Directory
let g:arduino_dir = '~/Applications/Arduino'
"YouCompleteMe 
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
  " runs <c-space> after 2 letters
let g:ycm_semantic_triggers = {
	\   'python': [ 're!\w{2}' ]
	\ }
  " This doesn't work with python, but there is options like GoToDefinition
  " etc
map <leader>g :YcmCompleter GoToImplementationElseDeclaration<CR>
map <leader>i :YcmCompleter GetDoc<CR>

" Python Folding (uncomment to see docstrings)
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring	= 0

"powerline
set laststatus=2 " 2 to Always display the statusline in all windows
"set showtabline=2 " Always display the tabline, even if there is only one tab
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set t_Co=256
let g:Powerline_symbols = 'fancy'
"https://powerline.readthedocs.io/en/latest/configuration.html#quick-setup-guide

"NERDTree
let NERDTreeMinimalUI = 1
" }}}
"===== FileType Indentation {{{
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
	autocmd FileType markdown setlocal ts=2 sts=2 sw=2
	autocmd FileType rmd setlocal ts=2 sts=2 sw=2 
	autocmd BufRead,BufNewFile *.pde set filetype=arduino
	autocmd BufRead,BufNewFile *.ino set filetype=arduino
  filetype plugin indent on
endif
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --encode UTF-8 --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
"}}}
"===== MAPPINGS {{{

let mapleader = ","
"----- Plugin Mappings {{{

" Commentary
map cm <Plug>Commentary

" NERDTree
map <leader>n :NERDTreeToggle<CR>

" Vimwiki
nmap <silent><buffer> <Leader>wc <Plug>Vimwiki2HTML

"}}}
"----- General Mappings {{{

" stops undoable undo
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" trigger line numbering
nmap <leader>nn :set invnumber<CR>
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
" }}}
"----- FileType Mappings {{{
"MARKDOWN
  autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
  autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
  autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
  autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
  autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
  autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
  "image
  autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
  "links
  autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
  autocmd Filetype markdown,rmd inoremap ;eq \begin{align}<CR><CR>\end{align}<CR><++><Esc>kki<space><space>
  autocmd Filetype markdown,rmd inoremap ;hr \hyperref[]{<++> \autoref{<++>}}<Esc>21hi
  "autocmd Filetype markdown,rmd map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
  autocmd Filetype markdown,rmd map <F6> i---<CR>title: <++><CR>subtitle: <++><CR>author: Harry Collins<CR>date: '<C-r>=strftime('%c')<CR><++>'<CR>output: <++>pdf_document<CR>urlcolor: <++>blue<CR>linkcolor: <++>black<CR>---<CR><CR><++><C-j>
  autocmd Filetype markdown,rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
  autocmd Filetype markdown,rmd inoremap ;p ```{python echo=FALSE, fig.cap=''}<CR>```<CR><CR><esc>2kO
  if exists('$TUX')
    autocmd Filetype markdown map <buffer> <F5> :!pandoc<space><C-r>%<space>--latex-engine=xelatex<space>-o<space>%:t:r.pdf<space>--verbose<Enter><Enter>
    autocmd Filetype rmd map <buffer> <F5> :call VimuxRunCommand("echo<space>$'require(rmarkdown);<space>render('~/test.Rmd')'<space>\|<space>R<space>--vanilla")<CR>
    autocmd Filetype rmd map <F7> :!<space>xreader<space>%:t:r.pdf<space>&<CR>
  else 
    autocmd Filetype markdown map <buffer> <F5> :!pandoc<space><C-r>%<space>--latex-engine=xelatex<space>-o<space>%:t:r.pdf<space>--verbose<Enter><Enter>
    autocmd Filetype rmd map <buffer> <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
    autocmd Filetype markdown,rmd map <F7> :!<space>xreader<space>%:t:r.pdf<space>&<CR>
  endif
"ARDUINO
	autocmd FileType arduino nnoremap <buffer> <leader>am :ArduinoVerify<CR>
	autocmd FileType arduino nnoremap <buffer> <leader>au :ArduinoUpload<CR>
	autocmd FileType arduino nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
	autocmd FileType arduino nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
	autocmd FileType arduino nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>
	"Sparql
  autocmd BufRead,BufNewFile *.rq map <F5> :!<space>sparql.bat<space>--data=royal92.nt<space>--query=%<CR>
  "Py
  autocmd BufRead,BufNewFile *.py map <buffer> <F5> :!<space>python<space>%<CR>
  "ipynb
  autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
  autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
  autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>
" }}}
" }}}
"===== Vim configs {{{
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
set clipboard=unnamedplus " uses the OS clipboard for copying and pasting
set encoding=utf-8
set history=10000
"new (tobe checked)
set scrolloff=1
set sidescrolloff=5
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif "makes :set list (visible whitespace prettier)
set ruler
set wildmenu
set autoread "autoupdate changes in file
set display+=lastline
set formatoptions+=j " Delete comment character when joining commented lines
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
set smarttab
set autoindent
" }}}
" ===== Extra {{{

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
	autocmd bufwritepost .vimrc nested :source $MYVIMRC
endif

" vim: set fdm=marker fmr={{{,}}} fdl=0 :
"}}}
