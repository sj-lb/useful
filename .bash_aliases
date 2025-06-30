function kall(){
    local target
    for arg in ${@:-metadata|sqreamd|Clientcmd|calcite_sqream|stack|picker|py_modules}; do
        target=$target'|'$arg
    done
    ps aux|grep PID|grep -v grep
    ps aux|grep -vE 'grep|vscode'|grep -E "${target#|}"|tee /dev/tty|awk '{print $2}'|xargs kill -9
}
export -f kall

function psj(){
    local target
    for arg in ${@:-metadata|sqreamd|Clientcmd|calcite_sqream|stack|picker|py_modules}; do
        target=$target'|'$arg
    done
    ps aux|grep -v grep|grep -E "PID$target"
}
export -f psj