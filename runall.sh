#!/bin/bash

echo "============"
echo "     C++    "
echo "============"
echo ""

./cpp-arraymult

echo ""
echo ""
echo "============"
echo " Fortran 90 "
echo "============"
echo ""

./f90-arraymult

echo ""
echo ""
echo "============"
echo "    Rust    "
echo "============"
echo ""

./rs-arraymult

echo ""
echo ""
echo "============"
echo "   Python   "
echo "============"
echo ""

python arraymult.py

echo ""
echo ""
echo "============"
echo "   Julia    "
echo "============"
echo ""

julia arraymult.jl

echo ""
echo ""
echo "============"
echo "     R      "
echo "============"
echo ""

Rscript arraymult.r
