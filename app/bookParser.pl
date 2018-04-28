#!/usr/bin/perl -w
use Text::Ngrams;
use strict;
use utf8;
use warnings;

my $ng = Text::Ngrams->new(
    type => 'word',
    windowsize => 2
);
# Overrule the default token pattern, to include '
$ng->{tokenrex} = qr/([a-zA-Z\']+|(\d+(\.\d+)?|\d*\.\d+)([eE][-+]?\d+)?)/i;

# Convert to lowercase.
open(my $book, '<', 'aliceBook.txt') or die "Could not read file";
while (my $line = <$book>) {
    $ng->process_text(lc($line));
}
close $book;

my @ngramsarray = $ng->get_ngrams(
    number=>2,
    orderby=>'frequency'
);

# Print the result to a file.
open(my $fh, '>', 'book.result.txt') or die "Could not write to result file";
print $fh "Count\tWords\n";
while (my $words = shift @ngramsarray) {
    my $number = shift @ngramsarray;
    print $fh "$number\t\t$words\n";
}
close $fh;