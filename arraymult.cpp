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

int64_t array_test(int j) {
    int n = 100000000;
    float* a = (float*)malloc(n*sizeof(float));
    float* b = (float*)malloc(n*sizeof(float));
    auto t1 = high_resolution_clock::now();
    float* c = (float*)malloc(n*sizeof(float));
    auto t2 = high_resolution_clock::now();
    auto dur12 = duration_cast<milliseconds>(t2-t1);
    std::cout << "   * Allocation time = " << dur12.count() << " ms" << std::endl;

    auto t5 = high_resolution_clock::now();
    for(int i=0; i<n; ++i){
        a[i] = i;
        b[i] = 2*i;
    }
    auto t6 = high_resolution_clock::now();
    auto dur56 = duration_cast<milliseconds>(t6-t5);
    std::cout << "   * Population time = " << dur56.count() << " ms" << std::endl;

    auto t3 = high_resolution_clock::now();
    array_mult(a,b,c,n);
    auto t4 = high_resolution_clock::now();
    auto dur34 = duration_cast<milliseconds>(t4 - t3);
    std::cout << "   * Multiplication time = " << dur34.count() << " ms" << std::endl;

    // This seems necessary on some compilers, or they will optimize away the whole function
    std::cout << " DEBUG: c[100] = " << c[100] << std::endl;

    free(a);
    free(b);
    free(c);

    auto dur = duration_cast<milliseconds>(t4 - t1);
    return dur.count();
}


int main() {
    double ttot = 0;
    for(int j=0; j<5; ++j){
        std::cout << " Loop " << j+1 << "/5" << std::endl;
        ttot += array_test(j);
    }
    double tmean = ttot / 5;
    std::cout << "Mean overall time = " << tmean << " ms" << std::endl;
}
