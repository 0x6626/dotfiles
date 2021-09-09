" reload
nnoremap <silent> <Leader>vrr :<C-u>call system('dotfiles reload')<CR><bar>:source ~/.vimrc<CR><bar>:echo "█▓░ ~/.vimrc reloaded."<CR><bar>
nnoremap <silent> <Leader>vri :<C-u>call system('dotfiles reload')<CR><bar>:source ~/.vimrc<CR><bar>:PluginInstall<CR><bar>:quit<CR><bar>:echo "█▓░ plugins installed"<CR><bar>
nnoremap <silent> <Leader>vru :<C-u>call system('dotfiles reload')<CR><bar>:source ~/.vimrc<CR><bar>:PluginUpdate<CR><bar>:quit<CR><bar>:echo "█▓░ plugins updated"<CR><bar>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" telescope
nnoremap <leader><leader> <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fe <cmd>Telescope emoji<cr>
nnoremap <leader>ft <cmd>Telescope<cr>

" intuitive completion
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

" nuake
nnoremap <silent> <Leader>t :Nuake<CR>
tnoremap <Esc> <C-\><C-n>

" stuff stolen from xero
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
