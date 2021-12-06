set nocompatible              " be iMproved, required
set noerrorbells
set hidden
set nobackup
set nowritebackup
set number
set smartindent
set noswapfile
set incsearch
set nopaste
set nolist
set termguicolors

set tabstop=4 softtabstop=4
set shiftwidth=4
set cmdheight=1
set updatetime=300
set shortmess+=c
set laststatus=2
set colorcolumn=
set clipboard=unnamed

"enable backspace key
set backspace=indent,eol,start

syntax on
filetype plugin indent on    " required

if !has('gui_running')
	set t_Co=256
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'dracula/vim'
Plugin 'mhinz/vim-startify'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'toml-lang/toml'
"Plugin 'fatih/vim-go', {'do': ':GoUpdateBinaries' }
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required

let g:go_highlight_trailing_whitespace_error=0

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
			\ 'rust': ['rust-analyzer'],
			\ }
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>
nnoremap <space>ee :CocCommand explorer<CR>

" List all presets
nnoremap <space>el :CocList explPresets

let g:lightline = {'colorscheme': 'gruvbox'}
set background=dark
colorscheme gruvbox
let g:one_allow_italics = 1

" Use D to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)



nnoremap <silent><leader>gf :GFiles<CR>
nnoremap <silent><leader>ff :Files<CR>
nnoremap <silent><leader>bb :Buffers<CR>
nnoremap <silent><leader>c :Commits<CR>
nnoremap <silent><leader>rr :Rg<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <silent> K :call CocAction('doHover')<CR>


if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
else
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[6 q"
endif
