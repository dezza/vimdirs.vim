" Auto-create backup, temp and undo dirs in .vim home directory

if !exists("g:vimdirs_vimhome")
  let g:vimdirs_vimhome = $HOME.'/.vim/'
endif

if !exists("g:vimdirs_temp")
  let g:vimdirs_temp = g:vimdirs_vimhome."temp"
endif

if !exists("g:vimdirs_backup")
  let g:vimdirs_backup = g:vimdirs_vimhome."backup"
endif

if !exists("g:vimdirs_undo")
  let g:vimdirs_undo = g:vimdirs_vimhome."undo"
endif

if has("unix") || has("mac")
    if !isdirectory(g:vimdirs_vimhome)
        call mkdir(g:vimdirs_vimhome)
    endif
    if !isdirectory(g:vimdirs_vimhome."backup")
        call mkdir(g:vimdirs_vimhome."backup","p")
    endif
    if !isdirectory(g:vimdirs_vimhome."temp")
        call mkdir(g:vimdirs_vimhome."temp","p")
    endif
    if !isdirectory(g:vimdirs_vimhome."undo")
        call mkdir(g:vimdirs_vimhome."undo","p")
    endif
    execute "set directory=".escape(g:vimdirs_temp, ' ').'//'
    execute "set backupdir=".escape(g:vimdirs_backup, ' ').'//'
    execute "set undodir=".escape(g:vimdirs_undo, ' ').'//'
    set undofile
    set backup
endif

