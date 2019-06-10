let g:mapleader = ","

"=================
" Plugins
"=================

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Essentials
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('tpope/vim-commentary')
  " Autocomplete
  call dein#add('neoclide/coc.nvim', { 'build': './install.sh', 'rev': '*' })
  " JavaScript/Typescript
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('othree/yajs.vim')
  call dein#add('jparise/vim-graphql')
  " FZF
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('jremmen/vim-ripgrep')

  call dein#end()
  call dein#save_state()
endif

"=================
" Vim Settings 
"=================

" Color Scheme
set termguicolors
colorscheme alabaster
syntax enable

" Essentials
set guicursor=
set updatetime=300

" Backups
set nobackup
set nowritebackup

" Scroll
set scrolloff=1
set sidescrolloff=5
set display+=lastline

" Identation
set tabstop=2 
set shiftwidth=2 
set expandtab
set nowrap

" Splits
set splitbelow 
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Search
set incsearch
set ignorecase

nnoremap <ESC> :noh<CR><ESC>

" Buffers
set hidden " Keep unsaved buffer

nmap <Leader>q :bd<CR>
nmap gb :bn<CR>
nmap gB :bp<CR>

" Exit from insert mode
inoremap jk <ESC>

" Reload vim config
nmap <Leader>R :w<CR> :so $MYVIMRC<CR>

" Reselect after indentation
vnoremap < <gv
vnoremap > >gv

" Open terminal
nmap <Leader>t :terminal<CR>
tnoremap jk <C-\><C-n>
autocmd TermOpen term://* startinsert

" Use TAB for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Get syntax under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"=================
" Plugins Settings 
"=================

" Dein
nmap <Leader>cp :call map(dein#check_clean(), "delete(v:val, 'rf')")<CR> :call dein#recache_runtimepath()<CR>

" FZF
nmap <Leader>p :Files<CR>
nmap <Leader>h :History<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>l :BLines<CR>
let g:fzf_colors =  { 
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['bg', 'fzf1'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'PmenuSel'],
  \ 'hl+':     ['bg', 'fzf1'],
  \ 'info':    ['fg', 'Normal'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['bg', 'fzf1'],
  \ 'pointer': ['fg', 'Normal'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['bg', 'fzf1'],
  \ 'header':  ['fg', 'Normal'],
  \ }
function! s:fzf_statusline()
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Deoplete
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('sources', { '_': ['ale'] })

" ALE
let g:ale_set_signs = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'graphql': ['prettier'],
\}
