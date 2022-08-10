#!/bin/bash

number="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20"

Cell_file=Cell.out
Cell_dir=Cell_pbe0_1st
Structure_dir=structure_xyz_pbe0_1st
Structure_file=GaO_st.xyz
work_dir=Rings_pbe0_1st

mkdir -p "$work_dir/$Cell_dir"
mkdir -p "$work_dir/$Structure_dir"

for i in $number ; do
    Pathdir=/work/e05/e05/ucapcka/STH_amorphous/STH_ST$i/Ov1_q+0_May
    grep 'CELL| Vector' $Pathdir/GaO.out | tail -3 | awk '{print $5,$6,$7}'  > $Pathdir/$Cell_file
    tail -402 $Pathdir/GaO-pos-1.xyz  > $Pathdir/GaO_st.xyz
    line=${i}
    #awk '{print $1,$2,$3}' $Cell_dir/$Cell_file > Cell_st$i.out
    cp $Pathdir/$Cell_file $work_dir/$Cell_dir/Cell_st${i}.xyz
    cp $Pathdir/$Structure_file $work_dir/$Structure_dir/GaO_st${i}.xyz
    #cp $option_files $work_dir
done
