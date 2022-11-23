" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
" Showmatch is what causes the jumping.
" I am disabling it b/c it is HIGHLY annoying
set noshowmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

set number
set relativenumber

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" For handling UTF-8 files
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" https://github.com/junegunn/vim-plug
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'ap/vim-css-color'
Plug 'lervag/vimtex', { 'tag': 'v1.0' }
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

" 'xelatex --interaction=nonstopmode --shell-escape $*'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-shell-escape',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

let g:vimtex_quickfix_latexlog = {
        \ 'packages' : { 
        \   'hyperref' : 0,
        \ },
        \}

let g:vimtex_quickfix_ignore_filters = [
      \ '.*Cannot patch .*, using .* instead..*',
      \]

let g:vimtex_fold_enabled=1

let g:vimtex_view_method = 'zathura'

" https://vi.stackexchange.com/questions/20560/why-does-vim-still-auto-indent-latex-after-i-set-noai-noci-nosi
let g:vimtex_indent_ignored_envs = ['code', 'minted', 'itemize', 'enumerate']

augroup MyVimtex
  autocmd!
  autocmd User VimtexEventQuit call vimtex#compiler#clean(0)
  " need to also remove _minted cache
augroup END

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set tabstop=4
set softtabstop=4
set shiftwidth=4

set cursorline

set foldmethod=syntax   
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2

set conceallevel=1

" autocmd FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType text setlocal shiftwidth=4 tabstop=4 expandtab

set scrolloff=5

set nowrap

set exrc

set mouse=a

let g:python3_host_prog = '/usr/bin/python'

" https://vimways.org/2018/vim-and-git/
set autoread
autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"autocmd filetype matlab nnoremap <localleader>rr <silent> <buffer> :split | execute 'terminal ...

