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
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('tpope/vim-commentary')
    call dein#add('qpkorr/vim-bufkill')
    call dein#add('wsdjeg/dein-ui.vim')
    call dein#add('tpope/vim-eunuch')
    call dein#add('vim-airline/vim-airline')
    " Autocomplete
    call dein#add('Shougo/deoplete.nvim')
    " call dein#add('Shougo/denite.nvim')
    call dein#add('dense-analysis/ale')
    " JavaScript/Typescript
    call dein#add('othree/yajs.vim')
    call dein#add('HerringtonDarkholme/yats.vim')
    call dein#add('jparise/vim-graphql')
    " FZF
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('jremmen/vim-ripgrep')

    " End of plugin initialization.
    call dein#end()
    call dein#save_state()
endif

