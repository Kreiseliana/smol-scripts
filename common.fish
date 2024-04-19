function rename-fn
    functions -c $argv[1] $argv[2]
    functions -e $argv[1]
end

function ashr-apply
    argparse 'par=' 'arg=' -- $argv
    or return 1
    if not set -q _flag_par
        set -f _flag_par '{}'
    end
    if not set -q _flag_arg
        echo 'apply error: no argument supplied'
        return 1
    end

    for i in (seq (count $argv))
        if test "$argv[$i]" = $_flag_par
            set -f argv[$i] $_flag_arg
        end
    end
    eval $argv
end

function ashr-recur-text
    argparse 'path=' 'par=' -- $argv
    or return 1
    if not set -q _flag_p
        set -f _flag_p .
    end
    if not set -q _flag_par
        set -f _flag_par '{}'
    end

    for f in (find $_flag_p -type f -not -path '*/\.*')
        if file $f | grep -q 'ASCII text'
            ashr-apply --par $_flag_par --arg $f -- $argv
        end
    end
end

