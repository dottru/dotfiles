  
My VIM mods
===========

After installing this repo you'll find that the stock vim has changed significantly. This document gives you a quick run through the most notable changes.

## vimrc

I use pathogen for bundle management. It's all handled automatically for you so it shouldn't be too necessary to read much into it. If you need to add new bundles it's as easy as 

```
cd ~/dotfiles
git submodule add https://github.com/linus/vimtest.git vim/bundle/vimtest
```

Pathogen and git will handle the rest.

## vim plugins

The following are notable plugins that I use on a constant basis. If you need any more info I've included links to documentation on every bundle.

 * [autoclose](https://github.com/Townk/vim-autoclose) - Auto-closes tags for you. ex: if you type an '(', ``autoclose`` will automatically insert a ')' and put the cursor between them
 * [autotag](https://github.com/vim-scripts/AutoTag) - Updates entries in a ```ctags``` files automatically when saving. (```ctags``` are used by other plugins.)
 * [bclose](https://github.com/rbgrouleff/bclose.vim) - The BClose Vim plugin for deleting a buffer without closing the window.
 * [ctrlp](https://github.com/kien/ctrlp.vim) - Fuzzy finder for vim. Quickly jump to any buffer, file, tag, mru, etc.
 * [easymotion](https://github.com/Lokaltog/vim-easymotion) - Enables you to quickly jump to any place in the file.
 * [fugitive](https://github.com/tpope/vim-fugitive) - Git repository control.
 * [jshint](https://github.com/sleistner/vim-jshint) - Does parsing & validation on javascript for you.
 * [neocomplcache](https://github.com/Shougo/neocomplcache.vim) - The best auto-completion system for vim, hands down.
 * [nerdtree](https://github.com/scrooloose/nerdtree) - A powerful filesystem / buffer explorer.
 * [sensible](https://github.com/tpope/vim-sensible) - A set of various features that make living with a stock vim much more tolerable. A great starting point for any custom vim config.
 * [snipmate](https://github.com/garbas/vim-snipmate) - Textmate-like snippets support.
 * [solarized](https://github.com/altercation/vim-colors-solarized) - The colorscheme of choice by those in the know.
 * [sudo](https://github.com/vim-scripts/sudo.vim) - Ever tried saving a file without proper privs? sudo.vim is for you.
 * [supertab](https://github.com/ervandew/supertab) - Superpowered insert-mode tab complete.
 * [syntastic](https://github.com/scrooloose/syntastic) - A syntax checking plugin that runs files through external syntax checkers and displays any resulting errors to the user.
 * [tagbar](https://github.com/majutsushi/tagbar) - Plugin for browsing the tags of source code files.
 * [tasklist](https://github.com/vim-scripts/TaskList.vim) - Indexes all instances of 'FIXME' or 'TODO' for posterity.
 * [unimpaired](https://github.com/tpope/vim-unimpaired) - Oodles of easy-to-use navigatonal mappings.
 * [zoomwin](https://github.com/vim-scripts/ZoomWin) - Briefly 'maximise' your current window in vim.

## configured shortcuts

Here's a quick-start crash course in what's what.

 -  <kbd>Leader</kbd> =  <kbd>\\</kbd>
 -  ```bclose``` =  <kbd>Leader</kbd>  +  <kbd>x</kbd>
 -  jump to buffer =  <kbd>Leader</kbd> +  <kbd>0</kbd> ... <kbd>Leader</kbd> + <kbd>9</kbd>
 -  list buffers =  <kbd>Leader</kbd> +  <kbd>b</kbd>
 -  ```nerdtree``` =  <kbd>Leader</kbd> +  <kbd>e</kbd>
 -  source cur. file =  <kbd>Leader</kbd> +  <kbd>s</kbd>
 -  exec in bash =  <kbd>Leader</kbd> +  <kbd>rb</kbd>
 -  exec in node =  <kbd>Leader</kbd> +  <kbd>ii</kbd>
 -  Refresh ctags =  <kbd>Leader</kbd> +  <kbd>rt</kbd>
 -  open .vimrc =  <kbd>Leader</kbd> +  <kbd>v</kbd>
 -  Toggle ```paste``` mode =  <kbd>Leader</kbd> +  <kbd>p</kbd>
 -  ```ctrlP``` =  <kbd>Control</kbd> +  <kbd>f</kbd> OR <kbd>Leader</kbd> +  <kbd>f</kbd>
 -  ```:w``` =  <kbd>Control</kbd> +  <kbd>s</kbd> OR  <kbd>Leader</kbd> +  <kbd>w</kbd> 
 -  ```:qa!``` =  <kbd>Leader</kbd> +  <kbd>qa</kbd>
 -  ```SUDO :w!``` =  <kbd>Leader</kbd> +  <kbd>ss</kbd>
 -  ```fufFile``` =  <kbd>Leader</kbd> +  <kbd>ff</kbd>
 -  ```fufBuffer``` =  <kbd>Leader</kbd> +  <kbd>fb</kbd>
 -  ```Get help``` =  <kbd>Leader</kbd> +  <kbd>h</kbd>
 -  ```Gstatus``` =  <kbd>Leader</kbd> +  <kbd>gg</kbd>
 -  Window navigation =  <kbd>Control</kbd> +  <kbd>j</kbd> == <kbd>Control</kbd>-<kbd>w</kbd> + <kbd>j</kbd>
 -  ```task list``` =  <kbd>Leader</kbd> +  <kbd>l</kbd>

<!--

 -  `````` =  <kbd>Leader</kbd> +  <kbd></kbd>
 -->
