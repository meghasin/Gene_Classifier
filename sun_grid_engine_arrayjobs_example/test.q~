#!/bin/bash
#$ -S /bin/bash
#$ -V
#$ -N TEST_MEGHA
#$ -cwd
#$ -o test_megha.log
#$ -j y
#$ -t 1:10


#If directory exists (from an older run), then remove it                                                                                                                                                           
if [ -d Armadillo_3prime_Features ]
then
    rm -rf Armadillo_3prime_Features
fi

#If directory exists (from an older run), then remove it 
if [ -d Armadillo_5prime_Features ]
then
    rm -rf Armadillo_5prime_Features
fi


mkdir Armadillo_3prime_Features
mkdir Armadillo_5prime_Features

inputfile1=../fasta_splitter/3prime_splitted/Armadillo_3prime.txt.$SGE_TASK_ID
inputfile2=../fasta_splitter/5prime_splitted/Armadillo_5prime.txt.$SGE_TASK_ID

python3 ../feature_generator/feature.py $inputfile1 Armadillo_3prime_Features 
python3 ../feature_generator/feature.py $inputfile2 Armadillo_5prime_Features
