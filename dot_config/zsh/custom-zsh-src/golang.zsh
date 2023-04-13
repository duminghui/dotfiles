if type brew &>/dev/null; then
    export GOROOT="$(brew --prefix)/opt/go/libexec"
fi
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on

