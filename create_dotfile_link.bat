@echo off

rem force install flag
set FORCE=0
if "%1"=="-f" (set FORCE=1)

rem check symbolic link
if exist %USERPROFILE%\.vimrc (
  if %FORCE%==1 (
    del %USERPROFILE%\.vimrc
  )
)
mklink %USERPROFILE%\.vimrc %USERPROFILE%\dotfiles\.vimrc
if exist %USERPROFILE%\.gvimrc (
  if %FORCE%==1 (
    del %USERPROFILE%\.gvimrc
  )
)
mklink %USERPROFILE%\.gvimrc %USERPROFILE%\dotfiles\.gvimrc
if exist %USERPROFILE%\.vimshrc (
  if %FORCE%==1 (
    del %USERPROFILE%\.vimshrc
  )
)
mklink %USERPROFILE%\.vimshrc %USERPROFILE%\dotfiles\.vimshrc
if exist %USERPROFILE%\.vim (
  if %FORCE%==1 (
    rmdir %USERPROFILE%\.vim
  )
)
mklink /D %USERPROFILE%\.vim %USERPROFILE%\dotfiles\.vim

goto END
:END
