" WSL {{{
function! IsWSL()
  if has("unix")
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
      return 1
    endif
  endif
  return 0
endfunction
"}}}
" ===== HOT FIXES {{{
" fix always starting in REPLACE mode in WSL in Windows after upgrading vim
set t_u7=
set t_ut=
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
"Search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"editorconfig
Plugin 'editorconfig/editorconfig-vim'
"Extend % functionality (python_match might be a superset of matchit.zip)
Plugin 'python_match.vim'
Plugin 'matchit.zip'
"T Pope
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
"rmarkdown
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-rmarkdown'
"Colorschemes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ericbn/vim-solarized'
Plugin 'rakr/vim-one'
Plugin 'sakibmoon/vim-colors-notepad-plus-plus'
Plugin 'ayu-theme/ayu-vim' " or other package manager
" Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'bluz71/vim-nightfly-guicolors'
"Distraction free
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
"VIMWIKI
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown'
"NERDTree
Plugin 'scrooloose/nerdtree'
"MiniMap <leader>mm and <leader>mc
Plugin 'severin-lemaignan/vim-minimap'
"Folding for python
Plugin 'tmhedberg/SimpylFold'
"Panes
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
"Powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
"Can be used to generate tags/xml quickly - google emmet
Plugin 'mattn/emmet-vim'
"Git- highlights changes between file and latest commit
Plugin 'airblade/vim-gitgutter'
"Extends ci" functionality to ({[ etc and adds arguements ie. c4ana
Plugin 'wellle/targets.vim'
"Save vim sessions easier (used by tmux-resurrect)
Plugin 'tpope/vim-obsession'

call vundle#end()            " required
filetype plugin indent on    " required
"filetype indent on
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"END VUNDLE REQUIREMENTS
if !exists("g:syntax_on")
    syntax enable
endif
" }}}
runtime! plugin/sensible.vim
"===== ColorScheme/ SynTax/ Spelling  {{{
" Enable True color or 256 if not available (I think)
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors " Gives terminal vim the same color options as 256

let g:gruvbox_italic=1
let g:one_allow_italics = 1
let g:nightflyUnderlineMatchParen = 1
let g:nightflyCursorColor = 1

highlight clear signcolumn

set background=light
"Colorscheme
" colorscheme gruvbox
" colorscheme base16-flat
" colorscheme solarized
" colorscheme PaperColor
" colorscheme one
" colorscheme nightfly
" colorscheme notepad-plus-plus
" let ayucolor="light"| colorscheme ayu   " 'light', 'mirage', 'dark'
" let ayucolor="mirage"| colorscheme ayu   " 'light', 'mirage', 'dark'
let ayucolor="dark"| colorscheme ayu   " 'light', 'mirage', 'dark'

if !has('gui_running')
  hi SpellBad guifg=Red
endif
hi SpellBad cterm=bold ctermfg=1

"airline https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_powerline_fonts = 1
" let g:airline_theme='simple'
" let g:airline_theme='distinguished'
let g:airline_theme='bubblegum'
" let g:airline_theme='molokai'
" let g:airline_theme='deus'
" let g:airline_theme='gruvbox'
" let g:airline_theme='powerlineish'
" let g:airline_theme='solarized' | let g:airline_solarized_bg='light'
" let g:airline_theme='one'
" let g:airline_theme='dark' "'dark','simple','badwolf','dues','powerlineish','solarized','luna','molokai',

" Clear gitgutter sign column highlighting
highlight clear signcolumn

" }}}
"===== Plugin Configs {{{
"vim fugitive
set diffopt+=vertical

"VIM-LATEX
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"VimWiki
let g:vimwiki_list = [{'path': '~/dotfiles/vimwiki/', 'syntax': 'markdown','ext': '.md', 'auto_tags': 1}]
let g:instant_markdown_autostart = 0
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown','.rmd': 'markdown','.md':'markdown','.markdown': 'markdown','.mddown': 'markdown',}

"Pandoc/ Rmarkdown
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#folding#fdc = 0

"Arduino Directory
let g:arduino_dir = '~/Applications/Arduino'

" Gitgutter
set foldtext=gitgutter#fold#foldtext()
" set signcolumn=number " use number column as signcolumn

"YouCompleteMe
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
  " runs <c-space> after 2 letters
let g:ycm_semantic_triggers = {
  \   'python': [ 're!\w{2}' ]
  \ }
map gd :YcmCompleter GoTo<CR>
map gi :YcmCompleter GetDoc<CR>

"fzf
map ; :Files<CR>

" Python Folding (uncomment to see docstrings)
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

"airline https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_powerline_fonts = 1
let g:airline#extensions#obsession#enabled = 1
set laststatus=2 " 2 to Always display the statusline in all windows
"set showtabline=2 " Always display the tabline, even if there is only one tab
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
" }}}
"===== MAPPINGS {{{

let mapleader = ","
"----- Plugin Mappings {{{

" Goyo
map <leader>f :Goyo \| set linebreak<CR>

" Commentary
map cm <Plug>Commentary

"GitGutter
nmap <leader>GG :GitGutterToggle<CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>

" Vimwiki
nmap <silent><buffer> <Leader>wc <Plug>Vimwiki2HTML

"}}}
"----- General Mappings {{{
" Prevent x form overriding what's in the clipboard
noremap x "_x
noremap X "_x
" stops undoable undo
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" Substitution shortcut
nnoremap S :%s//g<Left><Left>

nmap <leader>nn :set number! relativenumber!<CR>| " line numbering :set nu! rnu!
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

map <leader>o :setlocal spell! spelllang=en_gb<CR>| "spellcheck, o for orthography

" fold settings
set foldlevel=1
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set splitright " tmux settings

" vimux
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>|  "Inspect runner pane
map <Leader>vz :VimuxZoomRunner<CR>|  "Zoom the tmux runner pane
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
  autocmd Filetype markdown,rmd map <F6> i---<CR>title: <++><CR>subtitle: <++><CR>author: Harry Collins<CR>date: '<C-r>=strftime('%c')<CR><++>'<CR>output: <++>pdf_document<CR>urlcolor: <++>blue<CR>linkcolor: <++>black<CR>---<CR><CR><++><C-j>
  autocmd Filetype markdown,rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
  autocmd Filetype markdown,rmd inoremap ;p ```{python echo=FALSE, fig.cap=''}<CR>```<CR><CR><esc>2kO
  if exists('$TMUX')
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
  if IsWSL()
    autocmd BufRead,BufNewFile *.py map <buffer> <F5> :!<space>python.exe<space>%<CR>
  else
    autocmd BufRead,BufNewFile *.py map <buffer> <F5> :!<space>python<space>%<CR>
  endif
  "ipynb
  autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
  autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
  autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>
" }}}
"----- External Command Mappings {{{
map <leader>s :!clear && shellcheck %<CR>
" }}}
" }}}
"===== Vim configs {{{
set noesckeys
" change cursor style depending on mode
let &t_EI = "\<Esc>[1 q"
let &t_SR = "\<Esc>[3 q"
let &t_SI = "\<Esc>[5 q"
" set diffopt+=iwhite
" set diffexpr=""
set wildmode=longest,list,full " Enable Autocompletion
set showcmd   " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase    " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
set hidden    " Hide buffers when they are abandoned
set mouse=a   " Enable mouse usage (all modes)
set backspace=indent,eol,start " allow backspacing over indent, start of line and start
set expandtab  " turns tabs to spaces
set clipboard=unnamedplus " uses the OS clipboard for copying and pasting
set encoding=utf-8
set history=10000
set updatetime=100
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
"I don't know what this is for but the $* creates an error message
"set grepprg=grep\ -nH $*
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
  autocmd FileType markdown setlocal ts=2 sts=2 sw=2 tw=79
  " autocmd FileType rmd setlocal ts=2 sts=2 sw=2
  autocmd FileType xml setlocal noexpandtab
  autocmd BufRead,BufNewFile *.pde,*.ino set filetype=arduino
  autocmd BufRead,BufNewFile *.tex set filetype=tex
  filetype plugin indent on
endif
"}}}
"===== Functions {{{
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
autocmd! bufwritepost .vimrc source ~/.vimrc

" vim: set fdm=marker fmr={{{,}}} fdl=0 :
"}}}
