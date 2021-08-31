set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua require('telescope').load_extension('octo_commands')
lua require('telescope').load_extension('project')
lua require('telescope').load_extension('emoji')
lua require('terminal').setup()
lua require('telescope').load_extension('tmux')

lua require("which-key").setup()

