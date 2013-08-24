"---------------------------------------------------------------------------
" 基本的な設定:
"---------------------------------------------------------------------------
" vi互換をオフする
set nocompatible

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"---------------------------------------------------------------------------
"" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
"set nobackup
"" swapファイルを生成しない
"set noswapfile
" バックアップファイルのディレクトリを指定する
set backupdir=$HOME/.dotfiles/.vim/bkup
"スワップファイル用のディレクトリを指定する
set directory=$HOME/.dotfiles/.vim/bkup


"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"---------------------------------------------------------------------------
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"インクリメンタルサーチを行う
set incsearch
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
" 検索時に一致する部分をハイライト
set hlsearch
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>


"---------------------------------------------------------------------------
" 編集に関する設定:
"---------------------------------------------------------------------------
" インデント幅
set shiftwidth=4
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" 新しい行を作った時に高度な自動インデントを行う
set smarttab
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" クリップボード共有
set clipboard+=unnamedplus,unnamed
" 変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"---------------------------------------------------------------------------
" 行番号を非表示 (number:表示)
set nonumber
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" カラースキーム
colorscheme desert

"---------------------------------------------------------------------------
" キーマップ
"---------------------------------------------------------------------------
" Space . で.vimrc再読み込み
nmap <Space>. :source ~/.vimrc<CR>
" Space , で.vimrcを開く
nmap <Space>, :e ~/.vimrc<CR>
" 折り返されている行の見かけの前・次の行にj・kで移動
nmap k gk
nmap j gj
" Space k でバッファを閉じる
nmap <Space>k :close<CR>


"---------------------------------------------------------------------------
" NeoBundle
"---------------------------------------------------------------------------
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.dotfiles/.vim/bundle/'))
endif

NeoBundle 'Sgit@github.com/hougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'scrooloose/syntastic'

filetype plugin on
filetype indent on

"---------------------------------------------------------------------------
" YankRing.vim
"---------------------------------------------------------------------------
" , y でヤンク履歴
nmap ,y :YRShow<CR>

"---------------------------------------------------------------------------
" undotree.vim
"---------------------------------------------------------------------------
" undo履歴を表示する。? でヘルプを表示
nmap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitLocation = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

"---------------------------------------------------------------------------
" Unite.vim
"---------------------------------------------------------------------------
" 起動時にインサートモードで開始
"let g:unite_enable_start_insert = 1
" バッファ一覧
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,u :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
" undotree.vim
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"---------------------------------------------------------------------------
" VimFiler.vim
"---------------------------------------------------------------------------
nmap <Leader>f :VimFiler -split -simple -winwidth=35 -no-quit<CR>
