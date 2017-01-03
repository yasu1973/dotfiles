if &compatible
  set nocompatible               " Be iMproved
endif

" vimprocのWindows用DLLダウンロード機能をActiveに
" vimprocが呼ばれる前にActiveにする必要あり。
let g:vimproc#download_windows_dll=1

" Required:
set runtimepath^=~/dotfiles/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/dotfiles/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" snippet and Colorscheme
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

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

" Simplenote
"NeoBundle 'mrtazz/simplenote.vim'
"source ~/.simplenoterc

" lightline.vim
" Vimの画面の一番下にあるステータスラインの表示内容が強化
NeoBundle 'itchyny/lightline.vim'

" vim-indent-guides
" インデントに色をつけてくれる
NeoBundle 'nathanaelkane/vim-indent-guides'

" 各行の行末に不要に入ってしまったスペースを色つけて表示
NeoBundle 'bronson/vim-trailing-whitespace'

" surround 置換
NeoBundle 'tpope/vim-surround'

" コメントの拡張
NeoBundle 'tomtom/tcomment_vim'

" 補完
NeoBundle 'Shougo/neocomplete.vim'

" git連携
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" filer
NeoBundle 'Shougo/vimfiler'

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }
NeoBundle 'Shougo/vimshell.vim'


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
"set background=light
"colorscheme solarized
"colorscheme desert256
"colorscheme desert
syntax on
colorscheme molokai
"let g:molokai_original = 1
let g:rehash256 = 1

"let g:vim_markdown_initial_foldlevel=1

" markdownファイル、Simplenoteのファイルをブラウザでプレビューできるように。
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*},{SN_*} set filetype=markdown
    let g:previm_show_header = 0
    let g:previm_disable_default_css = 0
    let g:previm_custom_css_path = '~/dotfiles/markdown/github_plus.css'
augroup END

" markdownの折りたたみなし
let g:vim_markdown_folding_disabled=1

"
" vim-indent-guides
"
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" ガイドの幅
let g:indent_guides_guide_size = 1
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray


""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-M> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" .ファイルも表示できるように
call unite#custom#source('buffer,file,file_mru', 'matchers', "matcher_default")

""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" neocomplete.vimの設定
""""""""""""""""""""""""""""""
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><C-i>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" lightline.vimの設定
""""""""""""""""""""""""""""""
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
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
"inoremap <C-a> <Home>
"inoremap <C-e> <End>
"inoremap <C-b> <Left>
"inoremap <C-f> <Right>
"inoremap <C-n> <Down>
"inoremap <C-p> <UP>
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

