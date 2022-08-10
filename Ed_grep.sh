#!/bin/bash

number="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20"

out_file=Ed_sum.txt

for i in $number ; do
    work_dir=STH_ST${i}

    line=${i}
    var1=$(grep 'ENERGY' /work/e05/e05/ucapcka/STH_05_amorphous/$work_dir/GaO.out | tail -1 | awk '{print $9}');
    printf "%10.0f  %10.4f" $i $var1 >> $out_file
    printf "\n" >> $out_file
done
