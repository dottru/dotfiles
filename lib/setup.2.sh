#!/usr/bin/env bash

. lib/control.sh
. lib/txt.sh

  function GetString() {
    PROMPT = ${1:-"INPUT"}
    OUT    = ${2:-"REPLY"}

    read -p "${PROMPT}> "
    export $OUT=$REPLY
  }

  GetString "gh.user" "GHUSER"
  GetString "gh.email" "GHEMAIL"

  GetString "Encryption pass" "ENCPASS"
