" Initialise the bundle mnanager
execute pathogen#infect()

" enable neo
let g:neocomplcache_enable_at_startup = 1

" Leader is easier as a backslash
" let mapleader = ","

" TODO - tweak the tagging aspect of v
set tags=./tags,.vim/tags

" Configure easytag to regen on savek
let g:easytags_dynamic_files = 1
let g:easytags_file = '~/.vim/tags'
let g:easytags_autorecurse = 1
let g:easytags_events = ['BufWritePost']

" Enable line numbers
set number

" Enable hiding buffers with changes.
set hidden

" Sane usage of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" IDE-esque indentation
set autoindent
set smartindent

" Syntax loading
syntax on
filetype plugin indent on
set background=dark
colorscheme solarized

"set incsearch
"set noundofile

set backspace
set scrolloff=10
set list
set listchars

" If term doesn't have the nutso solarized scheme, just set this
" let g:solarized_termcolors=256

" Buffer navigation
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

nnoremap <Leader>b :ls<CR>                " lists buffers
nnoremap <Leader>e :NERDTreeToggle<CR>    " file explorer>
nnoremap <Leader>s  :source %<CR>         " source cur file
nnoremap <Leader>rb :!bash %<CR>          " run in bash
nnoremap <Leader>ii :!node %<CR>          " run in node
nnoremap <Leader>rt :exec ReadTags()<CR>  " read new tags
nnoremap <Leader>v :tabe ~/.vimrc<CR>     " edit vimrc

" syntastic opt
let g:syntastic_always_populate_loc_list=1

" toggle paste
set pastetoggle=<Leader>p

" how much time you have for combo mappings
set ttimeout
set ttimeoutlen=60

function! QuitNow() 
  :NERDTreeClose
  :q!
endfunction


imap jj <Esc>ja
imap kk <Esc>ja
imap rr <Esc>:w<CR><Leader>rb

" Find mod (crtlp) control f or leaderi/ctrl f in normal
imap <C-F> <Esc>:CtrlPMixed<CR> 
nnoremap <Leader>f :CtrlPMixed<CR>
nnoremap <C-f> :CtrlPMixed<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

nnoremap <Leader>qa :qa!<CR>
nnoremap <Leader>q :exec QuitNow()<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>ss :w !sudo tee %<CR>
nnoremap <Leader>ff :FufFile<CR>
nnoremap <Leader>fb :FufBuffer<CR>

nnoremap <Leader>h :call pathogen#helptags()<CR>

nnoremap <Leader>gg :Gstatus<CR>

"|   q[a-z] *MISC* q to record a macro to $id
"|   let @[a-z] = 'contents'; to define a macro
"|   Control-R Control-R $id to paste macro as is
"|   " [$id] y to yank into reg $id
"|   Control-R [a-z] to paste a reg

let $JS_CMD='nodejs'

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
"let g:miniBufExplAutoStart = 0
"let g:miniBufExplBuffersNeeded = 0

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Smooth scrolling with space or shift+space
" map <S-Space> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
" map <Space> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

nnoremap <Leader>l :TaskList<CR>
nnoremap <Leader>x :Bclose<CR>




