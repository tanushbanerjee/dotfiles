syntax on
filetype plugin indent on

set exrc
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set nobackup
set undofile
set incsearch
set termguicolors
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
call plug#end()
colorscheme gruvbox
set background=dark
let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:airline#extensions#tabline#enabled = 1
let g:netrw_winsize=25
let g:airline_powerline_fonts = 1
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>n :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
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
set foldmethod=syntax

" Testing And Compiling The Solutions
nnoremap <leader>t :!make test<CR>
nnoremap <C-c> :!xclip -sel c < sol.cpp<Enter>

" FZF configs
let $FZF_DEFAULT_COMMAND = 'rg --files'
let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
command! FzfProjectFiles execute 'FzfFiles' projectroot#guess()
nnoremap <silent> <Leader><Space> :FzfProjectFiles<CR>
nnoremap <silent> <Leader>f :FzfRg<CR>
nnoremap <silent> <Leader>a :FzfBuffers<CR>
nnoremap <silent> <Leader>A :FzfWindows<CR>
if has('nvim')
  " For neovim 0.1.7
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
  " For neovim 0.2
  "set guicursor=blah
else
  if $TERM =~ '^xterm\|rxvt'
    " Insert mode
    let &t_SI = "\<Esc>[5 q"
    " Replace mode
    if has("patch-7.4-687")
      let &t_SR = "\<Esc>[3 q"
    endif
    " Normal mode
    let &t_EI = "\<Esc>[2 q"

    " 1 or 0 -> blinking block
    " 2 -> solid block
    " 3 -> blinking underscore
    " 4 -> solid underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
  endif
endif
" Insert mode
let &t_SI = "\<Esc>[5 q"
" Normal mode
let &t_EI = "\<Esc>[2 q"
