" ============================================================================
" File:        NERD_tree-ag.vim
" Description: Adds searching capabilities to NERD_Tree with the silver searcher
" Original Author:  Mohammad Satrio <wolfaeon at gmail dot com>
" Maintainer:  trietphm
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================


" don't load multiple times
if exists("g:loaded_nerdtree_ag")
    finish
endif

let g:loaded_nerdtree_ag = 1


call NERDTreeAddMenuSeparator()
call NERDTreeAddMenuItem({
    \ 'text': 'Search (f)iles with Rg',
    \ 'shortcut': 'f',
    \ 'callback': 'NERDTreeRg' })

call NERDTreeAddMenuItem({
    \ 'text': '(s)earch files with Ack',
    \ 'shortcut': 's',
    \ 'callback': 'NERDTreeAck' })

function! NERDTreeRg()
    let g:NERDTreeAgDir = g:NERDTreeDirNode.GetSelected().path.str()
    let b:cw = expand('%')
    if b:cw =~ 'NERD_tree'
	    exec "wincmd w"
    endif
	
    exec "NERDRg"
endfunction

function! NERDTreeAck()
    " get the current dir from NERDTree
    let cd = g:NERDTreeDirNode.GetSelected().path.str()

    " get the pattern
    let pattern = input("Enter the pattern: ")
    if pattern == ''
        echo 'Maybe another time...'
        return
    endif
    exec "Ack -i ".pattern." ".cd
endfunction

command! -bang -nargs=* NERDRg
	\ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --fixed-strings ".shellescape(<q-args>), 1,
	\ fzf#vim#with_preview({'dir': g:NERDTreeDirNode.GetSelected().path.str(), 'options': ['--delimiter=:', '--nth=2..', '--info=inline']}),
	\ <bang>0)

