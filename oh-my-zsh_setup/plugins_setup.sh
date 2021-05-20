echo "Install plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/plugins=(git*)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc
sed -i 's/%c%/%~%/g' ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
