## I hate using windows but I have to use it anyways. So, here's the setup.

## Powershell Profile

in $PROFILE file

```pwsh
# Your own file path below.
. $HOME/Projects/dotfiles/windows/_profile.ps1
```

## Basic Packages

```pwsh
. ./install-packages.ps1
nvm install lts # chage version you need
nvm use 22.11.0
npm i -g typescript-language-server
```

## VSCode User Config Files Path

$env:AppData/Code/User

```pwsh
# TODO: Change to links
cp -r -Force ./code/*.json $env:AppData/Code/User
```

## Aalacritty Setup

$env:AppData/alacritty/alacritty.toml

```pwsh
cp -Force ./alacritty/alacritty.toml $env:AppData/alacritty
```

## Vim Setup

$HOME/_vimrc

```pwsh
cp -Force ./_vimrc $HOME/_vimrc
```

## IdeaVim Setup

$HOME/.ideavimrc

```pwsh
cp -Force ./.ideavimrc $HOME/.ideavimrc
```
