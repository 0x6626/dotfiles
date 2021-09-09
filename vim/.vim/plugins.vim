set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'xiyaowong/telescope-octo-commands.nvim'
Plugin 'xiyaowong/telescope-emoji.nvim'
Plugin 'nvim-telescope/telescope-project.nvim'
Plugin 'norcalli/nvim-terminal.lua'
Plugin 'camgraff/telescope-tmux.nvim'
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'alfredodeza/pytest.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Lenovsky/nuake'
Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plugin 'folke/which-key.nvim'
Plugin 'romgrk/todoist.nvim', { 'do': ':TodoistInstall' }
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'ruanyl/vim-gh-line'
Plugin 'gcmt/taboo.vim'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'tpope/vim-rhubarb'
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'mhinz/vim-startify'
Plugin 'mfussenegger/nvim-dap'

call vundle#end()

