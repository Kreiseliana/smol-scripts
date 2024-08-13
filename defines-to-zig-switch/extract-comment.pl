#!/usr/bin/perl

use strict;
use warnings;

sub trim { return $_[0] =~ s/^\s+|\s+$//rg; }
while (<>) {
  chomp;
  # /#define\s+(\w+).+(?=\/\*)\/\*\s+(.+)(?=\s\*\/)\s\*\// && printf "c.%s => \"%s\",\n", $1, trim($2);
  /#define\s+(\w+).+(?=\/\*)\/\*\s+(.+)(?=\s\*\/)\s\*\// && printf "%s:%s\n", $1, trim($2)
}

