# Run with: julia arraymult.jl
# No special packages needed
function array_mult_test()
    a = 1:1e8;
    b = 2:2:2e8;

    timeme(array_mult_for_into_new, a, b, "Testing for-loop multiplication returning a new array")
    timeme_ip(array_mult_for_into_pre!, a, b, "Testing for-loop multiplication inplace")
    timeme(array_mult_broad_into_new, a, b, "Testing broadcast multiplication returning a new array")
    timeme_ip(array_mult_broad_into_pre!, a, b, "Testing broadcast multiplication inplace")
end

function timeme(fxn, a, b, msg, n=5)
    println(msg);
    for i = 1:n
        @time c = fxn(a,b)
    end
    println("")
end

function timeme_ip(fxn, a, b, msg, n=5)
    println(msg)
    c = zeros(size(a))
    for i = 1:n
        @time fxn(a,b,c)
    end
    println("")
end

function array_mult_for_into_new(a,b)
    c = zeros(size(a))
    for i in 1:length(a)
        c[i] = a[i] * b[i]
    end
    return c
end


function array_mult_for_into_pre!(a,b,c)
    for i in 1:length(a)
        c[i] = a[i] * b[i]
    end
end


function array_mult_broad_into_new(a,b)
    c = a .* b;
    return c
end


function array_mult_broad_into_pre!(a,b,c)
    c[:] .= a .* b;
end


array_mult_test()
