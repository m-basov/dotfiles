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

" Tabs
nnoremap TN :tabnext<CR>
nnoremap TP :tabprev<CR>

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

" Reload vim config
nmap <Leader>R :so $MYVIMRC<CR>

" Reselect after indentation
vnoremap < <gv
vnoremap > >gv

" Terminal
nmap <Leader>t :call StartTerminal()<CR>
tnoremap JK <C-\><C-n>

function! StartTerminal() abort
  let l:name = input("Enter terminal buffername: ")
  if l:name == "" | let l:name = "zsh" | endif
  enew
  terminal
  execute("file" . " " . l:name)
  startinsert
endfunction

" Use TAB for completion
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Get syntax under cursor
map <F10> :call GetSyntaxIdentifier()<CR>
function GetSyntaxIdentifier()
  echo 
  \   "hi<"    . synIDattr(synID(line("."), col("."), 1), "name")              . "> "
  \ . "trans<" . synIDattr(synID(line("."), col("."), 0), "name")              . "> "
  \ . "lo<"    . synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name") . ">"
endfunction

"=================
" Plugins Settings
"=================

" Dein
nmap <Leader>cp :call CleanDeinPlugins()<CR>
function CleanDeinPlugins() abort
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
  UpdateRemotePlugins
endfunction

" FZF
let g:fzf_nvim_statusline = 0
nmap <leader>p  :Files<CR>
nmap <leader>/  :BLines<CR>
nmap <leader>f  :Rg<CR>
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

" Deoplete
set completeopt=menu
let g:deoplete#enable_at_startup = 1

" nnn 
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'left': '~40%' }
let g:nnn#statusline = 1
nnoremap <leader>e :NnnPicker '%:p:h'<CR>

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'alabaster'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" ALE
let g:ale_set_signs = 0
let g:ale_close_preview_on_insert = 1
let g:ale_echo_cursor = 1
let g:ale_linters = {
  \ 'rust': ['rls']
  \ }
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'typescript.tsx': ['prettier'],
  \ 'typescriptreact': ['prettier'],
  \ 'json': ['prettier'],
  \ 'graphql': ['prettier'],
  \ 'css': ['prettier'],
  \ 'html': ['prettier'],
  \ 'less': ['prettier'],
  \ 'rust': ['rustfmt'],
  \ 'c': ['clang-format']
  \ }
nmap <S-CR>     <Plug>(ale_fix)
nmap gd         <Plug>(ale_go_to_definition_in_vsplit)
nmap td         <Plug>(ale_go_to_type_definition)
nmap tr         <Plug>(ale_find_references)
nmap <leader>rn <Plug>(ale_rename)
nmap K          <Plug>(ale_hover)
nmap <leader>n  <Plug>(ale_next_wrap)
nmap <leader>N  <Plug>(ale_previous_wrap)
" ale-rust
let g:ale_rust_cargo_use_clippy = 1

" Syntax
augroup init_syntaxes
  au!
  au BufNewFile,BufRead *.mjml set filetype=html
augroup END

if !exists('g:context_filetype#filetypes')
  let g:context_filetype#filetypes = {}
endif
let g:context_filetype#filetypes.typescript = [
  \ {'filetype': 'sql', 'start' : 'sql\`', 'end' : '\`'},
  \ {'filetype': 'html', 'start': 'html\`', 'end': '\`'},
  \ {'filetype': 'css', 'start': 'css\`', 'end': '\`'}
  \ ]
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes.typescript = 'javascript,typescript.tsx,typescriptreact'

