#!/usr/bin/perl

####
# Takes an input directory name and an output file name as arguments
# Concatentaates the input files, but with only one header line at the top of the file.
# Assumes all input files have a one line header at the top of the file.

$indir = shift(@ARGV);
$outfile = shift(@ARGV);

open(OUT, ">$outfile");

opendir DIR, $indir or die "cannot open dir $indir: $!";
my @files= readdir DIR;
closedir DIR;

$first_header = 1;
foreach $file (@files) {
    next if $file =~ /^\./;
    $infile = "$indir/$file";
    open(IN, $infile) || die "Can't open $infile";
    $header = <IN>;
    if ($first_header) {
	print OUT $header;
	$first_header = 0;
    }
    while ($line = <IN>) {
	print OUT $line;
    }
    close(IN);
}
close(OUT);
