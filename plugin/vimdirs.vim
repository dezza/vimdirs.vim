"" (Auto-create backup and temp dirs in .vim home directory)

" I'm stoo-pid

if !exists("g:vimdirs_vimhome")
  let g:vimdirs_vimhome = expand("~/.vim/")
endif

if !exists("g:vimdirs_temp")
  let g:vimdirs_temp = g:vimdirs_vimhome."temp"
endif

if !exists("g:vimdirs_backup")
  let g:vimdirs_backup = g:vimdirs_vimhome."backup"
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
    execute "set directory=".escape(g:vimdirs_temp, ' ')
    execute "set backupdir=".escape(g:vimdirs_backup, ' ')
endif
