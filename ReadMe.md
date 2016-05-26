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

# githubにpush
リポジトリにファイルをaddし、commit & push する。

	cd ~/dotfiles # if windows use this > cd %HOMEPATH%/dotfiles
	$ git init
	$ git add .
	$ git commit -m 'first commit'
	$ git remote add origin https://github.com/your_name/dotfiles.git
	$ git push origin master # type username & password

# 他のPCで参照
dotfileリポジトリを取り込む。

    $ cd ~/ # if windows use this > cd %HOMEPATH%
    $ git clone https://github.com/your_name/dotfiles.git
    $ sh create_dotfile_link.sh # if windows use this > create_dotfile_link.bat

# 追加、更新
他のPCで環境ができればあとはどのPCからであっても追加、更新が可能になる。

    $ git add .  # if add file exists.
    $ git commit -m 'edit files'
    $ git push origin master

追加したファイルがない場合は以下でもよい。

    $ git commit -a -m "edit files"
    $ git push origin master




