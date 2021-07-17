run: all
	./runall.sh

all: cpp-arraymult f90-arraymult rs-arraymult

clean: 
	rm -f cpp-arraymult f90-arraymult rs-arraymult

cpp-arraymult: arraymult.cpp
	g++ -O3 -std=c++11 $< -o $@

f90-arraymult: arraymult.f90
	gfortran -O3 $< -o $@

rs-arraymult: arraymult.rs
	rustc -C opt-level=3 -o $@ $<