#!/bin/bash

#########
# infile: File of FASTA sequences to be split as evenly as possible
# nfiles: Number of files that should result

# WARNING: running this script will overwrite the directory named outdir
#          to contain only a fresh copy of the output files; do not provide the name
#          of an existing directory that you do not want overwritten in this way.

infile="$1"

outdir="$2"
nfiles=10


scriptdir=scripts

if [ -d $outdir ]
then
    rm -r $outdir
fi
mkdir $outdir
orig=$infile.orig
mv $infile $orig

$scriptdir/fasta_multiline_to_fasta_singleseqs.pl $orig $infile
$scriptdir/split_fasta_singleseqs.pl $infile $outdir $nfiles
