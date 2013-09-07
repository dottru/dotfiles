# -----------------
# -----------------
# -- Function defs

# password file - unused atm
export PF="$HOME/.password";

# Crypted extension
export CRYPT_EXT="cpt"


function Commit () {
  git add "$OUT";
  git commit -m "Added encrypted file ${IN}"
}

function Encrypt () {
  [ -z $PASS ] && GetPass;

  [ -z $1 ] && OUT="${IN}.${CRYPT_EXT}" || OUT=$1;
  cat "$IN" | ccrypt -e -E PASS > "$OUT";

  Msg "Encrypted file to [$OUT].";
  Confirmation "Would you like $OUT committed to SCM?" Commit;
}

function Decrypt () {
  [ -z $PASS ] && GetPass;

  [ -z $1 ] && OUT="${IN%.*}" || OUT=$1;
  cat "$IN" | ccrypt -d -E PASS > "$OUT";
  
  Msg "Decrypted file available at [$OUT].";
  #echo `IgnoreFile "$OUT"`;
}

function GetPass () {
  read -p "Enter your password: ";
  
  if [ -z $REPLY ]; then
    Msg "Password is empty. Exiting.";
    exit 1;
  else
    # Do not save pass right now
    # Msg "Saving password to [${PF}].";
    # echo "$REPLY" > $PF; 
    export PASS="$REPLY";
  fi;
}
