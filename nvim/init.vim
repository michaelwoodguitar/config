" Plugins
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/seoul256.vim'
	Plug 'ericbn/vim-relativize'
	Plug 'itchyny/lightline.vim'
	Plug 'vimwiki/vimwiki'
call plug#end()

" Settings
set number relativenumber
colo seoul256
set background=dark
let g:vimwiki_list = [{'path': '~/Dropbox/ACT_Acoustics/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Keyboard shortcuts
let mapleader = ","
" Compile
    nmap <leader>o :!open "%:p:r.pdf"<CR>
" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :silent w! \| !compile "<c-r>%"<CR>
    nmap <leader>q :!compile_quote "<c-r>%"<CR>
" Insert date and time
    nmap <leader>t :pu=strftime('%c')<CR>
" insert footnote (groff)
    nmap <leader>fn i\*[*]<ESC>o.FS<CR>.FE<ESC>O
" insert superscript
    nmap <leader>su i\*{\*}<ESC>2hi
" save
    map <leader>s :w<CR>
" yank whole document to clipboard
    nmap <leader>y ggVG"*y
" add a markdown link for image or url
    map <leader>k i[]()<ESC>i
    map <leader>i i![]()<ESC>i
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Replace spaces with hyphen and make lower case
    nmap <leader>- V:s/\ /-/g<CR>Vu<ESC>
" Adding a pdb for python:
    nmap <leader>b Oimport pdb; pdb.set_trace()<ESC>
" Quick buffer delete
    nmap <leader>d :bd<CR>
" Move to the next section and put it at the top of the page
    nmap ]] ]]zt
    nmap [[ [[zt
" Create a basic table
    nmap <leader>T i.TS<CR>tab(\|)<space>allbox<space>nospaces;<CR><CR>.TE<ESC>ki
" Split paragraph
    nmap <leader>p 0f.lli<CR><Esc>
" For creating a BC calculator:
    map gbc yypkA =<Esc>jOscale=2<Esc>:.,+1!bc<CR>kJ
" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
