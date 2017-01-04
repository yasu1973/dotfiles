@echo off

mklink %USERPROFILE%\.vimrc %USERPROFILE%\dotfiles\.vimrc
mklink %USERPROFILE%\.gvimrc %USERPROFILE%\dotfiles\.gvimrc
mklink %USERPROFILE%\.vimshrc %USERPROFILE%\dotfiles\.vimshrc
mklink %USERPROFILE%\.vim %USERPROFILE%\dotfiles\.vim

