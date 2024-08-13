#!/bin/sh

cat /usr/include/elf.h | grep $1 | perl extract-comment.pl | awk -F: '{print "c."$1" => \""$2"\","} END { print "else => @panic(\"Unknown type!\")," }'
