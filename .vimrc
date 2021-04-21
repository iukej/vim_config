"Use these brackets to engroup related commands for organization/cleanliness
"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    "



"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

syntax on
"key for all sorts of shenanigans. "\<Space>" better than " ", because doesnt move cursor right
"let mapleader = "\<Space>"

"apparently thing might show something in a cmd center or something?
map <Space> <leader>

map <leader>h :set hlsearch! hlsearch?<CR>
    "change highlighting. I believe the ! will toggle.
map <leader>w :w<CR>
    "save file
map <leader>wq :wq<CR>
    "save file and quit
map <leader>q :q<CR>
    "quit. useful for removing panes (without !)
map <leader>y gg<S-v>Gygg
    "copy everrything in window.
map <leader>f :Files<cr>
    "open fzf.vim
    
"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    " Toggle spellchecking
    " https://gist.github.com/brandonpittman/9d15134057c7267a88a8
function! ToggleSpellCheck()
  setlocal spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <Leader>s :call ToggleSpellCheck()<CR>
    "i don't understand how turns anything off...but it does


"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
"autocmd filetype python nnoremap <leader>r :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype python nnoremap <leader>r :w <bar> exec '!clear;python '.shellescape('%')<CR>
autocmd filetype c nnoremap <leader>r :w <bar> exec '!clear;gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <leader>r :w <bar> exec '!clear;g++ -std=c++17 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    "run or compile/run Note for c++ version, use 17 c++ standard library
"old ->     nmap <leader>r :w<CR>:!clear;python %<CR>
"nmap <leader>r :w<CR>:!clear;python %<CR>
    "run file
    
"nmap <leader>l <c-w><c-w>
    "move between panes
"nmap <leader>gd :sp<CR>gd
    "Look up the definition

"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
        "navigating splits easily. this would be something that conflicts...just be careful here. Ctrl + homerow keys.

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Freed <C-l> in Netrw. <Search this line, for the way i made C-L work by removing the netrw refresh command
"https://github.com/christoomey/vim-tmux-navigator/issues/189#issuecomment-633147327

"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    " Noping ctrl space so I can use it for TMUX
        " https://vi.stackexchange.com/questions/3072/how-can-i-bind-ctrl-space-to-be-esc-when-not-in-insert-mode-and-to-switch-to-in

    "I guess i can just hit escape. The way to catch control space is same as
    "control @ and control ', which are all control @. 


"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    "Plugins  https://github.com/junegunn/vim-plug/wiki/tutorial

"Plugins will be downloaded under the specified directory.
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "This is my fzf plugin  https://github.com/junegunn/fzf#key-bindings-for-command-line
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
    "Need this to get the full thing working in Vim, not just :FZF
    
Plug 'christoomey/vim-tmux-navigator'
    "https://github.com/christoomey/vim-tmux-navigator  So I move between
    "splits and tmux panes easily

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Note, after this step must invoke :PlugInstall from within Vim to install (after restarting Vim).
"Notice how when you call :PlugInstall, the ones that are already installed
"return "Already Installed"







"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


"set hlsearch 
"below is for default starting with the relative numbers turned on. Instead it's currently written to start with the standard line numbering and you're allowed to toggle by pressing spacebar. Using number followed by G or gg may be superior to hopping around using relative numbers because you can jump back to the last position using CTRL + O, and forward between these jumps using CTRL + I.
set number relativenumber
"set number

"nnoremap <SPACE> <Nop>
"Note that map covers normal, visual select, and operator pending modes. Doesn't cover insert which, is perfect.
"map <CR> G


"look up and down
"map K 20<c-y>
"map J 20<c-e>

"bol, eol
map H ^
map L $

"so I can copy/paste using system clipboard
set clipboard=unnamed

"run current python file using just (CTRL + Space) https://stackoverflow.com/questions/18948491/running-python-code-in-vim
"nmap <F5> :w<CR>:!clear;python %<CR>
"imap <F5> <ESC>:w<CR>:!clear;python %<CR>
"Below simply hits f5 easily, to run current script
"nmap <C-m> <F5>
"imap <C-m> <F5>
"^for some reason, the two bits above will make the current script run as a python script just by pressing enter. Switched these out with the below.
nmap <F5> :w<CR>:!clear;python %<CR>
"nmap <CR> :w<CR>:!clear;python %<CR>

"Folding Logic Below vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv 
    "u don't need to see all the inner workings of functions once you're okay with them

set foldmethod=indent
    "fold on indent level
set foldnestmax=4
    "covers all my functions, don't go crazy with the folding
"set foldcolumn=4
    "for sidebar explaining folds https://vi.stackexchange.com/questions/15437/use-of-foldcolumns-in-vim
set foldlevel=0
    "default number folds when open file
    "starting here, gives me func dec, documentation, inner functions, and return val
    "briefly experimenting w this, it makes the architecture of my code from l1 and forward much easier to understand
        "without getting lost in the weeds.

map <leader>n :sp<CR>zMzz


"map <CR> za
map <CR> zA

"for remembering folds between vim sessions https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save
"Note that this must be below the above to work
"augroup remember_folds
"  autocmd!
"  autocmd BufWinLeave * mkview
"  autocmd BufWinEnter * silent! loadview
"augroup END
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ End Folding Logic

"File Explorer Logic Below vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    "https://shapeshed.com/vim-netrw/   Some good stuff that I'm working with
let g:netrw_liststyle = 3
        "3 is the default for the tree type
let g:netrw_banner = 0
        "Remove banner
let g:netrw_preview = 1
        "horizontal previe splits
let g:netrw_keepdir = 0
        "change working dir on the fly, as traverse structure
"let g:netrw_browse_split = 4
        "Split off to the right
"let g:netrw_winsize = 30
        "Make the tree/file explorer only 30% of the screen
        "maybe don't need, i end up going into the file anyway
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
        "For line numbers on fileexplorer
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
        "Hide .dotfiles
let g:netrw_hide = 1                   
        "Hide by default

" Freed <C-l> in Netrw   "https://github.com/christoomey/vim-tmux-navigator/issues/189#issuecomment-633147327
                         "See comment from 'mgarort'

nmap <leader><leader><leader><leader>l <Plug>NetrwRefresh
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
                "Tell me which file is in the split.
                "Original docs-> http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline'
                

set laststatus=2


"set statusline=%{expand('%:p:h:t')}/\ \ \ \ \ \ %t               
                        "https://vi.stackexchange.com/a/15632 
                        "Template for all the stuff below

set statusline=%{expand('%:p:h')}/\ \ \ \ \ \ \ \ \ \ \ \ \ \ 
                        "Gives me full path. And then spaces, seperate path
                        "and file name when window small
                        "see :help expand() for docs

set statusline+=%=
                        "Right justify from here onwards

set statusline+=%t\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
                        "t is file name. And a bunch of spaces, so that 
                        "when working w/ splits file name and next path
                        "not top of eachother

"hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
"hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none
highlight StatusLine   ctermfg=15  guifg=#ffffff ctermbg=237 guibg=#4e4e4e cterm=bold gui=bold
highlight StatusLineNC ctermfg=245 guifg=#b2b2b2 ctermbg=235 guibg=#3a3a3a cterm=none gui=none
                        "Highlights the active window https://superuser.com/a/385572

"Below here is all old stuff I've toyed w/ but don't want to dump
"
"set statusline+=%3*\ %<%F
"set statusline+=%<%F
                    "https://stackoverflow.com/a/56609519 (and below)
                    "Cool lone set

"highlight StatusLineNC cterm=bold ctermfg=white ctermbg=darkgray
                    "cool set

"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"Disable Swaps vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
set noswapfile
    "These are a pain in the ass. I compulsive type :w anyway so I don't
    "swap files ever actually helping me recover lost data

"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

" press capital J (Shift + f) to toggle between absolute and relative linenumbers
function! g:ToggleNuMode()
	if(&rnu == 1)
		set norelativenumber
		set number
	else
		set relativenumber 
        "set nonumber
	endif
endfunc
nnoremap R :call g:ToggleNuMode()<cr>

"for easy splits
"nmap L <c-w><c-w>

" Press <CTRL + space> to toggle highlighting on/off, and show current value.
":noremap ` :set hlsearch! hlsearch?<CR> "Most Current
":noremap @ :set hlsearch! hlsearch?<CR>

":noremap <space> :set hlsearch! hlsearch?<CR>
":noremap <leader>h :set hlsearch! hlsearch?<CR>
":noremap <c-n> :set hlsearch! hlsearch?<CR>
set ignorecase

"From Normal Mode, pressing <CTRL + p> will insert a generic print format statement, and move curser to correct position within quotes.
"nmap <c-p> iprint(" {}".format()) <Esc> <s-F><space>
"imap <c-p> print(" {}".format()) <Esc> <s-F><space> 
nmap <c-p> yiWoprint("<Esc>pa {}".format(<Esc>pa))<Esc>F"
imap <c-p> <Esc>eyiWoprint("<Esc>pa {}".format(<Esc>pa))<Esc>F"


"for going back to position of last mark
"https://stackoverflow.com/questions/53911/in-vim-how-do-i-go-back-to-where-i-was-before-a-search

"noremap m ma
noremap <leader>' `
"nmap ' ` 

"nmap 'a `a 
"nmap 'b `b 
"nmap 'c `c 


set autoindent
set tabstop=4
set shiftwidth=4
set expandtab	


"trial for now
":nmap l <Nop>
":nmap h <Nop>

"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    "add relative motions to jump list -> https://stackoverflow.com/a/29746735

" j, k          Store relative line number jumps in the jumplist.
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    "For scrolling properly
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

                "Ha if you don't stop recursion these scroll crazy

"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

        "Colors
set background=dark
set t_Co=256
        "https://github.com/tmux/tmux/issues/699#issuecomment-361469310


    "For changing fold color

highlight Folded ctermbg=234
highlight Folded ctermfg=240
    "Docs -> https://stackoverflow.com/a/16014807
    "Wow this is so much better

"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

""""""""""""""""""All below is for coc.nvim, code complete/etc

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd :sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
