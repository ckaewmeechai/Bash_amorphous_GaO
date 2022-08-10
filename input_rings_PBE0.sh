#!/bin/bash

number="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20"

template_file=temp.in
input_file=rings.in

Cell_dir=/home/ucapcka/Scratch/Rings_PBE0/Rings_pbe0_CR05/Cell_pbe0
Structure_dir=/home/ucapcka/Scratch/Rings_PBE0/Rings_pbe0_CR05/structure_xyz_pbe0

subdir=data
option_files=options

for i in $number ; do
    work_dir=number_st${i}
    subdir='data'
    if [ ! -d $work_dir ] ; then
        mkdir -p "$work_dir/$subdir"
    else
        rm -r $work_dir/*
    fi
    var1=$(sed -n '1p' $Cell_dir/Cell_st${i}.xyz)
    var2=$(sed -n '2p' $Cell_dir/Cell_st${i}.xyz)
    var3=$(sed -n '3p' $Cell_dir/Cell_st${i}.xyz)
    sed -e "s/numberst/${i}/g" \
        -e "s/LatA/$var1/g" \
        -e "s/LatB/$var2/g" \
        -e "s/LatC/$var3/g" \
        $template_file > $work_dir/$input_file
    cp $Structure_dir/GaO_st${i}.xyz $work_dir/$subdir
    cp $option_files $work_dir
done
