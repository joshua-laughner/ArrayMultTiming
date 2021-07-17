// Compile with: g++ -O3 -std=c++11 arraymult.cpp -o cpp-arraymult
// then run with ./cpp-arraymult
// All libraries should be standard in C++11.
// 
#include <chrono>
#include <iostream>
#include <stdlib.h>

using namespace std::chrono;

void array_mult(float* a, float* b, float* c, int n){
    for(int i=0; i<n; ++i){
        c[i] = a[i] * b[i];
    }
}


int main() {
    int n = 100000000;
    float* a = (float*)malloc(n*sizeof(float));
    float* b = (float*)malloc(n*sizeof(float));
    auto t1 = high_resolution_clock::now();
    float* c = (float*)malloc(n*sizeof(float));
    auto t2 = high_resolution_clock::now();
    auto dur = duration_cast<microseconds>(t2-t1);
    std::cout << "Allocation time = " << dur.count() << " us" << std::endl;

    for(int i=0; i<n; ++i){
        a[i] = i;
        b[i] = 2*i;
    }

    for(int j=0; j<5; ++j){
        auto t1 = high_resolution_clock::now();
        array_mult(a,b,c,n);
        auto t2 = high_resolution_clock::now();
        auto dur = duration_cast<milliseconds>(t2 - t1);
        std::cout << "Time to multiply in loop " << j << " time = " << dur.count() << " ms" << std::endl;
    }
}
