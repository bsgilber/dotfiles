""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get plugin manager if we don't already have it
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Cosmetic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'buoto/gotests-vim'

" Language Servers & Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'

" Forked VIM slime
Plug 'Jason-Adam/vim-slime', { 'branch': 'main' }

" Utils
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_fixers = {
    \"python": [
        \"add_blank_lines_for_python_control_statements", 
        \"black", 
        \"isort", 
        \"remove_trailing_lines", 
        \"trim_whitespace"
    \],
    \"sh": [
        \"shfmt",
        \"remove_trailing_lines",
        \"trim_whitespace"
    \],
    \"go": [
        \"gofmt",
        \"goimports",
        \"trim_whitespace",
        \"remove_trailing_lines"
    \],
    \"rust": [
        \"rustfmt",
        \"trim_whitespace",
        \"remove_trailing_lines"
    \],
    \"json": [
        \"jq",
        \"remove_trailing_lines",
        \"trim_whitespace"
    \],
    \"javascript": [
        \"prettier",
        \"remove_trailing_lines",
        \"trim_whitespace"
    \],
   \"html": [
        \"prettier",
        \"remove_trailing_lines",
        \"trim_whitespace"
    \],
    \"sql": [
        \"remove_trailing_lines",
        \"trim_whitespace"
    \]
\}

let g:ale_linters = {
    \"python": [
        \"flake8",
        \"bandit",
        \"pylint",
        \"mypy"
    \],
    \"sh": [
        \"shellcheck"
    \],
    \"go": [
        \"gotype",
        \"golint",
        \"gofmt",
        \"gopls",
        \"gobuild",
        \"govet"
    \],
    \"rust": [
        \"cargo",
        \"rls",
        \"rustc"
    \],
    \"json": [
        \"jq"
    \],
    \"javascript": [
        \"eslint",
        \"prettier"
    \]
\}

let g:ale_python_pylint_options = "--disable=C0111,C0112,C0301,C0302"
let g:ale_python_flake8_options = "--ignore=E501"
let g:ale_python_mypy_options = "--ignore-missing-imports"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_gopls_enabled = 1
let g:go_def_mapping_enabled = 1
let g:go_code_completion_enabled = 1
let g:go_auto_type_info = 1
let g:go_jump_to_error = 1
let g:go_fmt_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:go_doc_keywordprg_enabled = 1
let g:gotests_bin = '/home/user/go/bin/gotests'

" Extra Syntax Highlighting
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" Yank into system clipboard
set clipboard=unnamed

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Don't wrap lines
set nowrap

" No swap files
set noswapfile

" Show line numbers
set number

" Encodings
set encoding=utf-8
set fileencoding=utf-8

" Fix backspace
set backspace=indent,eol,start

" Enable the mouse
set mouse=a

" Tabs & Indents
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set scrolloff=5
set autoindent

" Highlight current line
set cursorline

" New splits will be at bottom or to the right
set splitbelow
set splitright

" Visual autocomplete for command menu
set wildmenu

" Highlight matching brackets, parens, etc.
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set hlsearch
set incsearch

" Search will center on line if found
nnoremap n nzzzv
nnoremap N Nzzzv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Handy Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap leader
let mapleader = " "

" Remap escape key
inoremap fd <ESC>
vnoremap fd <ESC>

" Switch buffers
nnoremap <silent> gb :bp<CR>
nnoremap <silent> gB :bn<CR>

" Visual Mode Indenting
vnoremap < <gv
vnoremap > >gv

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pydocstring
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> ss <Plug>(pydocstring)
let g:pydocstring_formatter = "numpy"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enhanded python highlighting (needs to be before syntax)
let g:python_highlight_all = 1

" Syntax highlighting
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dracula
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

if exists('$TMUX')
    let g:dracula_colorterm = 0
endif

" Airline
let g:airline#extensions#coc#enabled = 1
let g:airline_theme = 'dracula'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup yaml_files
    autocmd!
    au BufRead,BufNewFile *.yml setfiletype yaml
    au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup make_files
    autocmd!
    au FileType make setlocal noexpandtab
augroup END

augroup docker_files
    autocmd!
    au BufRead,BufNewFile Dockerfile.* set syntax=Dockerfile
augroup END

augroup go_files
    autocmd!
    au BufRead,BufNewFile go.mod set filetype=gomod

augroup markdown_files
    autocmd!
    autocmd FileType markdown set wrap
augroup END

augroup json_files
    autocmd!
    au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup xml_files
    autocmd!
    au FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup html_files
    autocmd!
    au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

autocmd bufwritepost *.sql silent %!sqlfluff fix --dialect=snowflake --force -

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" search filenames
nmap <LEADER>ff :Files <CR>

" search tags in current buffer
nmap <LEADER>ft :BTags <CR>

" search tags in the project
nmap <LEADER>fT :Tags <CR>

" search lines in current buffer
nmap <LEADER>fl :BLines <CR>

" search lines in loaded buffers
nmap <LEADER>fL :Lines <CR>

" ripgrep search results
nmap <LEADER>fr :Rg <CR>

" another alias for ripgrep
nmap <LEADER>rg :Rg <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 20

augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vexplore
augroup END

" Unbind <C-l> so it doesn't interfere with split navigation
nmap <LEADER>rr <Plug>NetrwRefresh

" Shortcut Vexplore
nmap <LEADER>vv :Vexplore<CR>

" Delete netrw buffer once it's hidden
autocmd FileType netrw setl bufhidden=delete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Slime
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
