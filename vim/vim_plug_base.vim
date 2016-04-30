" install command:
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh |
" sh -s ~/.vim/bundle

if &compatible
 " 既にオプションを設定した後にset nocompatibleすると値が変わる
 set nocompatible
endif

set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/bundle'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('vim-jp/vimdoc-ja')

" utils
call dein#add('sjl/gundo.vim',{
   \ 'if': "has('python')"
   \})

" filetype
call dein#add('nikolavp/sparql.vim', {
   \ 'on_ft': 'sparql'
   \})

call dein#add('mattn/emmet-vim',{
   \ 'on_ft': ['html','css']
   \})

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
