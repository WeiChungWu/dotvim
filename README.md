vimrc
============
Author: WeiChung Wu

Fork me on GITHUB  https://github.com/WeiChungWu/dotvim.

MANUALLY INSTALL
----------------

Check out from github

     git clone git://github.com/WeiChungWu/dotvim.git ~/.vim
     cd ~/.vim
     git submodule update --init

Setup vimrc and gvimrc

     cd
     ln -s ~/.vim/vimrc .vimrc
     ln -s ~/.vim/gvimrc .gvimrc


INSTALL & UPGRADE PLUGIN BUNDLES
--------------------------------

All plugins were checked out as git submodules, 
which can be upgraded with `git pull`. For example, to upgrade EasyGrep

     cd ~/.vim/bundle/EasyGrep
     git pull

Upgrading all bundled plugins

     git submodule foreach git pull origin master

To install a new plugin as a git submoudle, type the following commands.

     cd ~/.vim
     git submodule add [GIT-REPOSITORY-URL] bundle/[PLUGIN-NAME]


PLUGINS
-------

* [Pathogen](http://www.vim.org/scripts/script.php?script_id=2332): Pathogen let us install a plugin as a bundle in ~/.vim/bundle seprately.

* [EasyGrep](https://github.com/vim-scripts/EasyGrep.git): Handy grep in files.

* [matchit](http://www.vim.org/scripts/script.php?script_id=39): extended % matching for HTML, LaTeX, and many other languages. 

* [SuperTab](http://www.vim.org/scripts/script.php?script_id=1643): Do all your insert-mode completion with Tab.

* [snipMate](http://www.vim.org/scripts/script.php?script_id=2540): TextMate-style snippets for Vim

* [EasyMotion](https://github.com/Lokaltog/vim-easymotion): An easy way to jump to a word.


Language specific supports
--------------------------

* SystemVerilog: indent, syntax highlight, taglist, matchit, snipMate

