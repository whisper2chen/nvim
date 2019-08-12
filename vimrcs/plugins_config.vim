"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim plug 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" themes
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" welcome page
Plug 'mhinz/vim-startify'

" status line
Plug 'vim-airline/vim-airline'

" nerdtree
Plug 'scrooloose/nerdtree'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" tagbar
Plug 'majutsushi/tagbar'

" complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"vim easy align
Plug 'junegunn/vim-easy-align'
"vim easy motion
Plug 'easymotion/vim-easymotion'

"snippetse
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Initialize plugin system
call plug#end()





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf configs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags --languages=c,c++ -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-gutentags  gutentags_plus configs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

"所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete configs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easy-align configs 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" none use vip :EasyAlign=



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree configs 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :NERDTreeToggle<cr>
let g:NERDTreeWinPos = "right"
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$']
let g:NERDTreeWinSize=35
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar configs 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F2> :TagbarToggle<cr>
let g:tagbar_left = 1
