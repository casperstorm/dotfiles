#!/bin/sh
source packages.sh
source symlink.sh
source diagnostics.sh
source helpers.sh

message "Select an operation:"
options=("Install packages and casks" "Symlink dotfiles" "Setup packages and casks" "Update packages and casks")
select opt in "${options[@]}"
do
  case $opt in
    "${options[0]}")
      run_diagnostics
      install_packages
      install_casks
      break
      ;;
    "${options[1]}")
      symlink
      break
      ;;
    "${options[2]}")
      additional_setup
      break
      ;;
    "${options[3]}")
      update_packages
      update_casks
      break
      ;;
    *) echo "invalid option $REPLY";;
  esac
done
exit 0
