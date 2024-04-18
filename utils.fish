function rename-fn
    functions -c $argv[1] $argv[2]
    functions -e $argv[1]
end

set -g ashr_smol_home $(pwd)

source git-grep-diff/grd.fish
# rename-fn grd grd_newname
source git-line-sum/gls.fish
# rename-fn gls gls_newname

