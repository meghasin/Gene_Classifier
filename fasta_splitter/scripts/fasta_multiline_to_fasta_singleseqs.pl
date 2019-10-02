#!/usr/bin/perl

# Converts a traditional multiline-sequence fasta file to a fasta file where all sequence data is on a single line

$infile = shift;
$outfile = shift;

open(IN, $infile);
open(OUT, ">$outfile");

# Read until first header
$first_header = "";
while (<IN>) {
    $line = $_;
    chomp($line);
    if ($line =~ /^>/) {
        $first_header = $line;
        last;
    }
}
print OUT "$first_header\n";

$seq = "";
while (<IN>) {
    $line = $_;
    chomp($line);
    if ($line =~ /^>/) {
        $header = $line;
        print OUT "$seq\n";
        print OUT "$header\n";
        $seq = "";
    }
    else {
        $seq .= $line;
    }
}
print OUT "$seq\n";

close(IN);
close(OUT);
