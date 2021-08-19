"  ╻ ╻╻┏┳┓┏━┓┏━╸
"  ┃┏┛┃┃┃┃┣┳┛┃  
" ╹┗┛ ╹╹ ╹╹┗╸┗━╸
" there are many like it, but this is mine

" 🐜 behavior
set nocompatible
filetype off
set smartcase

" 🔌 plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'wadackel/vim-dogrun'
Plugin 'vim-syntastic/syntastic'
Plugin 'darfink/vim-plist'
Plugin 'tarekbecker/vim-yaml-formatter'
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/vim-emoji'
Plugin 'Lenovsky/nuake'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'
Plugin 'alfredodeza/pytest.vim'
Plugin 'dracula/vim'
call vundle#end()

" 🔴 don't open new buffers in unmodifiable buffers, quickfix, or nerdtree
" 🔗 https://github.com/junegunn/fzf/issues/453#issuecomment-700943343
function! FZFOpen(cmd)
    if winnr('$') > 1 && (!&modifiable || &ft == 'nerdtree' || &ft == 'qf')
        wincmd l
        wincmd k
    endif
    exe a:cmd
endfunction

" ⌨ shortcuts
nnoremap <Leader>yf :let @+=expand('%:p')<CR>
map <silent> <leader>nh :nohls <CR>
nnoremap <silent> <C-w> :bdel<CR>
map <D-/> <Leader>c<Space>
nmap <Leader>nr :NERDTreeFocus<cr>R<c-w><c-p>
nnoremap <silent> <Leader>ve :call FZFOpen(":e $MYVIMRC")<CR>
nnoremap <silent> <Leader>vr :source $MYVIMRC<CR><bar>:nohls<CR>
nnoremap <silent> <Leader>vp :PluginInstall<CR>
nnoremap <silent> <leader><leader> :call FZFOpen(":Buffers")<CR>
nnoremap <silent> <leader>f :call FZFOpen(":Files")<CR>
nnoremap <silent> <leader>ff :call FZFOpen(":Rg")<CR>
nnoremap <silent> <leader>fh :call FZFOpen(":Files ~")<CR>
nnoremap <silent> <leader>zh :call FZFOpen(":History")<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>e :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR><bar>:nohls<CR>
nnoremap <silent> <Leader>w :set list!<CR>
map <silent> <leader>s :set spell!<CR>
map <C-n> :NERDTreeToggle<CR>
set pastetoggle=<Leader>p
nnoremap <silent> <Leader>t :Nuake<CR>
inoremap <silent> <Leader>t <C-\><C-n>:Nuake<CR>
tnoremap <silent> <Leader>t <C-\><C-n>:Nuake<CR>

" ✍ spell check
syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

" 🛰 spacing 
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
syntax on
set cursorline
set hlsearch

" 🎨 apperance
set number
silent! colorscheme dracula
set mouse=a

" 🌲 nerdtree
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2

" 📝 nerdcommenter
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultAlign = 'left'

" 🚗 auto complete
set completefunc=emoji#complete
set wildmenu

" 💻 operating system integration
set clipboard=unnamed

" 🏁 startup commands
autocmd vimenter * NERDTree

