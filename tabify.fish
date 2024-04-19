
function tabify
    # comsume the par option, use default instead
    argparse 'n=' 'par=' -- $argv
    or return 1
    if not set -q _flag_n
        set -f _flag_n 4
    end
    ashr-recur-text $argv -- sed -i "'s/ \{$_flag_n\}/\t/g'" {}
end
function untabify
    # comsume the par option, use default instead
    argparse 'n=' 'par=' -- $argv
    or return 1
    if not set -q _flag_n
        set -f _flag_n 4
    end
    set -f indent (string repeat -n $_flag_n ' ')
    ashr-recur-text $argv -- sed -i "'s/\t/$indent/g'" {}
end

