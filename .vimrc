if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/dotfiles/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/dotfiles/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
let NERDTreeShowHidden=1

" markdown preview
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"
" colorscheme
"
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" mustang
NeoBundle 'croaker/mustang-vim'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" molokai
NeoBundle 'tomasr/molokai'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Simplenote
NeoBundle 'mrtazz/simplenote.vim'
source ~/.simplenoterc

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Solarized Dark
syntax enable
set t_Co=256
"let g:solarized_termcolors=256
"set background="dark"
"colorscheme solarized
"colorscheme desert256
colorscheme desert
"let g:molokai_original = 1
"let g:rehash256 = 1

"let g:vim_markdown_initial_foldlevel=1

" markdownファイル、Simplenoteのファイルをブラウザでプレビューできるように。
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*},{SN_*} set filetype=markdown
augroup END

" markdownの折りたたみなし
let g:vim_markdown_folding_disabled=1


"
" vim一般設定
"

" ファイルの上書きの前にバックアップを作る/作らない
" set writebackupを指定してもオプション 'backup' がオンでない限り、
" バックアップは上書きに成功した後に削除される。
"set nowritebackup

" バックアップ/スワップファイルを作成する/しない
set nobackup
set noswapfile

" viminfoを作成しない
"set viminfo=

" クリップボードを共有
set clipboard+=unnamed

" 8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal

" 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
"set hidden

" ヒストリの保存数
set history=50

" 日本語の行の連結時には空白を入力しない
set formatoptions+=mM

" Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,h,l,[,],<,>

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" □や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" コマンドライン補完するときに強化されたものを使う
set wildmenu

" マウスを有効にする
if has('mouse')
  set mouse=a
endif

"----------------------------------------
" 検索
"----------------------------------------
" 検索の時に大文字小文字を区別しない
" ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase

" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan

" インクリメンタルサーチ
set incsearch

" 検索文字の強調表示
set hlsearch
" w,bの移動で認識する文字
" set iskeyword=a-z,A-Z,48-57,_,.,-,>
" vimgrep をデフォルトのgrepとする場合internal
" set grepprg=internal

"----------------------------------------
" 表示設定
"----------------------------------------
" スプラッシュ(起動時のメッセージ)を表示しない
set shortmess+=I

" エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
"set noerrorbells
"set novisualbell
"set visualbell t_vb=

" マクロ実行中などの画面再描画を行わない
" WindowsXpまたはWindowテーマが「Windowsクラシック」で
" Google日本語入力を使用するとIビームカーソルが残る場合にも有効
" set lazyredraw
" Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash

" 行番号表示
set number
if version >= 703
  " 相対行番号表示(7.3)
  "set relativenumber
endif

" 括弧の対応表示時間
set showmatch matchtime=1

" タブを設定
" set ts=4 sw=4 sts=4

" 自動的にインデントする
set autoindent

" Cインデントの設定
set cinoptions+=:0

" タイトルを表示
set title

" コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2

" ステータスラインを常に表示
set laststatus=2

" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" コマンドをステータス行に表示
set showcmd

" 画面最後の行をできる限り表示する
set display=lastline

" Tab、行末の半角スペースを明示的に表示する
"set list
"set listchars=tab:>\ ,extends:<,trail:~

" タブの代わりに空白文字を挿入する
set expandtab

" 新しい行を作ったときに高度な自動インデントを行う
"set smartindent

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

" ファイル内の <Tab> が対応する空白の数
set tabstop=4


" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif
" 色テーマ設定
" gvimの色テーマは.gvimrcで指定する
" colorscheme mycolor

""""""""""""""""""""""""""""""
" ステータスラインに文字コードやBOM、16進表示等表示
" iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif

" FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"----------------------------------------
" diff/patch
"----------------------------------------
" diffの設定
if has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    " 7.3.443 以降の変更に対応
    silent! let saved_sxq=&shellxquote
    silent! set shellxquote=
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    silent execute cmd
    silent! let &shellxquote = saved_sxq
  endfunction
endif

" 現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif

" パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

"----------------------------------------
" ノーマルモード
"----------------------------------------
" ヘルプ検索
nnoremap <F1> K

" 現在開いているvimスクリプトファイルを実行
nnoremap <F8> :source %<CR>

" 強制全保存終了を無効化

nnoremap ZZ <Nop>
" カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
" キーボードマクロには物理行移動を推奨
" h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>zv
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv
" l を <Right>に置き換えても、折りたたみを l で開くことができるようにする
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

"----------------------------------------
" 挿入モード
"----------------------------------------
" 入力補助
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap \" \"\"<LEFT>
"inoremap ' ''<LEFT>

" 移動
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <UP>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

"----------------------------------------
" ビジュアルモード
"----------------------------------------

"----------------------------------------
" コマンドモード
"----------------------------------------

"----------------------------------------
" Vimスクリプト
"----------------------------------------
""""""""""""""""""""""""""""""
" ファイルを開いたら前回のカーソル位置へ移動
" $VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g`\"" | endif
augroup END

"----------------------------------------
" 一時設定
"----------------------------------------

" デフォルトの文字コードをutf-8に設定
" このように記載しておくと自動で文字コード判定してくれる
"set encoding=sjis
set encoding=utf-8
"set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set fileencodings=utf-8,sjis,euc-jp,default,latin

"改行はUNIX形式
set fileformat=unix

"シフト移動幅
set shiftwidth=4

"タブを押した時にスペースが挿入される量。
"sts=0でtabstopが適用される。
set softtabstop=0

" ルーラーの表示
set ruler

" 更新されたファイルの自動読み込み
set autoread

" insert modeでカーソルキーが使えない問題の対処。以下参照。　
" :help vt100-cursor-keys
" :help xterm-cursor-keys
set notimeout
set ttimeout
set timeoutlen=3000

" カーソル行の強調
set cursorline

" 自動コメント入力オプションOFF
autocmd FileType * setlocal formatoptions-=ro

" undoファイルをアクティブ、一箇所のディレクトリにまとめる
set undodir=~/.vim/undo/

" 
