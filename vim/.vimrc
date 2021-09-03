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

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" case insensitive search
set ignorecase
set smartcase
set infercase



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

""NEW
" WITCH_KEY
Plugin 'folke/which-key.nvim'
set timeoutlen=500
" TODOIST
Plugin 'romgrk/todoist.nvim', { 'do': ':TodoistInstall' }
" COPY BETTER REMOTELY
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'RyanMillerC/better-vim-tmux-resizer'


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
