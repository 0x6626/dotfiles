"----------------,
"  ╻ ╻╻┏┳┓┏━┓┏━╸ `
"  ┃┏┛┃┃┃┃┣┳┛┃   `
" ╹┗┛ ╹╹ ╹╹┗╸┗━╸ `
"''''''''''''''''`


"------------,
" Pre-Plugin `
"''''''''''''`
syntax on
filetype plugin indent on
set nocompatible
set smartcase
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set cursorline
set hlsearch
set number
set mouse=a
set clipboard+=unnamedplus
set showmatch
set breakindent
set sessionoptions+=tabpages,globals

set tabstop=2 shiftwidth=2 expandtab

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" case insensitive search
set ignorecase
set smartcase
set infercase

hi WhichKey ctermfg=2 cterm=bold
hi WhichKeySeparator ctermfg=3 cterm=bold
hi WhichKeyGroup ctermfg=4 cterm=bold
hi WhichKeyDesc ctermfg=4 cterm=bold
hi NormalFloat cterm=NONE ctermfg=14 ctermbg=0

hi Pmenu ctermbg=111 ctermfg=232 

set fillchars=vert:▒

hi SignColumn   ctermbg=234
hi ActiveWindow ctermbg=0 | hi InactiveWindow ctermbg=234
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

"---------,
" Plugins `
"'''''''''`
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ⭐⭐⭐⭐⭐ 
Plugin 'VundleVim/Vundle.vim'

"------
" tmux.
"******

" ⭐⭐⭐⭐⭐ 
" tldr: <C-h,j,k,l>
Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 1

"-----
" git.
"*****

" ⭐⭐⭐⭐⭐ 
" tldr: :Git <literally whatever>
" :Gdiffsplit
" :Gllog, :Gclog
" ... lots more 
Plugin 'tpope/vim-fugitive'

" ⭐⭐⭐⭐⭐ 
" tldr: git line status in gutter
" - [ ] make shortcuts for hunk jumps
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_use_location_list=1

" ⭐⭐⭐⭐⭐ 
" tldr: git line status in in file explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let NERDTreeShowHidden=1
let NERDTreeChDirMode=3
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" experimental:
Plugin 'pwntester/octo.nvim', {'load_extension': 'octo_commands'}


"---------------
" file explorer.
"***************

" ⭐⭐⭐⭐⭐ 
" tldr: cute little file tree explorer
Plugin 'preservim/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" ⭐⭐⭐⭐⭐ 
" tldr: <Leader>c<Leader> comment/uncomment, just like in VSCode
Plugin 'preservim/nerdcommenter'



"------------------
" Search and Select
"******************

" ⭐⭐⭐⭐⭐ 
" tldr: :Telescope see everything
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
nnoremap <leader><leader> <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <leader>te <cmd>Telescope emoji<cr>

" <telescope_extension>
Plugin 'xiyaowong/telescope-octo-commands.nvim'
Plugin 'xiyaowong/telescope-emoji.nvim'
Plugin 'nvim-telescope/telescope-project.nvim'
Plugin 'norcalli/nvim-terminal.lua' " needed for telescope tmux
Plugin 'camgraff/telescope-tmux.nvim'
" </telescope_extension>



"------------------
" Language Servers
"******************
" ⭐⭐⭐⭐⭐ 
" tldr: code completion
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" -----------------------------------------------------------+
" :startmagic: to enable autcomplete on type, select on tab  |
" -----------------------------------------------------------+
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	if has('nvim')
		inoremap <silent><expr> <c-space> coc#refresh()
	else
		inoremap <silent><expr> <c-@> coc#refresh()
	endif

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
	if exists('*complete_info')
		inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif
" ---------------------------------------------------------+
" :endmagic: to enable autcomplete on type, select on tab  |
" ---------------------------------------------------------+

" <programming_languages>
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'alfredodeza/pytest.vim'
Plugin 'vim-syntastic/syntastic'
" </programming_languages>

"----------
" UI Tweaks
"**********
Plugin 'kyazdani42/nvim-web-devicons'

"----------
" Terminal 
"**********
" ⭐⭐⭐⭐⭐ 
" tldr: like the integrated terminal in vscode
Plugin 'Lenovsky/nuake'
nnoremap <silent> <Leader>t :Nuake<CR>
tnoremap <Esc> <C-\><C-n>

"---------------------------
" Embedded Neovim in Browser
"***************************
" ⭐⭐⭐⭐⭐ 
" tldr: code completion
Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

"iNEW
Plugin 'folke/which-key.nvim'
set timeoutlen=500
Plugin 'romgrk/todoist.nvim', { 'do': ':TodoistInstall' }
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'ruanyl/vim-gh-line'
Plugin 'gcmt/taboo.vim'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'tpope/vim-rhubarb'
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'


set noshowmode

let s:base03 = [ '#151513', 232 ]
let s:base02 = [ '#3B4252', 234 ]
let s:base01 = [ '#4e4e43', 239 ]
let s:base00 = [ '#666656', 242  ]
let s:base0 = [ '#808070', 244 ]
let s:base1 = [ '#949484', 242 ]
let s:base2 = [ '#a8a897', 248 ]
let s:base3 = [ '#e8e8d3', 234 ]
let s:yellow = [ '#EBCB8B', 11 ]
let s:orange = [ '#7A7A57', 3 ]
let s:red = [ '#BF616A', 1 ]
let s:magenta = [ '#B48EAD', 13 ]
let s:cyan = [ '#87ceeb', 4 ]
let s:green = [ '#A3BE8C', 3 ]
let s:none = [ 'none', 'none' ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:cyan ], [ s:base3, s:base02 ] ]
let s:p.normal.right = [ [ s:base02, s:base00 ], [ s:base2, s:base02 ] ]
let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:none, s:none ] ]
let s:p.inactive.middle = copy(s:p.normal.middle)
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle = copy(s:p.normal.middle)
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:base02, s:yellow ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]

set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'filename' ],
  \             [ 'linter',  'gitbranch' ] ],
  \   'right': [ [ 'percent', 'lineinfo' ],
  \              [ 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'WizMod',
  \   'readonly': 'WizRO',
  \   'gitbranch': 'WizGit',
  \   'filename': 'WizName',
  \   'filetype': 'WizType',
  \   'fileencoding': 'WizEncoding',
  \   'mode': 'WizMode',
  \ },
  \ 'component_expand': {
  \   'linter': 'WizErrors',
  \ },
  \ 'component_type': {
  \   'readonly': 'error',
  \   'linter': 'error'
  \ },
  \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
  \ 'subseparator': { 'left': '▒', 'right': '░' }
  \ }

function! WizMod()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '» ' : &modifiable ? '' : ''
endfunction

function! WizRO()
  " ×   
  return &ft !~? 'help\|vimfiler' && &readonly ? ' ' : ''
endfunction

function! WizGit()
  return !IsTree() ? exists('*fugitive#head') ? fugitive#head() : '' : ''
endfunction

function! WizName()
  return !IsTree() ? ('' != WizRO() ? WizRO() : WizMod()) . ('' != expand('%:t') ? expand('%:t') : '[none]') : ''
endfunction

function! WizEncoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &enc : &enc) : ''
endfunction

function! WizErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  " ×   
  return l:counts.total == 0 ? '' : printf(' %d', l:counts.total)
endfunction

function! IsTree()
  let l:name = expand('%:t')
  return l:name =~ 'NetrwTreeListing\|undotree\|NERD' ? 1 : 0
endfunction

function! WizType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? ' ' . WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : '') : ''
endfunction


call vundle#end()

nnoremap <silent> <Leader>vrr :<C-u>call system('dotfiles reload')<CR><bar>:source ~/.vimrc<CR><bar>:echo "█▓░ ~/.vimrc reloaded."<CR><bar>
nnoremap <silent> <Leader>vri :<C-u>call system('dotfiles reload')<CR><bar>:source ~/.vimrc<CR><bar>:PluginInstall<CR><bar>:quit<CR><bar>:echo "█▓░ plugins installed"<CR><bar>
nnoremap <silent> <Leader>vru :<C-u>call system('dotfiles reload')<CR><bar>:source ~/.vimrc<CR><bar>:PluginUpdate<CR><bar>:quit<CR><bar>:echo "█▓░ plugins updated"<CR><bar>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
