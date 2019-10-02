#!/bin/bash

# exporting library location no longer necessary on ACTF
# export R_LIBS=$R_LIBS:/local/cluster/R_Packages/3.3

class1Examples=../merge_files/Armadillo_3prime_Features.txt
class2Examples=../merge_files/Armadillo_5prime_Features.txt

Rscript quick_svm.R $class1Examples $class2Examples
