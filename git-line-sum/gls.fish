function gls
    argparse 'a=' 'r=' -- $argv
    or return 1
    set -f path $ashr_smol_home/git-line-sum

    if set -q _flag_a
        set -f auth --author=$_flag_a
    end
    if set -q _flag_r
	git show --stat $auth $_flag_r | awk -f $path/line-sum.awk
    else
	git log --shortstat $auth | awk -f $path/line-sum.awk
    end
end

