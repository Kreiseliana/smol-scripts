function grd
    argparse 'n=' 'p=' 'r=' -- $argv
    or return 1
    set -f path $ashr_smol_home/git-grep-diff

    if not set -q _flag_n
        set -f _flag_n 3
    end
    if not set -q _flag_r
        set -f _flag_r HEAD^..HEAD
    end
    if set -q _flag_p
        set -f pat p=$_flag_p
    end

    git diff $_flag_r -U$_flag_n | awk -f $path/grep-diff.awk -v n=$_flag_n $pat
end

