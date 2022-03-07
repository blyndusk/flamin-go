#!/bin/bash

function _brew_secure_install_from_array_ () {
  ARRAY=$1
  CASK=$2
  for i in "${ARRAY[@]}"; do
    if [ "$(which "$i")" != 0 ]; then
      exec=(brew install"$CASK" "$i")
    else
      ui_info "\"$i\" command already exist. Updating.."
      exec=(brew upgrade"$CASK" "$i")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}


function _apt_secure_install_from_array_ () {
  ARRAY=$1
  for i in "${ARRAY[@]}"; do
    if [ "$(which "$i")" != 0 ]; then
      exec=(sudo apt install "$i")
    else
      ui_info "\"$i\" command already exist. Skipping.."
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}