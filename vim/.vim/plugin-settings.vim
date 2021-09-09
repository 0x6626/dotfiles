let g:tmux_navigator_disable_when_zoomed = 1
let g:gitgutter_use_location_list=1
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeShowHidden=1
let NERDTreeChDirMode=3
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:webdevicons_conceal_nerdtree_brackets=0
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeIgnore=['\.\.$', '\.$', '\~$']

augroup nerdtreeconcealbrackets
      autocmd!
      autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
      autocmd FileType nerdtree setlocal conceallevel=3
      autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END:w
