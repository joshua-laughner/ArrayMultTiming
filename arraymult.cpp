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

void array_test(int j) {
    int n = 100000000;
    float* a = (float*)malloc(n*sizeof(float));
    float* b = (float*)malloc(n*sizeof(float));
    auto t1 = high_resolution_clock::now();
    float* c = (float*)malloc(n*sizeof(float));
    auto t2 = high_resolution_clock::now();
    auto dur12 = duration_cast<microseconds>(t2-t1);
    std::cout << "   * Allocation time = " << dur12.count() << " us" << std::endl;

    for(int i=0; i<n; ++i){
        a[i] = i+j;
        b[i] = 2*i+j;
    }

    auto t3 = high_resolution_clock::now();
    array_mult(a,b,c,n);
    auto t4 = high_resolution_clock::now();
    auto dur34 = duration_cast<milliseconds>(t4 - t3);
    std::cout << "   * Multiplication time = " << dur34.count() << " ms" << std::endl;

    free(a);
    free(b);
    free(c);
}


int main() {
    for(int j=0; j<5; ++j){
        std::cout << " Loop " << j+1 << "/5" << std::endl;
        array_test(j);
    }
}
