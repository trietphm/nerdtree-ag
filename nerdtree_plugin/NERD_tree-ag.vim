" ============================================================================
" File:        NERD_tree-ag.vim
" Description: Adds searching capabilities to NERD_Tree with the silver searcher
" Original Author:  Mohammad Satrio <wolfaeon at gmail dot com>
" Maintainer:  vtm9
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


call NERDTreeAddMenuItem({
    \ 'text': '(s)earch files with Rg',
    \ 'shortcut': 's',
    \ 'callback': 'NERDTreeRg' })

call NERDTreeAddMenuItem({
    \ 'text': '(e) search files with Ack',
    \ 'shortcut': 'e',
    \ 'callback': 'NERDTreeAck' })

function! NERDTreeRg()
    " get the current dir from NERDTree
    let cd = g:NERDTreeDirNode.GetSelected().path.str()

    " get the pattern
    let pattern = input("Enter the pattern: ")
    if pattern == ''
        echo 'Maybe another time...'
        return
    endif
    exec "NERDRg ".pattern." ".cd
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

command! -nargs=* NERDRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case --hidden --follow '.<q-args>, 1,
  \   fzf#vim#with_preview('up:60%'), 1)

