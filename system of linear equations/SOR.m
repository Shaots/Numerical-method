function[x2] = SOR(B, f, omega, epsilon)
N = length(f);
x1 = zeros([1, N]);
x2 = zeros([1, N]);
flag = true;
while(flag)
    for i = 1:N
        sum = 0;
        for j = 1:(i-1)
            sum = sum + B(i,j)*x2(j);
        end
        for j = (i+1):N
            sum = sum + B(i,j)*x1(j);
        end
        x2(i) = (1-omega)*x1(i) + omega*(f(i)-sum)/B(i,i);
    end
    flag = norm(x1 - x2, inf) > epsilon;
    x1 = x2;
end