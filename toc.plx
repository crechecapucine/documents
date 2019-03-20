#! /usr/bin/perl -n

s/^##+ //g;

print if /^[2-9]/;

print "\n$_" if /^1/;

chomp and s/[.]/ -/ and print "\n**$_**\n" unless /^[1-9]/;
