# Searches packages via local package manager
function search
  echo Searching packages for "$argv";
  sudo aptitude search $argv;
end
