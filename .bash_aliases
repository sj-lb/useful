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

export GIT_SQ_BASE='/home/johnny/git/sqream'
cdsq(){
    cd $GIT_SQ_BASE/$1
}
export -f cdsq
_cdsq_cmplt() {
    COMPREPLY=($( (cdsq && compgen -d -- ${COMP_WORDS[COMP_CWORD]}) ))
}
complete -F _cdsq_cmplt cdsq
