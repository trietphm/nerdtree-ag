# NERDtree + Ag.vim

This plugin add capability to search in folders via NERDtree. The search use ag.vim from the master branch (<https://github.com/epmatsw/ag.vim>).
This is almost a copypaste from [Mohammad Satrio](https://github.com/tyok)'s [nerdtree-ack](https://github.com/tyok/nerdtree-ack). But use [the silver searcher](https://github.com/ggreer/the_silver_searcher) instead of Ack.

## How to Install

1. Install ag.vim first from <https://github.com/epmatsw/ag.vim>. 
1. Copy the plugin file to your `.vim/plugin` directory, or install via pathogen/vundle/VAM

## How to Use

1. Open NERDtree
1. Point to a directory
1. Press `ms`
1. Enter search term (e.g. `control\ panel -i`)
1. Profit!

## Features

1. Doesn't change current open buffers! This feature is what necessitate the use of latest ag.vim
1. Uses ag.vim syntax:
    1. Use `\ ` to write a space (e.g. `control\ panel`)
    1. Or enclose the term in quotes (e.g. `"control panel"`)
    1. The default behavior is case sensitive. Use `-i` params for case insensitive (e.g. `"control panel" -i`)
1. Uses ag.vim buffer behavior
