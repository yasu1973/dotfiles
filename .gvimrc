" display & information
set lines=38        " typical
set columns=172      " margin for 'number' and 'foldcolumn'
set cmdheight=2     " MacVim $VIM/gvimrc overwrites my .vimrc settings
"set guioptions=c    " show no GUI components

" no way to use a mouse
"set mouse=
"set nomousefocus
"set mousehide

" font
if has('win32')
    " When VL Gothic isn't found in the system, use MS Gothic.
    "set guifont=VL_Gothic:h10:cSHIFTJIS,MS_Gothic:h10:cSHIFTJIS
    set guifont=Consolas:h10,Lucida_Console:h10:w5 guifontwide=MS_Gothic:h10
    set linespace=0
    " メニューの文字化け対策
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
elseif has('mac')
"    set guifont=VL_Gothic:h16
"    set linespace=0
endif

" turn off disabling IM at entering input mode
if exists('&imdisableactivate')
    set noimdisableactivate
endif

" colorscheme
"colorscheme desert256

syntax enable
set background=dark
"colorscheme solarized
colorscheme molokai

