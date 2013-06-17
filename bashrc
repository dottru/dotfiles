alias apt-get="sudo apt-get -y "
alias aptitude="sudo aptitude -y "
alias update="aptitude update "
alias install="aptitude install "

gitacp() { git add $1 && git commit -m "$2" && git push }

export PATH=$PATH:$HOME/dotfiles/bin/
