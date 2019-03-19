#! /usr/bin/perl

# This script can be used to reprocess the RI.md file into a properly numbered
# and referenced document.

use diagnostics;
use warnings;
use strict;
use Text::Roman 'int2roman';
use IO::File;
use File::Copy 'move';

my ($chapter, $section, $article) = (0, 0, 0);
my %ref;

my $filename = $ARGV[0];
my $filehandle = new IO::File $filename, 'r';

my $out = new IO::File 'temp.out', 'w';

die "Could not open $filename: $!" if ! $filehandle;

while ($_ = $filehandle->getline) {
	if (/^#### Article [0-9]+$/) {
		$article++;
	}
	elsif (/^#### Article [0-9]+[.]\s+(.*)$/) {
		$article++;
		die "There's already a '$1' article\n" if exists $ref{$1};
		$ref{$1} = $article;
	}
}

$filehandle->seek(0, 0);

($chapter, $section, $article) = (0, 0, 0);

while ($_ = $filehandle->getline) {
	if (s/^## [IVX]+[.]/$chapter++; "## " . int2roman($chapter) . "."/e) {
		$section = 0;
		$out->print($_);
	}
	elsif (s/^### [0-9]+[.]/$section++; "### $section."/e) {
		$out->print($_);
	}
	elsif (s/^#### Article [0-9]+/$article++; "#### Article $article"/e) {
		$out->print($_);
	}
	elsif (/^#/) {
		$out->print($_);
	}
	else {
		s/Article [0-9]+ "([^"]+)"/Article $ref{$1} "$1"/g;
		$out->print($_);
	}
}

$out->close;

move $filename, "${filename}.old";
move 'temp.out', $filename;

__END__
