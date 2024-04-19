function rename-fn
    functions -c $argv[1] $argv[2]
    functions -e $argv[1]
end

source $ashr_smol_home/git-grep-diff/grd.fish
# rename-fn grd grd_newname
source $ashr_smol_home/git-line-sum/gls.fish
# rename-fn gls gls_newname

