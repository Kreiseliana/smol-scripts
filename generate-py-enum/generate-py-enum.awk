BEGIN {
    name = name ? name : "Msg"
    pattern = "^\\s*enum\\s+" name
    num = 0 # enum num
}

# begin of enum
$0 ~ pattern { matched = 1 }

# in enum scope and not start with '/' (not comment)
matched && $1 !~ /^\// {
    # header
    if ($1 == "enum") {
        print "from enum import Enum"
        print "class " name "(Enum):"
        indent = indent "    " # new indent level
    } else {
        # end of enum, contains '}'
        # may be 'LAST = 100 };', so dont skip here
        if ($0 ~ /}/) matched = 0
        # may be '};', so skip here
        if ($1 !~ /^}/) {
            # may be '{\n' or '{ first' or '{first'
            # WON'T handle '{ //' or '{ /*'
            if ($1 ~ /^{/) {
                if ($1 != "{") # '{first'
                    field = substr($1, 2)
                else if ($2 != "") # '{ first'
                    field = $2
                else next # '{\n'
            } else field = $1 # enum .. {\n
            # handle 'field = 100' case
            if ($2 == "=") {
                num = $3
                gsub(/,/, "", num) # remove trail comma
            } else gsub(/,/, "", field)
            print indent field " = " num++
        }
    }
}

