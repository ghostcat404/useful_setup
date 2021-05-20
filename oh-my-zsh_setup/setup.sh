#! /bin/bash

GREEN_COLOR='\033[0;32m'
RED_COLOR='\033[0;32m'
NC='\033[0m'
system_name=$(uname)


if [[ "$system_name" == "Linux" ]]
then
	apt update && apt upgrade
	echo "${GREEN_COLOR} Install zsh ${NC}"
	apt install zsh
	if ! [ -x "$(command -v git)" ]
	then
		apt install git
	fi
fi
if [[ "$system_name" == "Darwin" ]]
then
	if ! [ -x "$(command -v brew)" ]
	then
		echo "${GREEN_COLOR} Installing package manager brew ${NC}"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	echo "${GREEN_COLOR} Install item2 and zsh ${NC}"

	brew cask install iterm2
	brew install zsh

	if ! [ -x "$(command -v git)" ]
        then
                brew install git
        fi
fi
