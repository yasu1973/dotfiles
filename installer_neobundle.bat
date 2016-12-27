rem @echo off

rem bundleディレクトリの生成
mkdir %userprofile%\.vim\bundle

rem bundleディレクトリへ移動
cd %userprofile%\.vim\bundle

rem bundleをgitでインストール
git clone git://github.com/Shougo/neobundle.vim
