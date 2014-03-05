#!/usr/bin/perl

use warnings;
use strict;

open (FILE, "mail");
my $file = do { local $/; <FILE> };
close FILE;

($file =~ m/(#tri):([0-9]+)+/);
my $result = '';
$result = $&;
if(defined($result)){
	$result =~ s/(#tri:)(\s*)//;
	print $result;
}