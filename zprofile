
source $HOME/.profile

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# nvm setup
if [ -d "$HOME/.nvm" ] ; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -d "$HOME/.aliases" ] ; then
source $HOME/.aliases
fi
if [ -d "$HOME/.variables" ] ; then
source $HOME/.variables
fi

# fzf
if [ -d "/usr/share/doc/fzf/examples" ] ; then
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
fi
# autojump
if [ -d "/usr/share/autojump/" ] ; then
source /usr/share/autojump/autojump.sh
fi

# source autocompletions
if [ -d "$HOME/.config/completions/zsh" ] ; then
  for f in $HOME/.config/completions/zsh/*; do source $f; done
fi

# poetry setup
if [ -d "$HOME/.poetry" ] ; then 
    export PATH="$HOME/.poetry/bin:$PATH"
fi
# dotnet
if [ -d "$HOME/.dotnet" ] ; then
    PATH="$HOME/.dotnet:$PATH"
fi
