function[sum2] = generalSimpson(f, a, b, eps)
h = (b - a) / 2;
sum1 = simpson(f, a, b);
flag = true;
while(flag)
    sum2 = 0;
    x = a:h:b;
    for i = 2:length(x)
        sum2 = sum2 + simpson(f, x(i-1), x(i));
    end
    flag = abs(sum1 - sum2) > 15*eps;
    sum1 = sum2;
    h = h/2;
end
end


function[val] = simpson(f, a, b)
val = (b-a)/6 * (f(a) + 4*f((a+b)/2) + f(b));
end