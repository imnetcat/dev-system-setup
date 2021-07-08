call plug#begin()

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Syntax higlight
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'

" Save keystrokes
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Code comments
Plug 'scrooloose/nerdcommenter'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" UI
Plug 'scrooloose/nerdtree'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()

" Required for operations modifying multiple buffers like rename.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Recently vim can merge signcolumn and number column into one
set signcolumn=yes

" JavaScript settings
let g:jsx_ext_required = 0

" Syntax highlight
syntax on

" UI
set nowrap
set ruler
set showmode
set showmatch
set showcmd
set wildmenu

set path+=**

set laststatus=2

" Line numbers
set number
autocmd winenter,focusgained * :setlocal number relativenumber
autocmd winleave,focuslost   * :setlocal number norelativenumber

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault

" Moving around
set whichwrap=b,s,<,>,[,]

" Indentation settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set expandtab
set shiftround

" File saving and reading
set autowrite
set autoread
set nobackup
set nowritebackup
set noswapfile

" Enable spell cheking for certain types of files
autocmd FileType gitcommit setlocal spell
autocmd FileType text      setlocal spell
autocmd FileType plaintex  setlocal spell
autocmd FileType tex       setlocal spell
autocmd FileType markdown  setlocal spell
autocmd FileType rst       setlocal spell

" Enable alternative keyboard layout (C-^ to switch)
set keymap=russian-jcuken
set iminsert=0
set imsearch=0

" Easier keyboard mappings for keyboard layout switching
inoremap <C-Space> <C-^>
nnoremap <C-Space> a<C-^><Esc>

" Splits
set splitbelow
set splitright

" delimitMate settings
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" ------------------------------------------------------------------------------
"  KEYBINDINGS
" ------------------------------------------------------------------------------
set mouse=a

" Setup a convenient leader key
let mapleader = ','

" Clear search highlighting
nmap <leader>/ :nohlsearch<CR>

" NERDTreee shortcuts
nnoremap <leader>n :NERDTreeToggle<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting
vmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

" Import organization
command! -nargs=0 OrganizeImport :call CocAction('runCommand', 'editor.action.organizeImport')
nmap <leader>oi :OrganizeImport<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ------------------------------------------------------------------------------
"  COLORSCHEME
" ------------------------------------------------------------------------------
set termguicolors
set background=light

colorscheme onehalflight
let g:airline_theme='onehalflight'

let g:solarized_termcolors=256
let g:airline_powerline_fonts = 0
