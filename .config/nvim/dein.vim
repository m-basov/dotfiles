" Dein initialization
let s:cache_dir = $HOME . '/.cache'

" Create cache dir if not exists.
execute 'silent !mkdir -p' s:cache_dir

" Dein directory
let s:dein_dir = expand(s:cache_dir . '/dein')

" Clone Dein if not exists.
if !isdirectory(s:dein_dir)
    execute 'silent !git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

" Prepend Dein to runtime path.
execute 'set runtimepath^=' . expand(s:dein_dir)

" Plugins managed with Dein
if dein#load_state(expand(s:dein_dir))
    " Plugin system initialization.
    call dein#begin(expand(s:dein_dir))
    call dein#add(expand(s:dein_dir))

    " Essentials
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('nvim-lua/diagnostic-nvim')
    call dein#add('nvim-lua/lsp-status.nvim')
    call dein#add('nvim-treesitter/nvim-treesitter')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/deoplete-lsp')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('dense-analysis/ale')

    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('qpkorr/vim-bufkill')
    call dein#add('tpope/vim-eunuch')
    call dein#add('vim-airline/vim-airline')
    call dein#add('tpope/vim-commentary')
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('tpope/vim-fugitive')
    call dein#add('mcchrish/nnn.vim')
    call dein#add('chrisbra/Colorizer')

    " End of plugin initialization.
    call dein#end()
    call dein#save_state()
endif
