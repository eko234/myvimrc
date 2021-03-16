call plug#begin('~/.vim/plugged')
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim' , {'branch':'release'}
call plug#end()

colo pablo
set number relativenumber
let mapleader=" "

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <leader>w :w<cr>
nnoremap <leader>l :call ToggleNetrw()<CR>
nnoremap <leader>cc :cd %:p:h<CR>
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
