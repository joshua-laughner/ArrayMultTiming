array_mult <- function() {
    start <- Sys.time()
    
    n <- 1e8;
    a <- as.numeric(array(1:n));
    b <- as.numeric(array(1:n));
    c <- as.numeric(array(1:n));

    dur_alloc = Sys.time() - start;

    for (i in 1:n) {
        c[i] = a[i] * b[i];
    }
    dur_mult <- Sys.time() - start;

    print(paste("  * Allocation/population time:", dur_alloc*1000, "ms"));
    print(paste("  * Multiplication time:", dur_mult*1000, "ms"));

    return(dur_alloc + dur_mult);
}

array_mult_vec <- function() {
    start <- Sys.time()
    
    n <- 1e8;
    a <- as.numeric(array(1:n));
    b <- as.numeric(array(1:n));
    
    dur_alloc = Sys.time() - start;

    start <- Sys.time()
    c = a * b;
    dur_mult <- Sys.time() - start;
    
    print(paste("  * Allocation/population time:", dur_alloc*1000, "ms"));
    print(paste("  * Multiplication time:", dur_mult*1000, "ms"));

    return(dur_alloc + dur_mult);
}

mean_dur = 0.0;
for (i in 1:3) {
    print(paste("For loop test ", i, "/ 3"));
    mean_dur <- mean_dur + array_mult();
}
print(paste("Mean alloc + mult time with for loop: ", mean_dur/3*1000, "ms"));

mean_dur = 0.0;
for (i in 1:5) {
    print(paste("Vectorized  test ", i, "/ 5"));
    mean_dur <- mean_dur + array_mult_vec();
}
print(paste("Mean alloc + mult with array mult: ", mean_dur/5*1000, "ms"));

