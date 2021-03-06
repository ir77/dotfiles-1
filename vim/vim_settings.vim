"共通の設定

set nocompatible

scriptencoding utf-8

"表示関係
set number
set showmode
set listchars=tab:>-,eol:$,nbsp:-
set list
set cursorline
set showcmd
set wrap
set hlsearch
set showtabline=2
set laststatus=2
"左
set statusline=%f[B-No.%n]%r%y\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m
set statusline+=%=
"右
set statusline+=%l,%c%V%5P

set ruler
syntax enable

"エンコード関連
"termencodingがなければ設定
if &termencoding == 0
 let &termencoding = &encoding
 set encoding=utf-8
endif
"保存
if ( &modifiable )
 set fileencoding=utf-8
endif
"開く
set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin

"<Tab>関連
set tabstop=4
set softtabstop=0
set expandtab

"折りたたみ関連
set foldcolumn=4
set foldmethod=indent
" 折りたたみを閉じる
set foldlevel=-1

"UNDO関連
set undolevels=1000
"無限UNDO
if has('persistent_undo')
 set undodir=~/.vim/undo
 set undofile
endif

"検索
set ignorecase
set smartcase
set incsearch
set wrapscan

"バックアップ
set nobackup
set writebackup

"キー関連
set notimeout
set ttimeout
set timeoutlen=100
map Q gQ
"インデント
set autoindent
"set smartindent
set shiftwidth=1

"その他
set modeline
set modelines=5
set noinsertmode
set backspace=2
set whichwrap=b,s,h,l,<,>,[,]
set autoread
set wildmenu
set history=100
filetype plugin indent on
if &encoding == 'utf-8'
 set ambiwidth=double
endif
"マウスを無効に
set mouse=
set hidden
set completeopt-=preview
"set smarttab
"set showmatch
"colorscheme elflord
"autocmd FileType make setlocal noexpandtab
"
if has('vim_starting')
 let &runtimepath.=',' . expand('$VIMRUNTIME')
endif

"キー設定
" 挿入モードで左右移動禁止
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
noremap <F1> <Nop>

"自動コマンド
augroup VirusDropboxAuto
 autocmd!
 autocmd FileType perl,cgi compiler perl
 autocmd BufRead,BufNewFile *.gradle set filetype=groovy
 autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
 autocmd FileType html compiler tidy
 " gnu-emacs yesでエラーメッセージをそれっぽく
 autocmd FileType html setlocal makeprg=tidy\ -quiet\ -errors\ -raw\ -xml\ --gnu-emacs\ yes\ \"%\"
 " rubyの時インデントを2に
 autocmd BufRead,BufNewFile *.rb setlocal shiftwidth=2 tabstop=2 expandtab
 autocmd FileType mkd,markdown setlocal noexpandtab
augroup END

"file name:.vimrc.local
"
function! s:vimrc_local(loc)
 let files = findfile('.vimrc.local',escape(a:loc,' ').';',-1)
 for i in reverse(filter(files, 'filereadable(v:val)'))
  source `=i`
 endfor
endfunction

" markdown syntax
" see markdown syntax file or http://mattn.kaoriya.net/software/vim/20140523124903.htm
let g:markdown_fenced_languages = [
   \ 'javascript',
   \ 'js=javascript',
   \ 'cpp',
   \ 'ruby',
   \]
