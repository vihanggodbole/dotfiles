
export NVM_DIR="/Users/vihanggodbole/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# added by Anaconda3 4.2.0 installer
export PATH="/Users/vihanggodbole/anaconda/bin:$PATH"

#for tesseract by vihang
export TESSDATA_PREFIX=“/Users/vihanggodbole/tesseract/“

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vihanggodbole/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/vihanggodbole/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vihanggodbole/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/vihanggodbole/Downloads/google-cloud-sdk/completion.bash.inc'; fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for npm by vihang
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


# for qt
export PATH="$HOME/Qt/5.12.0/clang_64/bin:$PATH"

# for tree command using colorls NOTE: Feature not yet added to colorls. Wait for latest update.
function tree() {
    if [ -z $@]
    then
        command colorls --tree
    else
        command colorl --tree=$@
    fi
}

#for colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias dir="colorls -d"
alias files="colorls -f"
alias report="colorls --report"


regex='^~*[0-9a-z'
function ls() {
    if [ -z $@ ]
    then
        command colorls
    # Check if directory or file is passed as argument
    elif [[ -d $1 ]] || [[ -e $1 ]]
    then
        command colorls $1
    else
    # Look into getops
    case $1 in
    # different options for ls
        -1) command colorls -1
            ;;
        -a) command colorls -a
            ;;
        -l) command colorls -l
            ;;
        -size) command colorls -lS
            ;;
        -time) command colorls -t
            ;;
        *)  command ls "$@"
            ;;
    esac
    fi
}

#for custom prompt NOTE: Always start non printing characters with \[ and end with \]
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White

bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White

unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White

bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White

txtrst='\[\e[0m\]'    # Text Reset
export PS1="$bldred> $txtpur\W $bldred$ $txtrst"

# Cool scripts todo:
# .direnv