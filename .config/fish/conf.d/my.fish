#!/usr/bin/fish

# starship
starship init fish | source
switch $TERMINFO
    case "*emacs*"
        starship config character.symbol ""
    case '*'
        starship config character.symbol "➜"
end

set EDITOR vim
set PROJECTS $HOME/Projects
set DOTFILES $PROJECTS/dotfiles
set TRAINING $PROJECTS/efha.training

# Rust PATH from asdf
set RUST $HOME/.asdf/installs/rust/1.43.1/bin
set PATH $RUST $PATH

# php
set -x PATH $HOME/.phpenv/bin $PATH
set -x PATH $HOME/.phpenv/shims $PATH
phpenv rehash >/dev/null ^&1

set COMPOSER_VENDOR $HOME/.config/composer/vendor/bin
set PATH $COMPOSER_VENDOR $PATH

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# FZF
set PATH ~/.fzf/bin $PATH
set -g FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
set -g FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# asdf
source ~/.asdf/asdf.fish

# Aliases
alias iex 'iex --erl "-kernel shell_history enabled"'
alias emacs '/usr/bin/env XLIB_SKIP_ARGB_VISUALS=1 emacs'

# Abbr

## app shortcut
abbr -a -g l ll
abbr -a -g do docker
abbr -a -g doco docker-compose
abbr -a -g dodev docker-compose -f docker-compose-dev.yml
abbr -a -g pipe pipenv
abbr -a -g poe poetry
abbr -a -g ma ./manage.py
abbr -a -g yt youtube-dl

## change directory
abbr -a -g pro cd $PROJECTS
abbr -a -g dot cd $DOTFILES
abbr -a -g tra cd $TRAINING
abbr -a -g app cd $HOME/Applications
abbr -a -g ghp cd $HOME/Projects/Hugo/Sites/ghpages-hugo

## php
abbr -a -g phpunit ./vendor/bin/phpunit

## sqlite
abbr -a -g sqlite rlwrap -a -c -i sqlite3

## exa
#abbr -a -g ls exa
#abbr -a -g ll exa -l
#abbr -a -g la exa -la
#abbr -a -g lT exa -lT

## emacs
abbr -a -g doom ~/.emacs.d/bin/doom

# Functions
function xbase
    set name base
    tmux has-session -t $name 2>/dev/null
    if test $status -gt 0
        tmux new-session -d -s $name
        tmux attach-session -d
    else
        tmux attach-session -d -t $name
    end
end
function xbasex
    tmux kill-session -t base
end

function xtra
    set name extra
    tmux has-session -t $name 2>/dev/null
    if test $status -gt 0
        tmux new-session -d -s $name
        tmux attach-session -d
    else
        tmux attach-session -d -t $name
    end
end
function xtrax
    tmux kill-session -t extra
end

function fish_right_prompt
    # intentionally left blank
end
