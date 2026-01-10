#---------------------------------workspaces---------------------------#
#
alias ls='ls --color'
#alias cd='z'

WORKSPACE="$HOME/Documents/workspace"

alias space='cd $WORKSPACE'
alias cdgo='cd $WORKSPACE/gospace/src/github.com'
alias cdwren='cd $WORKSPACE/wrenspace/src/github.com' 
alias cdc='cd $WORKSPACE/cspace/src/github.com'
alias cdxpp='cd $WORKSPACE/ccspace/src/github.com' 
alias cdjs='cd $WORKSPACE/jsspace/src/github.com'
alias cdgithub='cd $WORKSPACE/github'
alias cdpy='cd $WORKSPACE/pyspace/lrn'
alias cdvim='cd $WORKSPACE/miscellaneous/tools/vim/src/'
alias cdneo='cd $WORKSPACE/miscellaneous/tools/neovim/configured'

# mostly used folder 
alias cdnow='cd $WORKSPACE/miscellaneous/2023/'

#-----------------------------------git-aliases-------------------------------#
#
alias ga='git add --all'
alias gc='git commit -m'
alias gck='git checkout'
alias gbr='git branch'
alias gl='git log --oneline --all --graph --decorate'





#-----------------------------------wget-------------------------------#
#
#mirror websites
alias wgetm='wget --mirror --convert-links --html-extension'


#-------------------------------misc--------------------------------#

# mpv select mp3's only, no music covers too
alias musi='mpv *.mp3 --no-audio-display'
alias muzi='zsh -c "mpv **/*.mp3 --no-audio-display'  # call this as $ muzi " # note the quote

# auto execute the fzf wrapper
alias goto=". goto"
# auto execute alias_expander
# 	imalias since unalias is used by terminal
alias imalias=". expand_cd_aliases"

alias cpv="rsync -pogbr -hhh --backup-dir=/tmp/rsync -e /dev/null --progress"

# create directories recursively ( make it default )
alias mkdir="mkdir -p"
alias kv='kill_vlc.sh'
alias htop='zenith'
