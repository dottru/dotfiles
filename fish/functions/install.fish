# Installs packages via local package manager
function install
  echo Installing package "$argv";
  sudo pacman -S --noconfirm $argv;
end
