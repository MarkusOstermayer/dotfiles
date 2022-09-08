#!/bin/bash

# Based on the VSCode-Script from https://github.com/karaage0703/vscode-dotfiles

# VSCodium Pluginlist
# Generated with "codium --list-extensions"
pkglist=(
  GitHub.github-vscode-theme
  Gruntfuggly.todo-tree
  James-Yu.latex-workshop
  jprestidge.theme-material-theme
  ms-python.python
  ms-toolsai.jupyter
  ms-vscode.cpptools
  notskm.clang-tidy
  PKief.material-icon-theme
  streetsidesoftware.code-spell-checker
  uloco.theme-bluloco-dark
  vscodevim.vim
  yzhang.markdown-all-in-one
  zhuangtongfa.material-theme
)

for i in ${pkglist[@]}; do
  codium --install-extension $i
done
