typeset -U path fpath manpath
path=(
 $HOME/bin(N-/)
 #個人的にソースから入れたものは$HOME/localに
 $HOME/local/bin(N-/)
 $path
 )

fpath=(
 /usr/local/share/zsh/site-functions(N-/)
 $fpath
)

if [ -z "$LANG" ] ; then
 LANG="ja_JP.UTF-8"
fi

export EDITOR=vim