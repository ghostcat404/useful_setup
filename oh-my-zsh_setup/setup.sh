#! /bin/bash
general_setup() {
	echo "Install oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	echo "Install plugins"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	sed -i 's/plugins=(git*)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc
	sed -i 's/%c%/%~%/g' ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
}



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
	general_setup
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
	general_setup
fi

echo "${GREEN_COLOR} Now please restart your terminal session ${NC}"
echo -en "${GREEN_COLOR} For Mac OS you need run run iTerm2 and use it in the future ${NC}"
