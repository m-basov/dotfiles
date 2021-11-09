let g:mapleader = ","
let g:my_nvim_dir = fnamemodify(expand('<sfile>'), ':p:h')
let g:node_host_prog = '/Users/mbasov/.volta/tools/image/packages/neovim/lib/node_modules/neovim/bin/cli.js'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0

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
set cc=

" Essentials
set guicursor=
set updatetime=300
set clipboard+=unnamed
set clipboard+=unnamedplus
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
" set nowrap

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
" let g:fzf_nvim_statusline = 0
" let g:fzf_preview_window = ''
nmap <leader>p  :Files<CR>
nmap <leader>b  :Buffers<CR>
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
call deoplete#custom#option('sources', {
\ '_': ['ale', 'buffer', 'file'],
\ 'rust': ['lsp', 'ale', 'buffer', 'file'],
\ 'typescript': ['lsp', 'ale', 'buffer', 'file'],
\ })
call deoplete#custom#option('min_pattern_length', 1)
call deoplete#custom#option('max_pattern_length', 120)

" Lua plugins
let g:diagnostic_show_sign = 0
let g:diagnostic_enable_underline = 0
lua require('init')

" nnn
let g:nnn#command = 'nnn -o -H -r -R'
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#statusline = 1
let g:nnn#replace_netrw = 1
nnoremap <leader>e :NnnPicker %:p:h<CR>

" Airline
let g:airline#extensions#ale#enabled = 0
let g:airline_theme = 'alabaster'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#nvimlsp#enabled = 0
let g:airline_section_warning = airline#section#create_right(['lsp_status'])
function! LspStatus() abort
  let status = luaeval('require("lsp-status").status()')
  return trim(status)
endfunction
call airline#parts#define_function('lsp_status', 'LspStatus')
call airline#parts#define_condition('lsp_status', 'luaeval("#vim.lsp.buf_get_clients() > 0")')

" ALE
let g:ale_disable_lsp = 1
let g:ale_set_signs = 0
let g:ale_echo_cursor = 0
let g:ale_rust_rustfmt_options = '--edition 2018'
let g:ale_linters = {
  \ 'rust': [],
  \ 'typescript': ['eslint'],
  \ 'javascript': ['eslint']
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
  \ 'c': ['clang-format'],
  \ 'cpp': ['clang-format'],
  \ 'markdown': ['prettier'],
  \ 'ruby': ['rubocop'],
  \ }
nmap <S-CR>     <Plug>(ale_fix)

" nmap gd         <Plug>(ale_go_to_definition)
" nmap td         <Plug>(ale_go_to_type_definition)
" nmap tr         <Plug>(ale_find_references)
" nmap <leader>rn <Plug>(ale_rename)
" nmap K          <Plug>(ale_hover)
" nmap <leader>n  <Plug>(ale_next_wrap)
" nmap <leader>N  <Plug>(ale_previous_wrap)

nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> td <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <silent> tr <cmd>lua vim.lsp.buf.references()<CR>
nmap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nmap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nmap <leader>n <cmd>NextDiagnosticCycle<CR>
nmap <leader>N <cmd>PrevDiagnosticCycle<CR>
nmap <leader>D <cmd>OpenDiagnostic<CR>

" Syntax
augroup init_syntaxes
  au!
  au BufNewFile,BufRead *.mjml set filetype=html
augroup END

" Fugitive
let g:fugitive_dynamic_colors = 0

" Colorizer
nmap <leader>cC <Plug>Colorizer

" Insert new uuid
nmap <leader>u :r !uuidgen<CR>
