if &term =~ "xterm"
  colorscheme railscasts
else
  if &term =~ "screen-256color-bce"
    colorscheme railscasts
  else
    colorscheme darkblue
  endif
endif
set term=xterm-256color
"colorscheme railscasts
"colorscheme peachpuff
"colorscheme darkblue
"colorscheme slate

set runtimepath^=~/.vim/bundle/ctrlp.vim
autocmd Filetype md  set textwidth=80
autocmd Filetype txt set textwidth=80
set colorcolumn=+1
set number
set nowrap

" Indentation
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2

