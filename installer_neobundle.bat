rem @echo off

rem bundleディレクトリの生成
echo "test"
mkdir %userprofile%\dotfiles\.vim\
mkdir %userprofile%\dotfiles\.vim\bundle\

rem bundleディレクトリへ移動
cd %userprofile%\dotfiles\.vim\bundle\

rem bundleをgitでインストール
git clone git://github.com/Shougo/neobundle.vim
