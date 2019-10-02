#!/bin/bash
#submit job to SGE via test.q

qsub test.q
printf "Extracting Features........"
while ! [[ -d Armadillo_3prime_Features ]];do
    sleep 2
    printf "." 
done
while ! [[ -d Armadillo_5prime_Features ]];do
    sleep 2
    printf "."
done
