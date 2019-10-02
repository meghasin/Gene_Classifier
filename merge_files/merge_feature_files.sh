#!/bin/bash

####
# Takes an input directory name and an output file name as arguments
# Concatentaates the input files, but with only one header line at the top of the file.
# Assumes all input files have a one line header at the top of the file.
#

indir1=../sun_grid_engine_arrayjobs_example/Armadillo_3prime_Features
outfile1=Armadillo_3prime_Features.txt

indir2=../sun_grid_engine_arrayjobs_example/Armadillo_5prime_Features
outfile2=Armadillo_5prime_Features.txt

./cat_dir_with_header.pl $indir1 $outfile1
./cat_dir_with_header.pl $indir2 $outfile2
