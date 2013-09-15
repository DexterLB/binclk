#!/bin/zsh
function readkey {
    oldstty=$(stty -g)
    stty -icanon -echo min 1 time 0
    dd bs=1 count=1 2>/dev/null
    local mystat=$!
    stty "${oldstty}"
    return ${mystat}
}

while { readkey }; do; done
