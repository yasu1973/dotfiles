# dotfiles の管理
ドットファイルを各環境で使いまわせるようにgithub上で管理する

# githubにリポジトリを作成
まずはgithub等git上にdotfilesリポジトリを作成する必要がある。
githubの場合はSignIn後、new repository を選択してリポジトリを作成。
リポジトリ名はわかりやすく dotfiles とかで。

# 管理するファイルの用意
次はローカル側の作業。
ホームディレクトリに dotfiles ディレクトリを作成し、そこにドットファイルを作成＆移動。

	$ cd ~/
	$ mkdir dotfiles
	$ mv .vimrc dotfiles
	$ mv .bash_profile dotfiles

# リンクの作成
実際のファイルはホームディレクトリにある必要があるので、そちらにはリンクを貼る。
リンク作成用のスクリプトを用意しておくと便利。

	#!/bin/sh
	$ ln -sf ~/dotfiles/.vimrc ~/.vimrc
	$ ln -sf ~/dotfiles/.bash_profile ~/.bash_profilea

