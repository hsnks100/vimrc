function! KSOO()

    syntax on 
    "language en_US.UTF-8
    set fileencodings=utf-8,euc-kr
    set encoding=utf-8 

    set langmenu=en_US
    let $LANG = 'en_US'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    set guifont=Inconsolata\ Bold\ 14

    set guioptions-=m
    set guioptions-=T
    set number            " line Ç¥½Ã¸¦ ÇØÁÝ´Ï´Ù.
    set laststatus=2                                      

    set autoread
    set cmdheight=2                                       
    set cursorline                                        
    set shortmess=atI                                     
    set nu				                                  
    set smarttab                                          
    set smartindent                                       
    set foldenable                                        
    set mouse=a			                                  
    set foldnestmax=2
    set foldlevel=1
    set ignorecase                                        
    set smartcase                                         
    set ignorecase 
    set hlsearch   
    set nocompatible 
    set bs=indent,eol,start 
    set history=1000   
    set ruler         
    set noswapfile
    set nobackup
    set nowritebackup 
    set title       
    set showmatch  
    set nowrap    
    set wmnu        
    set autochdir
    set noerrorbells visualbell t_vb=
    set hidden
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:#
    set et 

    set ts=4
    set sw=4
    set sts=4 
    set ai 
    set nocursorline
    set guicursor=
    "set noesckeys
    set wrap lbr
    noremap  <silent> k gk
    noremap  <silent> j gj
    noremap  <silent> 0 g^
    noremap  <silent> $ g$


    if has('autocmd')
        autocmd GUIEnter * set visualbell t_vb=
    endif
    let g:mapleader="\\"

    set t_Co=256
    set cindent cino=j1,(0,ws,Ws

    "nmap <C-j> :bn<CR>
    "nmap <C-k> :bp<CR>
    "nnoremap <Leader>b :bp<CR>
    "nnoremap <Leader>f :bn<CR>
    imap jj <ESC>j
    imap kk <ESC>k
    imap ,. <ESC>
    cmap ,. <ESC>

    nmap <S-SPACE> i<SPACE><ESC>l
    nmap <S-CR> i<CR><ESC>
    vnoremap p "_dP
    nnoremap x "_x
    nnoremap ciw "_ciw
    inoremap <C-e> <C-x><C-e>
    inoremap <C-y> <C-x><C-y>
    noremap YY :%y+<CR> 
    vnoremap Y "+y
    vnoremap <C-C> "+y
    nnoremap <C-V> "+P
    inoremap <C-V> <ESC>"+pa

    nnoremap <S-Insert> "+P
    inoremap <S-Insert> <ESC>"+pa


    vnoremap <C-V> s<ESC>"+p 
    nnoremap <leader>fed :e ~/layervim/basic.vim<CR>
    nnoremap <leader>feR :source ~/.vimrc<CR>
    nnoremap <leader>d :b#<bar>bd#<CR>
    "unmap ]%
    "unmap [%

    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap gr :vimgrep /<C-R><C-W>/ **<CR>:copen<CR>
    vnoremap gr "gy:vimgrep /<C-R>g/ **
    "nnoremap <Down> <C-w>j
    "nnoremap <Up> <C-w>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l
    nnoremap <C-j> :bn<CR> 
    nnoremap <C-k> :bp<CR> 
    nnoremap [ <C-U>
    nnoremap ] <C-D>
    vnoremap [ <C-U>
    vnoremap ] <C-D>


    nnoremap <C-Left> <C-w><
    nnoremap <C-Right> <C-w>>
    nnoremap <C-Down> <C-w>-
    nnoremap <C-Up> <C-w>+
    nnoremap <Left> <C-w><
    nnoremap <Right> <C-w>>
    nnoremap <Down> <C-w>-
    nnoremap <Up> <C-w>+
    cnoremap <C-h> <Left>
    cnoremap <C-l> <Right>
    nnoremap q: <nop>


    if has('nvim')
        tnoremap <Esc> <C-\><C-N> 
        tnoremap <C-h> <C-W>h
        tnoremap <C-l> <C-W>l
    endif

    "compile setting
    if filereadable('/proc/cpuinfo')
        let &makeprg = 'make -j'.(system('grep -c ^processor /proc/cpuinfo')+1)
    endif

    "function! Builder()
    "endfunction
    command! -bang -nargs=? QFix call QFixToggle(<bang>0)
    function! QFixToggle(forced)
        if exists("g:qfix_win") && a:forced == 0
            cclose
            unlet g:qfix_win
        else
            copen 10
            let g:qfix_win = bufnr("$")
        endif
    endfunction

    nmap <silent> \` :QFix<CR> 

    if has("win32")
    else 
        "nnoremap <C-S-B> :wa<CR>:silent make\|redraw!\|cc<CR>
        nnoremap <C-S-B> :wa<CR>:Make<CR>
    endif

    autocmd BufNewFile,BufRead * set formatoptions=tcq
    if bufwinnr(1)
        map <kPlus> <C-W>+
        map <kMinus> <C-W>-
        map <kDivide> <c-w><
        map <kMultiply> <c-w>>
    endif


    " swp 파일들 한쪽으로 모으기.
    set backupdir=~/vimrc/backup_files//
    set directory=~/vimrc/swap_files//
    set undodir=~/vimrc/undo_files//
    set scrolloff=5



    if has("gui_running")
        noremap <M-Space> :simalt ~<CR>
        inoremap <M-Space> <C-O>:simalt ~<CR>
        cnoremap <M-Space> <C-C>:simalt ~<CR>
        colorscheme atom
    else 
        let g:airline_theme='one'
        set background=dark
        colorscheme molokai
        "exec "normal! silent :RainbowToggleOff"
    endif


    if has("win32")
        runtime delmenu.vim
        runtime menu.vim
    else

    endif





    "set tags=~/tags
    "set tags+=/usr/include/tags

    "" reference to recursive parent path
    "let l:parent=1
    "let l:local_tags = "tags"
    "while l:parent <= 8
        "exe ":set tags+=".local_tags
        "let l:local_tags = "../". l:local_tags
        "let l:parent = l:parent+1

    "endwhile

    function! LoadCscope()
        let db = findfile("cscope.out", ".;")
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs kill -1"
        if (!empty(db))
            let path = strpart(db, 0, match(db, "/cscope.out$"))
            exe "cs add " . db . " " . path
        elseif $CSCOPE_DB != "" 
            cs add $CSCOPE_DB
        endif

        silent cs add ~/hisdk/mpp/include/cscope.out
        silent cs add ~/hisdk/mpp/sample/cscope.out
        set cscopeverbose
    endfunction
    au BufEnter /* call LoadCscope()

    set csprg=/usr/bin/cscope 
    set csto=0 
    set cst 
    set nocsverb 
    set csverb

    "nnoremap <F12> :!rm cscope.out cscope.files<CR>:!find `pwd` -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>:!cscope -b -C -i  cscope.files -f cscope.out<CR>:cs kill -1<CR>:cs add cscope.out<CR>
    nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>    
    nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>    
    nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>    
    nnoremap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>    
    nnoremap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>    
    nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    
    nnoremap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>





    augroup filetype_vim
        autocmd!
        "autocmd BufWritePost *.vimrc,*.vim source $MYVIMRC
    augroup END 

    "augroup myindent
    "au!
    "au BufEnter *.c normal gg=G
    "augroup END
endfunction

call KSOO()



function! g:BsdToKnR()
    while(search("^\\s*{") > 0) 
        execute "normal! /^\\s*{/\<CR>kJ" 
    endwhile 
endfunction
