#!/bin/bash

number=" 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20"

basis_file=BASIS_MOLOPT
potential_file=POTENTIAL
basis_admm=BASIS_ADMM_MOLOPT
template_file=GaO_temp.inp
input_file=GaO.inp
short=short_2.pbs
std=std_2.pbs
vector_file=Cell.out
structure_dir=/work/e05/e05/ucapcka/amorphous_PBE0_Cubic_CR1/structure_xyz_MQ

for i in $number ; do
    work_dir=amorphous_ST${i}
    if [ ! -d $work_dir ] ; then
        mkdir $work_dir
    else
        rm -r $work_dir/*
    fi
    line=${i}
    var1=$(awk -v line="$line" 'NR==line {print $2}' $vector_file);
    var2=$(awk -v line="$line" 'NR==line {print $3}' $vector_file);
    var3=$(awk -v line="$line" 'NR==line {print $4}' $vector_file);
    sed -e "s/LATA/$var1/g" \
        -e "s/LATB/$var2/g" \
        -e "s/LATC/$var3/g" \
        $template_file > $work_dir/$input_file
    cp  $basis_file $work_dir
    cp  $basis_admm $work_dir
    cp  $potential_file $work_dir
    cp  $short $work_dir
    cp  $std $work_dir
    cp  $structure_dir/GaO_st$i.xyz $work_dir/GaO.xyz
done
