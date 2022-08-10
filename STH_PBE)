#!/bin/bash

number="1"

potential_file=GTH_POTENTIALS
template_file=STH_temp.inp
input_file=STH_GaO.inp
input_vector=Cell.out
var1=$(sed -n '1p' Cell.out)
var2=$(sed -n '2p' Cell.out)
var3=$(sed -n '3p' Cell.out)

    sed -e "s/LATA/$var1/g" \
        -e "s/LATB/$var2/g" \
        -e "s/LATC/$var3/g" \
        $template_file > $input_file
