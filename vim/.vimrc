set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Bundle 'myusuf3/numbers.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'tpope/vim-surround'
Plugin 'masukomi/vim-markdown-folding'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'tmhedberg/SimpylFold'
Plugin 'chrisbra/Colorizer'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
call vundle#end()

let g:airline_powerline_fonts = 1

let NERDTreeShowHidden=1
map <C-o> :NERDTreeToggle<CR>

let g:numbers_exclude = ['nerdtree']
nnoremap <M-n> :NumbersToggle<CR>

filetype plugin indent on    " required

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set wildmenu
syntax on
set clipboard=unnamedplus

" mouse
set mouse=a
let g:NERDTreeMouseMode=3 

" spacing
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent

" folding
nnoremap <Space> za
hi Folded ctermfg=5 guifg=#B48EAD guibg=NONE ctermbg=NONE
