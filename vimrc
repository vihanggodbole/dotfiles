set clipboard=unnamed

call plug#begin('~/.vim/plugged')
Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'morhetz/gruvbox'
call plug#end()

let g:vim_monokai_tasty_italic = 1

colorscheme gruvbox
hi NORMAL guibg=NONE ctermbg=NONE

