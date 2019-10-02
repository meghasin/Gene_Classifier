#!/bin/bash

####
# Runs this project. Run as ./RunMe.sh
###
#####
# Step 1: Split fasta files (from the "Data" directory)
#           
#
cd fasta_splitter    #Change Directory
./run.sh             #run Fasta splitter script


#Check if splitted directories are created
while ! [[ -d 3prime_splitted ]] && [[ -d 5prime_splitted ]];do
    sleep 1      #Wait till files are splitted
    echo "Splitting files..."
done

sleep 3

if [[ -d 3prime_splitted ]] && [[ -d 5prime_splitted ]]
then
    echo "Done Splitting files !!"
fi

#Move to main Directory
cd ..
#
#
# Step 2: Assign splitted files as batches to Sun grid engine for parallel processing

cd sun_grid_engine_arrayjobs_example
./run.sh

while ! [[ -d Armadillo_3prime_Features ]] && [[ -d Armadillo_5prime_Features ]];do
    echo "Extracting features..."
done 

#sleep 2
#while ! [[  "$(ls -A Armadillo_3prime_Features)" ]] && [[  "$(ls -A Armadillo_5prime_Features)" ]]; do
#    echo "files not exist"
#    sleep 1
#done

#if [[ -d Armadillo_3prime_Features ]] && [[ -d Armadillo_5prime_Features ]]
#then
#    echo "Done extracting features !!"
#fi
cd ..

cd merge_files
./merge_feature_files.sh
sleep 2

cd ..
cd SVM-example
./call_quick_svm.sh


cd ..