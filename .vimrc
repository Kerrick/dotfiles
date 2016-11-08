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

set backupdir=~/Temporary
set dir=~/Temporary
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.sass-cache$\|node_modules\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

set runtimepath^=~/.vim/bundle/ctrlp.vim
autocmd Filetype md  set textwidth=80
autocmd Filetype txt set textwidth=80
set nowrap

" Indentation
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2

" Because it's too slow when editing files on a Windows share
let g:loaded_matchparen = 1

" Mouse functionality
set mouse=a

" Location stuff
set number
set ruler
set cursorline
set colorcolumn=+1

" Syntax highlighting
syntax on
autocmd BufNewFile,BufRead *.json set ft=javascript

