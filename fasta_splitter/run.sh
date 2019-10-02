#!/bin/bash

#########
# shell script to split fasta files into 10 equal smaller portions
# Input: Armadillo 5 prime & 3 prime sequences from the "Data" folder
# Output: Outputs splitted files into the 5prime_splitted and 3prime_splitted subdirectory here


#If directory exists (from an older run), then remove it 
if [ -d 5prime_splitted ]
then 
    rm -r 5prime_splitted
fi

#If directory exists (from an older run), then remove it
if [ -d 3prime_splitted ]
then
    rm -r 3prime_splitted
fi



./split_fasta.sh ../Data/Armadillo_5prime.txt 5prime_splitted
./split_fasta.sh ../Data/Armadillo_3prime.txt 3prime_splitted
