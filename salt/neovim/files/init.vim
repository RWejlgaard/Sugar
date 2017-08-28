set nocompatible
filetype off

if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif

let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif
let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'gmarik/vundle'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-pathogen'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set nu
set ts=4
set backspace=2
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

nnoremap nt :NERDTreeToggle<CR>
nnoremap qqq :qall<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Up> :resize +1<CR>
nnoremap <C-Right> :vertical resize +1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-j> :resize -1<CR>
nnoremap <C-k> :resize +1<CR>
nnoremap <C-l> :vertical resize +1<CR>
nnoremap <C-h> :vertical resize -1<CR>
"nnoremap <Up> :echo "USE HJKL"<CR>
"nnoremap <Down> :echo "USE HJKL"<CR>
"nnoremap <Left> :echo "USE HJKL"<CR>
"nnoremap <Right> :echo "USE HJKL"<CR>
nnoremap <M-h> :wincmd h<CR>
nnoremap <M-j> :wincmd j<CR>
nnoremap <M-k> :wincmd k<CR>
nnoremap <M-l> :wincmd l<CR>

colorscheme brogrammer
