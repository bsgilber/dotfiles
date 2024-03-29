" Specify a directory for plugins
call plug#begin('~/.vim/plugins')

" Sensible vim configuration everyone can agree on.
Plug 'tpope/vim-sensible'

" Essential plugins for collaboration and style.
Plug 'editorconfig/editorconfig-vim' " Support editorconfig file.

" Plugins for colour schemes.
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

Plug 'fatih/vim-go'        " Brutal Golang features
Plug 'buoto/gotests-vim'   " Go test generation tool
Plug 'kien/ctrlp.vim'      " Ctrl-P to open anything.
Plug 'scrooloose/nerdtree' " NerdTree is a tree view for vim.
Plug 'w0rp/ale'            " Asynchronous Linting Engine.
Plug 'vim-airline/vim-airline'    " A useful statusbar.
Plug 'sjl/vitality.vim'    " Nicer cursor, tmux interactions.
Plug 'jszakmeister/vim-togglecursor' " Toggle between line and block cursor when supported.
Plug 'tpope/vim-surround'  " Surround motions.
Plug 'tpope/vim-repeat'    " Allow the 'dot' for repeating even for plugins.
Plug 'mileszs/ack.vim'     " Ack support.
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux/vim splits.
Plug 'rizzatti/dash.vim'   " Dash support.
Plug 'dhruvasagar/vim-table-mode' " Easily format tables on the fly with vim.
Plug 'tpope/vim-fugitive'  " Git support.
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Modern, LSP-based autocompletion.

" FZF Vim Integration.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Polyglot plugin which supports many languages.
Plug 'sheerun/vim-polyglot'

" Plugins for languages
Plug 'jparise/vim-graphql'      " GraphQL
Plug 'PProvost/vim-ps1'         " PowerShell
Plug 'elzr/vim-json'            " As above.
Plug 'othree/html5.vim'         " HTML + SVG
Plug 'hashivim/vim-terraform'   " Adds suppport for terraform files (in fact HCP etc)
Plug 'leafgarland/typescript-vim' "TypeScript
Plug 'ianks/vim-tsx'
Plug 'cespare/vim-toml'         " TOML support
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' } " Python Docstrings

" Plugins for JavaScript.
" Create JSDoc comments.
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

" Plugins for Markdown
"   Note: language support is via vim-polyglot.
Plug 'mzlogin/vim-markdown-toc' " Build a TOC for markdown.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Plugins for writing with focus.
Plug 'junegunn/goyo.vim'        " Go into distraction free mode (:Gojo)
Plug 'junegunn/limelight.vim'   " Focus on the current paragraph only.

" Support focus events, even when running in tmux.
Plug 'tmux-plugins/vim-tmux-focus-events'

" Lots of mappings such as [<Space> ]<Space>.
Plug 'tpope/vim-unimpaired'

" Nice splitting / joining.
Plug 'AndrewRadev/splitjoin.vim'

" Line up text, e.g. :Tab /= to line up text on equals sign.
Plug 'godlygeek/tabular'

" Highlight the yanked text briefly.
" Plug 'machakann/vim-highlightedyank'

" NERD Commenter plugin.
Plug 'scrooloose/nerdcommenter'


" Initialize plugin system.
call plug#end()

" --- Simple Vim config.
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set colorcolumn=80      " highlight column 80

set hlsearch            " highlight matches

" Tell search and other tools to ignore files that we don't want to search.
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*

" Word configuration.

    " Dashes are considered parts of a word for the purposes of motions, search
    " autocomplete, etc.
    " TODO: not sure I like this - word motions feel clunkier now so turning it off for a bit. 
    " set iskeyword+=-

" Pane configuration.

    " More natural (to me) splitting.
    set splitbelow
    set splitright

" Colour and terminal configuration.

    " If we have 24bit colour support, use it. Without this line we seem to get
    " the right colours *almost* - except the background!
    if (has("termguicolors"))
        set termguicolors
    endif

" Theme settings

    " Syntax highlighting on, dark background, onedark theme.
    syntax on
    set background=dark
    let g:onedark_color_overrides = {
    \ "comment_grey": { "gui": "#818998", "cterm": "170", "cterm16": "5" }
    \}
    " let g:onedark_terminal_italics=1
    colorscheme onedark

" Enable the mouse. Also enable when in tmux.
set mouse=a
if !has('nvim')
  " Note that this config is not needed in Neovim.
  set ttymouse=xterm2
endif

" Use the system clipboard.
set clipboard=unnamed

" Enable saving backups (swapfiles) and store vim backups in a temp dir
" rather than the local dir.
set swapfile
set dir=~/tmp

" Wildmenu settings, provides much nicer tab completion for commands.
set wildmenu

" Plugin: ctrlp configuration.


    " Ignore some common files for ctrlp, also ignore gitignore.
    let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

    " Now that we have common files ignored, enable searching dotfiles.
    let g:ctrlp_show_hidden = 1

" Plugin: NerdTree settings

    " Toggle NerdTree with Ctrl+N
    map <C-n> :NERDTreeToggle<CR>

    " Open NerdTree automatically on startup.
    " Also focus the *previous* window, i.e. the main window!
    " autocmd vimenter * NERDTree | wincmd p

    " Show or hide hidden files.
    let NERDTreeShowHidden=1

    " But still ignore some normally not needed files.
    let g:NERDTreeIgnore=['\.git$[[dir]]', 'node_modules$[[dir]]', '\.nyc_output$[[dir]]']

    " Ignore the files in our 'wildignore' settings (see higher up in the file).
    let NERDTreeRespectWildIgnore=1

    " Show the current file in NERDTree.
    map <leader>t :NERDTreeFind<cr>

" Plugin: Airline Settings

    " Show the buffers in the tabline.
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#neomake#enabled = 0

" Language Settings

    " All languages - no autocommenting on newlines, 4 spaces soft tabs + expand
    au FileType * set fo-=c fo-=r fo-=o sw=4 sts=4 et

    " Language specific indentation.
    au FileType html           setl sw=2 sts=2 et
    au FileType javascript     setl sw=2 sts=2 et
    au FileType javascript.jsx setl sw=2 sts=2 et
    au FileType typescript     setl sw=2 sts=2 et
    au FileType typescript.tsx setl sw=2 sts=2 et
    au FileType json           setl sw=2 sts=2 et
    au FileType ruby           setl sw=2 sts=2 et
    au FileType yaml           setl sw=2 sts=2 et
    au FileType terraform      setl sw=2 sts=2 et
    au FileType make           set noexpandtab shiftwidth=8 softtabstop=0 " makefiles must use tabs
    au FileType sshconfig      setl sw=2 sts=2 etc

" Spell-checking settings

    " Keep the spellfile in the homedir. This will be a symlink to the dotfiles
    " version of the spellfile.
    set spellfile=$HOME/.vim-spell-en.utf-8.add

    " Spell check markdown and git commit messages.
    autocmd FileType markdown setlocal spell
    autocmd FileType gitcommit setlocal spell

    " For filetypes with spellcheck available, we'll also support auto-complete.
    set complete+=kspell

    " Don't count acronyms / abbreviations as spelling errors
    " (all upper-case letters, at least three characters)
    " Also will not count acronym with 's' at the end a spelling error
    " Also will not count numbers that are part of this
    " Recognizes the following as correct:
    au BufNewFile,BufRead syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
    au BufNewFile,BufRead syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell

" JavaScript Language Settings

    " Support JSX syntax highlighting in *.js, not just *.jsx.
    let g:jsx_ext_required = 0

    " Disable syntax concealing for json files.
    let g:vim_json_syntax_conceal = 0

    " A number of tools allow for comments in JSON files. This line adds comment
    " highlighting in JSON.
    autocmd FileType json syntax match Comment +\/\/.\+$+


" Ruby Language Settings

    " 'Fastlane' file types are ruby files.
    au BufNewFile,BufRead Appfile set ft=ruby
    au BufNewFile,BufRead Deliverfile set ft=ruby
    au BufNewFile,BufRead Fastfile set ft=ruby
    au BufNewFile,BufRead Gymfile set ft=ruby
    au BufNewFile,BufRead Matchfile set ft=ruby
    au BufNewFile,BufRead Snapfile set ft=ruby
    au BufNewFile,BufRead Scanfile set ft=ruby

" Go Language Settings

    " Lots of syntax highlighting!
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_types = 1

    " Show type info.
    " let g:go_auto_type_info = 1

" Markdown language settings

    " I don't find the folding particularly useful, turn it off.
    let g:vim_markdown_folding_disabled = 1

    " Format YAML frontmatter properly.
    let g:vim_markdown_frontmatter = 1

    " I tend to indent lists with two spaces, rather than the four
    " which is the default.
    let g:vim_markdown_auto_insert_bullets = 0
    let g:vim_markdown_new_list_item_indent = 0

    " vim-table-mode - use Markdown table.
    let g:table_mode_corner='|'

" Python Language Settings

    " I tend to use google style docstrings.
    let g:pydocstring_formatter = 'google'

    " The default mapping for Pydocstring is C-l, which interferes with how I
    " navigate splits. Instead, use C-_.
    " Note that pydocstring seems to work very inconsistently and might be better
    " removed.
    nmap <silent> <C-_> <Plug>(pydocstring)

    " Allow setting of classes to None, e.g. 'Thread' to 'None', rather than
    " demanding 'Optional'. Note however that it may be more correct to simply
    " be more strict with code!
    let g:ale_python_mypy_options = '--no-strict-optional'

" Template settings

    " When we have templates, try and use the 'base' type for the syntax, e.g.
    " *.yaml.tpl uses the yaml type.
    autocmd BufNewFile,BufRead *.yml.tpl set syntax=yaml
    autocmd BufNewFile,BufRead *.yaml.tpl set syntax=yaml

" Custom Commands

" Refresh nerdtree and ctrlp.
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

" Ctrl+c exits in the same way as Esc (including sending InsertLeave)
:imap jj <Esc>
:ino <C-c> <Esc>

" Line Number Configuration

    " By default, use hybrid line numbers (i.e. relative numbers, with the
    " current line shown as the _actual_ line number (not zero).
    set number relativenumber

    " This group of autocommands automatically toggles to use normal line
    " numbers on insert mode and hybrid on visual. It also handles switching
    " if we lose or gain focus.
    " We put these autocommands in an autocommand group so that we can turn off
    " this behaviour in its entirity if we need to (such as when we enter focus
    " mode).
    augroup auto_toggle_relative_linenumbers
        autocmd FocusLost * :set number norelativenumber
        autocmd FocusGained * :set number relativenumber
        autocmd InsertEnter * :set number norelativenumber
        autocmd InsertLeave * :set number relativenumber
    augroup end

" Map leader s to save.
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Splitjoin Plugin
" Remember it like this: 's' for 'split', j splits down, k up.
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" I comment with two spaces, ever since some old programming book I read did
" it like this. We also want multi line comments to have the comment symbols
" flush to the left, otherwise we tend to get linting errors.
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

noremap <leader><leader> :tabnew %<cr>

" When in insert mode, highlight the current line.
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" ALE Configuration.

    " When a 'prettierrc' config is present, use it:
    " https://prettier.io/docs/en/vim.html#alehttpsgithubcomdense-analysisale

    " Use prettier for JS/CSS.
    let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'css': ['prettier'],
    \}

    " Reduce the risk of bad commits by linting on save.
    let g:ale_fix_on_save = 1


" FZF (Fuzzy Find) configuration.

    " Note: see GitHub issue: https://github.com/junegunn/fzf/issues/453
    " Basically, we do not want to open files in 'special' buffers like the
    " NerdTree or Quickfix window. At some stage 'sticky' buffers might come
    " into vim, giving a 'native' way to avoid opening files in these buffers.
    " Until then, this is a workaround to first focus a non-sticky window.

    " Prevent FZF commands from opening in none modifiable buffers
    function! FZFOpen(cmd)
        " If more than 1 window, and buffer is not modifiable or file type is
        " NERD tree or Quickfix type.
        if winnr('$') > 1 && (!&modifiable || &ft == 'nerdtree' || &ft == 'qf')
            " Move one window to the right, then up.
            wincmd l
            wincmd k
        endif
        exe a:cmd
    endfunction

    " Ctrl-F for find in files. Then some leader commands for finding in buffers etc.
    nnoremap <C-f> :call FZFOpen(":Files")<CR> 
    nnoremap <silent> <leader>b :call FZFOpen(":Buffers")<CR>
    nnoremap <silent> <leader>~ :call FZFOpen(":Files ~")<CR>
    nnoremap <silent> <leader>h :call FZFOpen(":History")<CR>


" The Silver Searcher (ag) Configuration.

    " Is 'ag' available?
    if executable('ag')
        " For grep, use ag.
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore.
        " Fast enough we don't even need to cache.
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g --path-to-ignore ~/.ignore""'
        let g:ctrlp_use_caching = 0
    endif

" Ack Plugin Configuration

    " Use ag, rather than ack (sorry, I need my .gitignore to be used...).
    let g:ackprg = 'ag --nogroup --nocolor --column --path-to-ignore ~/.ignore'

    " Leader a to quickly get ready to ack. Ack! is used - the bang means "don't
    " open the first result automatically".
    :noremap <Leader>a :Ack!

" Leader d to open in Dash.
:nmap <silent> <leader>d <Plug>DashSearch

" Use persistent undo.
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo
set undofile

" NOTE: Experimental COC configuration.
            
            " For Python code, we can find the 'workspace' root with a pylint
            " or setup.cfg file. This helps if we have a monorepo with many
            " python projects in subfolders.
            autocmd FileType python let b:coc_root_patterns = [".git", ".hg", ".projections.json", ".pylintrc", "setup.cfg"]

            " if hidden is not set, TextEdit might fail.
            set hidden

            " Some servers have issues with backup files, see #649
            set nobackup
            set nowritebackup

            " I don't like losing space to a cmdheight 2 line, but may revert if
            " messages become too long to read.
            " " Better display for messages
            " set cmdheight=2

            " You will have bad experience for diagnostic messages when it's default 4000.
            set updatetime=300

            " don't give |ins-completion-menu| messages.
            set shortmess+=c

            " always show signcolumns
            set signcolumn=yes

            " Use tab for trigger completion with characters ahead and navigate.
            " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
            " inoremap <silent><expr> <TAB>
            "       \ pumvisible() ? "\<C-n>" :
            "       \ <SID>check_back_space() ? "\<TAB>" :
            "       \ coc#refresh()
            " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

            function! s:check_back_space() abort
              let col = col('.') - 1
              return !col || getline('.')[col - 1]  =~# '\s'
            endfunction

            " Use <c-y> to trigger completion.
            inoremap <silent><expr> <c-y> coc#refresh()

            " " Use <c-space> to trigger completion.
            " inoremap <silent><expr> <c-space> coc#refresh()

            " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
            " Coc only does snippet and additional edit on confirm.
            inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
            " Or use `complete_info` if your vim support it, like:
            " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

            " Use `[g` and `]g` to navigate diagnostics
            nmap <silent> [g <Plug>(coc-diagnostic-prev)
            nmap <silent> ]g <Plug>(coc-diagnostic-next)

            " Remap keys for gotos
            nmap <silent> gd <Plug>(coc-definition)
            nmap <silent> gy <Plug>(coc-type-definition)
            nmap <silent> gi <Plug>(coc-implementation)
            nmap <silent> gr <Plug>(coc-references)

            " Use K to show documentation in preview window
            nnoremap <silent> K :call <SID>show_documentation()<CR>

            function! s:show_documentation()
              if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
              else
                call CocAction('doHover')
              endif
            endfunction

            " Highlight symbol under cursor on CursorHold
            autocmd CursorHold * silent call CocActionAsync('highlight')

            " Remap for rename current word
            nmap <leader>rn <Plug>(coc-rename)

            " Remap for format selected region
            xmap <leader>f  <Plug>(coc-format-selected)
            nmap <leader>f  <Plug>(coc-format-selected)

            augroup mygroup
              autocmd!
              " Setup formatexpr specified filetype(s).
              autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
              " Update signature help on jump placeholder
              autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
            augroup end

            " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
            xmap <leader>A  <Plug>(coc-codeaction-selected)
            nmap <leader>A  <Plug>(coc-codeaction-selected)

            " Remap for do codeAction of current line
            nmap <leader>Ac  <Plug>(coc-codeaction)
            " Fix autofix problem of current line
            nmap <leader>qf  <Plug>(coc-fix-current)

            " Create mappings for function text object, requires document symbols feature of languageserver.
            xmap if <Plug>(coc-funcobj-i)
            xmap af <Plug>(coc-funcobj-a)
            omap if <Plug>(coc-funcobj-i)
            omap af <Plug>(coc-funcobj-a)

            " Note: the Ctrl-D range I have disabled as I use Ctrl-D for page down.
            "
            " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
            " nmap <silent> <C-d> <Plug>(coc-range-select)
            " xmap <silent> <C-d> <Plug>(coc-range-select)

            " Use `:Format` to format current buffer
            command! -nargs=0 Format :call CocAction('format')

            " Use `:Fold` to fold current buffer
            command! -nargs=? Fold :call     CocAction('fold', <f-args>)

            " use `:OR` for organize import of current buffer
            command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

            " Add status line support, for integration with other plugin, checkout `:h coc-status`
            set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

            " Using CocList
            " Show all diagnostics
            nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
            " Manage extensions
            nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
            " Show commands
            nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
            " Find symbol of current document
            nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
            " Search workspace symbols
            nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
            " Do default action for next item.
            nnoremap <silent> <space>j  :<C-u>CocNext<CR>
            " Do default action for previous item.
            nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
            " Resume latest coc list
            nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

map <leader>f :Goyo<cr>

function! s:goyo_enter()
  " Zoom in and hide tmux status if we are in tmux.
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  " Hide the mode and command.
  set noshowmode
  set noshowcmd

  " Disable automatically changing line number mode (otherwise line numbers
  " come back when we go into/outof focus).
  autocmd! auto_toggle_relative_linenumbers

  " Start limelight.
  Limelight 0.8
endfunction

function! s:goyo_leave()
  " Zoom out and hide tmux status if we are in tmux.
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  " Show the mode and command.
  set showmode
  set showcmd

  " Disable automatically changing line number mode (otherwise line numbers
  " come back when we go into/outof focus).
  autocmd! auto_toggle_relative_linenumbers

  " Stop limelight.
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
