# Array multiplication speed test

This repo contains examples of multiplying two 100 million element arrays in five
programming languages:

1. C/C++ (written in C++ but uses C-style arrays)
1. Fortran 90
1. Rust
1. Python
1. Julia

To run the speed tests, you need to have installed:

* `g++` compiler (with at least C++11 standards)
* `gfortran` compiler
* `rustc` compiler for Rust
* `python` with the `numpy` package
* `julia`
* GNU Make
* Bash shell

To compile and run all tests, just call `make` in this directory.