#!/bin/sh
function message {
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)${1}$(tput sgr 0)"
  echo "---------------------------------------------------------"
}