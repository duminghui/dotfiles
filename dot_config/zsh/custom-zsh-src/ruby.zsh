if type brew &>/dev/null; then
    export PATH=$(brew --prefix)/opt/ruby/bin:$PATH
fi
export GEM_HOME=$HOME/.local/share/gem

if test -d "$GEM_HOME/bin"; then
    export PATH=$GEM_HOME/bin:$PATH
fi
