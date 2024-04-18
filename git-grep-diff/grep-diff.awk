# n: half of the context window
# p: the pattern regex
BEGIN {
    n = n ? n : 3
    p = p ? p : "TODO|assert\\(0\\)"
    # internal variables
    red = "\033[31m"
    green = "\033[32m"
    yellow = "\033[33m"
    end = "\033[0m"
    # for 'if (NR == matched + n)'
    matched = -n - 1
}

# match '+++ b/path'
/^\+\+\+/ {
    path = $0
    sub(/.*b\//, "", path)
}

# @@ -x,y +z,w @@ str
# x: old start line
# y: old line length
# z: new start line
# w: new line length
# str: first line content (optional)
# str would never be an actual commited line,
# which should start with a '+',
# so we can neglect this line safely
/^@@.*@@/ {
    split($3, cnt, ",")
    new_start_line = substr(cnt[1], 2)
    delta = NR + 1 - new_start_line
}

# match line starts with '+' that contains pattern p
# print this matched line until NR = matched + n
/^(\+.*)/ && $0 ~ p { matched = NR }
NR == matched + n {
    lineno = NR - delta - 2 * n
    print green path end
    for (i = matched - n; i <= NR; ++i) {
        line = substr(hist[i], 2)
        if (i == matched)
            gsub(p, red "&" end, line)
        print yellow lineno++ end " " line
    }
}
{
    hist[NR] = $0
    delete hist[NR - 2 * n - 1]
}

