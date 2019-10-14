let g:mapleader = ","
let g:my_nvim_dir = fnamemodify(expand('<sfile>'), ':p:h')
let g:node_host_prog = '/Users/mbasov/.volta/tools/image/packages/neovim/4.5.0/bin/cli.js'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2'

execute 'silent source ' . expand(g:my_nvim_dir . '/dein.vim')

"=================
" Vim Settings
"=================

" Color Scheme
set termguicolors
colorscheme alabaster
syntax enable
set noshowmode
set noshowcmd

" Essentials
set guicursor=
set updatetime=300
set clipboard+=unnamed
set ttimeoutlen=10

" Backups
set nobackup
set nowritebackup

" Scroll
set scrolloff=1
set sidescrolloff=5
set display+=lastline

" Identation
set tabstop=8
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
set smartcase

nnoremap <ESC> :noh<CR><ESC>

" Buffers
set hidden " Keep unsaved buffer

nmap <Leader>q :BD<CR>
nmap <Leader>Q :close<CR>
nmap gb :bn<CR>
nmap gB :bp<CR>
nnoremap <leader>, <C-^>

" Exit from insert mode
inoremap jk <ESC>

" Reload vim config
nmap <Leader>R :so $MYVIMRC<CR>

" Reselect after indentation
vnoremap < <gv
vnoremap > >gv

" Terminal
nmap <Leader>t :terminal<CR>
tnoremap jk <C-\><C-n>
autocmd TermOpen * startinsert

" Use TAB for completion
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Netrw
let g:netrw_banner = 0
nnoremap <leader>e :Explore<CR>

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'alabaster'

" ALE
let g:ale_set_signs = 0
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'typescript': ['prettier', 'eslint']
  \ }
nmap <S-CR>     <Plug>(ale_fix)
nmap gd         <Plug>(ale_go_to_definition_in_vsplit)
nmap td         <Plug>(ale_go_to_type_definition)
nmap tr         <Plug>(ale_find_references)
nmap <leader>rn <Plug>(ale_rename)
nmap K          <Plug>(ale_hover)

" Syntax
autocmd BufNewFile,BufRead *.mjml set filetype=html
