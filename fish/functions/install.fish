# Installs packages via local package manager
function install
  echo Installing package "$argv";
  sudo aptitude install $argv;
end
