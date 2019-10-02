#!/usr/bin/perl

use POSIX;

$infile = shift;
$outdir = shift;
$nfiles = shift;

@infile_parts = split(/\//, $infile);
$fname = $infile_parts[$#infile_parts];

####
# Prepare array of line groups:
# for FASTA "single sequences", lines come in groups of 2 (header, sequence)

@lines = ();
open(IN, $infile) or die "failed to open input file $infile";
$linesInGroup = 2;
while ($line = <IN>) {
    $thisline = $line;
    for ($i = 1; $i < $linesInGroup; $i++) {
	$thisline .= <IN>;
    }
    push(@lines, $thisline);
}
close(IN);

####
# Distribute line groups (FASTA sequences) evenly among nfiles
# 

$nlines = $#lines + 1;
$lineChunks = floor($nlines/$nfiles);
$linesExtra = $nlines - ($nfiles*$lineChunks);

$linecnt = 0;
$filenum = 0;
for ($i = 0; $i <= $#lines; $i++) {
    
    if (($linecnt % $lineChunks) == 0) {
	$filenum++;
	if ($filenum > $nfiles) {
	    $filenum = 1;
	    for ($j = $i; $j <= $#lines; $j++) {
		open(OUT, ">>$outdir/$fname.$filenum");
		print OUT $lines[$j];
		close(OUT);
		$filenum++;
	    }
	    last;
	}
	open(OUT, ">$outdir/$fname.$filenum");
    }

    print OUT $lines[$i];

    if ($linecnt % $lineChunks == ($lineChunks - 1)) {
	close(OUT);
    }    

    $linecnt++;
    if (($linecnt % $lineChunks) == 0) {
	$linecnt = 0;
    }
}
close(OUT, ">$outdir/$fname.$filenum");
