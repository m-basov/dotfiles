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
set signcolumn=yes
set noshowmode
set noshowcmd

" Essentials
set guicursor=
set updatetime=300
set clipboard+=unnamed

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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ "\<TAB>"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

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

" typescript-neovim
nmap <silent> td :TSDef<CR>
nmap <silent> tr :TSRefs<CR>
  nmap <leader> rn :TSRename<CR>
nmap <silent> K :TSType<CR>
let g:nvim_typescript#default_mappings = 0
let g:nvim_typescript#suggestions_enabled = 1
let g:nvim_typescript#default_signs = [
  \  {
  \  'TSerror': {
  \   'texthl': 'ALEErrorSign',
  \   'signText': '×',
  \   'signTexthl': 'ALEErrorSign'
  \  }
  \},
  \{
  \  'TSwarning': {
  \   'texthl': 'ALEWarningSign',
  \   'signText': '!',
  \   'signTexthl': 'ALEWarningSign'
  \  }
  \},
  \{
  \  'TSinformation': {
  \   'texthl': 'NeomakeInfoSign',
  \   'signText': '•',
  \   'signTexthl': 'NeomakeInfoSign'
  \   }
  \},
  \{
  \  'TShint': {
  \   'texthl': 'NeomakeInfoSign',
  \   'signText': '?',
  \   'signTexthl': 'NeomakeInfoSign'
  \   }
  \}
  \]

" Netrw
let g:netrw_banner = 0
nnoremap <leader>e :Explore<CR>

" Context ft
au BufRead,BufNewFile *.mjml setfiletype html
if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif
let g:context_filetype#filetypes.typescript = [
  \ {'filetype': 'sql', 'start': 'sql`', 'end': '`'},
  \ ]
let g:context_filetype#filetypes.svelte = [
  \ {'filetype': 'javascript', 'start': '<script>', 'end': '</script>'},
  \ {'filetype': 'css', 'start': '<style>', 'end': '</style>'},
  \ ]
let g:context_filetype#filetypes.html = [
  \ {'filetype': 'css', 'start': '<mj-style.*>', 'end': '</mj-style>'},
  \ ]

" Prettier
let g:prettier#autoformat = 1
nmap <silent> <S-CR> <Plug>(Prettier)

" Airline
" let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'alabaster'
