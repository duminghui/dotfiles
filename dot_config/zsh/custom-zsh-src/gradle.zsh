if type brew &>/dev/null; then
    export GRADLE_HOME="$(brew --prefix)/opt/gradle"
    # export PATH=$GRADLE_HOME/bin:$PATH
fi
