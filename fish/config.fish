# Path to your oh-my-fish.
set fish_path $HOME/dotfiles/ohmyfish

# Theme
set fish_theme l

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins node python cabal

# Path to your custom folder (default path is $FISH/custom)
set fish_custom $HOME/dotfiles/ohmyfish.custom

# Load oh-my-fish cofiguration.
#. $fish_path/oh-my-fish.fish
set PATH ~/.cabal/bin $PATH

set DISTCC_POTENTIAL_HOSTS "localhost haskie spot"

. ~/dotfiles/fish.functions
