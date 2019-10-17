let g:airline#themes#alabaster#palette = {}
let s:colors = alabaster#GetColors()

" Global
let s:warn = [
  \ s:colors.bright_white.gui, 
  \ s:colors.yellow.gui, 
  \ s:colors.bright_white.cterm16,
  \ s:colors.yellow.cterm16,
  \ ]
let s:error = [
  \ s:colors.bright_white.gui, 
  \ s:colors.red.gui, 
  \ s:colors.bright_white.cterm16,
  \ s:colors.red.cterm16
  \ ]

" Normal mode
let s:n_mode = [
  \ s:colors.bright_white.gui, 
  \ s:colors.blue.gui, 
  \ s:colors.bright_white.cterm16, 
  \ s:colors.blue.cterm16
  \ ]
let s:n_file_path = [
  \ s:colors.bright_black.gui, 
  \ s:colors.light_grey.gui, 
  \ s:colors.bright_black.cterm16, 
  \ s:colors.light_grey.cterm16
  \ ]
let s:n_file_info = s:n_file_path

let g:airline#themes#alabaster#palette.normal = airline#themes#generate_color_map(s:n_mode, s:n_file_info, s:n_file_path)
let g:airline#themes#alabaster#palette.normal.airline_warning = s:warn
let g:airline#themes#alabaster#palette.normal.airline_error = s:error
let g:airline#themes#alabaster#palette.normal_modified = g:airline#themes#alabaster#palette.normal

" Insert mode
let s:i_mode = s:n_file_path
let g:airline#themes#alabaster#palette.insert = airline#themes#generate_color_map(s:i_mode, s:n_file_info, s:n_file_path)
let g:airline#themes#alabaster#palette.insert.airline_warning = s:warn
let g:airline#themes#alabaster#palette.insert.airline_error = s:error
let g:airline#themes#alabaster#palette.insert_modified = g:airline#themes#alabaster#palette.insert

" Visual mode
let s:v_mode = [
  \ s:colors.bright_white.gui,
  \ s:colors.magenta.gui,
  \ s:colors.bright_white.cterm16,
  \ s:colors.magenta.cterm16
  \ ]
let g:airline#themes#alabaster#palette.visual = airline#themes#generate_color_map(s:v_mode, s:n_file_info, s:n_file_path)
let g:airline#themes#alabaster#palette.visual.airline_warning = s:warn
let g:airline#themes#alabaster#palette.visual.airline_error = s:error
let g:airline#themes#alabaster#palette.visual_modified = g:airline#themes#alabaster#palette.visual

" Replace mode
let s:r_mode = s:warn
let g:airline#themes#alabaster#palette.replace = airline#themes#generate_color_map(s:r_mode, s:n_file_info, s:n_file_path)
let g:airline#themes#alabaster#palette.replace.airline_warning = s:warn
let g:airline#themes#alabaster#palette.replace.airline_error = s:error
let g:airline#themes#alabaster#palette.replace_modified = g:airline#themes#alabaster#palette.replace

" Terminal mode
let s:t_mode = [
  \ s:colors.bright_white.gui,
  \ s:colors.green.gui,
  \ s:colors.bright_white.cterm16,
  \ s:colors.green.cterm16
  \ ]
let g:airline#themes#alabaster#palette.terminal = airline#themes#generate_color_map(s:t_mode, s:n_file_info, s:n_file_path)
let g:airline#themes#alabaster#palette.terminal.airline_term = s:n_file_path
let g:airline#themes#alabaster#palette.normal.airline_term = s:n_file_path
let g:airline#themes#alabaster#palette.terminal.airline_warning = s:warn
let g:airline#themes#alabaster#palette.terminal.airline_error = s:error
let g:airline#themes#alabaster#palette.terminal_modified = g:airline#themes#alabaster#palette.terminal

" Inactive mode
let g:airline#themes#alabaster#palette.inactive = airline#themes#generate_color_map(s:n_mode, s:n_file_info, s:n_file_path)
let g:airline#themes#alabaster#palette.inactive.airline_warning = s:warn
let g:airline#themes#alabaster#palette.inactive.airline_error = s:error
let g:airline#themes#alabaster#palette.inactive_modified = g:airline#themes#alabaster#palette.inactive

" Tabline
let g:airline#themes#alabaster#palette.tabline = {}
let g:airline#themes#alabaster#palette.tabline.airline_tabmod = s:n_mode
let g:airline#themes#alabaster#palette.tabline.airline_tabmod_unsel = s:r_mode

