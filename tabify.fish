function tabify
    argparse 'n=' -- $argv
    or return 1
    if not set -q _flag_n
        set -f _flag_n 4
    end
    sed -i "s/ \{$_flag_n\}/\t/g" $argv
end
function untabify
    argparse 'n=' -- $argv
    or return 1
    if not set -q _flag_n
        set -f _flag_n 4
    end
    sed -i "s/\t/$(string repeat -n $_flag_n ' ')/g" $argv
end

function tabify-all
    # comsume the par option, use default instead
    argparse 'n=' 'par=' -- $argv
    or return 1
    if not set -q _flag_n
        set -f _flag_n 4
    end
    ashr-recur-text $argv -- tabify -n $_flag_n {}
end
function untabify-all
    # comsume the par option, use default instead
    argparse 'n=' 'par=' -- $argv
    or return 1
    if not set -q _flag_n
        set -f _flag_n 4
    end
    ashr-recur-text $argv -- untabify -n $_flag_n {}
end

function reindent
    argparse 'prev=' 'curr=' -- $argv
    or return 1
    if not set -q _flag_prev
        echo 'reindent error: need previous indent (-prev)'
        return 1
    end
    if not set -q _flag_curr
        echo 'reindent error: need current indent (-curr)'
        return 1
    end
    tabify -n $_flag_prev $argv && untabify -n $_flag_curr $argv
end
function reindent-all
    # comsume the par option, use default instead
    argparse 'prev=' 'curr=' 'par=' -- $argv
    or return 1
    if not set -q _flag_prev
        echo 'reindent error: need previous indent (-prev)'
        return 1
    end
    if not set -q _flag_curr
        echo 'reindent error: need current indent (-curr)'
        return 1
    end
    ashr-recur-text $argv -- reindent -prev $_flag_prev -curr $_flag_curr {}
end

