// Compile with rustc -C opt-level=3 -r rust-arraymult arraymult.rs
// for best performance - lowering the opt level below 2 has significant
// performance hits.
//
// Time on an i7-4790 (3.6 GHz) with optlevel=3: ~460 ms to populate, ~125 ms to multiply
use std::time::Instant;

fn vec_mult(x: &mut Vec<f64>, y: &Vec<f64>) {
    for i in 0..(x.len() - 1) {
        x[i] = x[i] * y[i];
    }

}

fn run_test() -> u128 {
    let t1 = Instant::now();
    const N: usize = 1e8 as usize;
    let mut v1: Vec<f64> = vec![0.0; N];
    let mut v2: Vec<f64> = vec![0.0; N];
    println!("   * Time for allocation: {} ms", t1.elapsed().as_millis());

    let t2 = Instant::now();
    for i in 0..(N-1) {
        v1[i] = i as f64;
        v2[i] = 2.0*i as f64;
    }
    println!("   * Time to populate vectors: {} ms", t2.elapsed().as_millis());
    
    let t3 = Instant::now();
    vec_mult(&mut v1, &mut v2);
    println!("   * Time to multiply vectors: {} ms", t3.elapsed().as_millis());

    return t1.elapsed().as_millis();
}


fn main() {
    let mut ttot = 0;
    for i in 0..5 {
        println!("Test {}/{}", i+1, 5);
        ttot += run_test();
    }

    let tmean = (ttot as f64)/5.0;
    println!("Mean overall time = {} ms", tmean);
}