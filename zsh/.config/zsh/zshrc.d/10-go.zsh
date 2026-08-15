export GOTELEMETRY=off

if [[ -d "${LOCAL_OPT}/go" ]]; then
    export GOROOT="${LOCAL_OPT}/go"
fi

if [[ -n "${XDG_DATA_HOME}" ]]; then
    export GOPATH="${XDG_DATA_HOME}/go"
fi

if [[ -n "${LOCAL_BIN}" ]]; then
    export GOBIN="${LOCAL_BIN}"
fi

if [[ -n "${XDG_CACHE_HOME}" ]]; then
    export GOCACHE="${XDG_CACHE_HOME}/go"
fi

