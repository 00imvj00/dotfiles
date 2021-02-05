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

set tabstop=4 softtabstop=4
set shiftwidth=4
set cmdheight=1
set updatetime=300
set shortmess+=c
set laststatus=2
"
"enable backspace key
set backspace=indent,eol,start

syntax on
filetype off                  " required
filetype plugin indent on    " required

if !has('gui_running')
	set t_Co=256
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/terminus'
Plugin 'arcticicestudio/nord-vim'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'itchyny/lightline.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
			\ 'rust': ['rust-analyzer'],
			\ }

let g:lightline = {'colorscheme': 'nord'}

colorscheme nord

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

