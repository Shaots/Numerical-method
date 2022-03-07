function[sum2] = generalGauss(f, a, b, eps)
flag = true;
h = b-a;
while(flag)
    x = a:h:b;
    sum1 = 0;
    for i = 1 : (length(x) - 1)
        sum1 = sum1 + gaussianQuadrature(f, x(i), x(i + 1));
    end
    
    xx = a:h/2:b;
    sum2 = 0;
    for i = 1 : (length(xx) - 1)
        sum2 = sum2 + gaussianQuadrature(f, xx(i), xx(i + 1));
    end
    flag = abs(sum1-sum2) > 255 * eps;
    
    h = h/2;
end
end

function[value] = gaussianQuadrature(f, a, b)
    point = [-1/3 * sqrt(5 + 2 * sqrt(10/7)), -1/3 * sqrt(5 - 2 * sqrt(10/7)), 0, 1/3 * sqrt(5 - 2 * sqrt(10/7)), 1/3 * sqrt(5 + 2 * sqrt(10/7))];
    weight = [(322 - 13 * sqrt(70)) / 900, (322 + 13 * sqrt(70)) / 900, 128/225, (322 + 13 * sqrt(70)) / 900, (322 - 13 * sqrt(70)) / 900];
    A = zeros([1, 5]);
    for j = 1:5
        A(j) = f((point(j) + 1) .* (b - a) ./ 2 + a);
    end
    value = (b - a) / 2 * dot(A, weight);
end
