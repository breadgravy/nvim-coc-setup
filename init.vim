"---------------------------------------------------------------------------------
" load plugins
"---------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

"---------------------------------------------------------------------------------
" coc plugin setup
"---------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=200

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gl <Plug>(coc-declaration)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" use spacebar as mapleader
let mapleader=" "

" Remap for rename current word; space+rn
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap ff  <Plug>(coc-format-selected)
nmap ff  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

"---------------------------------------------------------------------------------
" regular editor stuff 
"---------------------------------------------------------------------------------

" misc settings
set undodir=~/.vim/undodir
set undofile
set noswapfile

set noincsearch
set hlsearch

set number

set tabstop=2 shiftwidth=2 expandtab

" fix colors of popup menus
highlight Pmenu ctermbg=white
highlight Type ctermfg=blue cterm=bold

" keybindings
imap jj <ESC>
map <C-j> :qa! <CR> 

nnoremap tf :tabfind 
nnoremap tn :tabn <CR>
nnoremap tp :tabp <CR>

nmap cn <Plug>(coc-diagnotic-next)
nmap cp <Plug>(coc-diagnostic-prev)
