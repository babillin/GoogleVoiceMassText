#!/usr/bin/perl

use warnings;
use strict;

open (FILE, "mail");
my $file = do { local $/;  <FILE> };
close FILE;

($file =~ m/(#tri)(.+|\n+)+/);
my $result = $&;
$result =~ s/(#tri)(:[0-9]+)*(\s*)//;
print $result;