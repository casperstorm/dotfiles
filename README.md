# dotfiles

<img width="1624" alt="Screenshot 2022-08-07 at 00 41 25" src="https://user-images.githubusercontent.com/2248455/183268095-55a7b628-1307-4cdf-8999-89253128a0d9.png">

## prerequisites

brew: https://brew.sh/  
ohmyz: https://ohmyz.sh/#install  
fonts: https://www.nerdfonts.com/font-downloads  

```bash
# utils
brew install zoxide
brew install rg
brew install fd
brew install asdf
```

## terminal
```bash
brew install alacritty
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install tmux
# and tpm (tmux package manager)
# https://github.com/tmux-plugins/tpm#installation
```

## nvim
```bash
brew install nvim
# and packer (plugin manager)
# https://github.com/wbthomason/packer.nvim#quickstart
npm install -g nvim
pip3 install nvim

# lsp's for nvim
brew install rust-analyzer
```

## symbolic links
```bash
# i normally make symbolic links to where i want configs
# eg.
ln -s tmux/.tmux.conf ~ 
ln -s zsh/.zshrc ~
ln -s nvim ~/.config
ln -s alacritty ~/.config
```
