# Set up "al" function which does "arc land" but in a cleaner/better way
al() {
   arc land --merge --hold "$@" && git checkout master && git merge --ff-only HEAD@{1}
}

