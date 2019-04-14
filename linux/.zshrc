#if [ "$TMUX" = "" ]; then tmux attach; fi

export PATH=$HOME/.config/composer/vendor/bin:$HOME/.cargo/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git history-substring-search)
source $ZSH/oh-my-zsh.sh

# User configuration
set -o vi

export EDITOR="nvim"

alias la='ls -lah'
alias sdn='sudo shutdown now'
alias discord='/opt/Discord/Discord'
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

alias lessh='LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" less -M '

alias timelapse="ffmpeg -framerate 1 -f x11grab -s 2560,1440 -i :0.0+0,0 -vf settb=\(1/60\),setpts=N/TB/60 -r 60 -vcodec libx264 -crf 0 -preset ultrafast -threads 4 timelapse-$$.mkv"
alias jabber="profanity"
alias prj="cd ~/projects"
alias settings="vim ~/.zshrc && source ~/.zshrc"
alias settingsprvt="vim ~/.zshprivate && source ~/.zshrc"
alias vimconf="vim ~/.config/nvim/init.vim"
alias alacrconf="vim ~/.config/alacritty/alacritty.yml"
alias tmuxconf="vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"
alias i3conf="vim ~/.config/i3/config"
alias rndw="feh --randomize --bg-fill ~/Wallpappers/*.*"
alias stoptmux="tmux kill-server"

alias postgresstart="sudo systemctl start postgresql"
alias postgresstop="sudo systemctl stop postgresql"
alias postgresuser="sudo su - postgres"

function timer(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ge `date +%s` ]; do
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
   notify-send "Timer done"
   ytplay "https://www.youtube.com/watch?v=YwANQb4phH0"
}

function ytplay() {
   vlc -I curses $(youtube-dl -g -x "$1")
}
function ytplaylist() {
  urls=($(youtube-dl -g -x -i "$1"))
  (IFS=$' '; vlc -I curses ${urls[*]})
}

function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

setxkbmap -layout us,de,ru -option grp:alt_shift_toggle
export _JAVA_AWT_WM_NONREPARENTING=1

source $HOME/.zshprivate
